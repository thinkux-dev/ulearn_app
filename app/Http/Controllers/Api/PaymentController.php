<?php

namespace App\Http\Controllers\Api;

use Illuminate\Support\Facades\Log;
use Illuminate\Support\Carbon;
use App\Http\Controllers\Controller;
use App\Models\Course;
use App\Models\Order;
use Illuminate\Http\Request;
use Stripe\Webhook;
use Stripe\Customer;
use Stripe\Price;
use Stripe\Stripe;
use Stripe\Checkout\Session;
use Stripe\Exception\UnexpectedValueException;
use Stripe\Exception\SignatureVerificationException;

class PaymentController extends Controller
{
    //
    public function checkOut(Request $request){
        try{
            //this is to get the course that user buys
            $courseId = $request->id;
            $user = $request->user();
            $token = $user->token;

            //get stripe key
            Stripe::setApiKey(
                "sk_test_51Q6MluKGHBCR3csxDGPiSOjFbxCaJmE9xTmAo2OwVx52R9J4dSnXqCng2jEfAXrKij6BrYzsLH377a9jnRMm5ZoO00LycQDgeP"
            );

            $searchCourse = Course::where('id', "=", $courseId)->first();

            if(empty($searchCourse)){
                return response()->json([
                    'code'=>204,
                    'msg'=>'No Course found',
                    'data'=>"",
                ], 200);
            }

            $orderMap = [];
            $orderMap["course_id"] = $courseId;
            $orderMap["user_token"] = $token;
            /*
                status = 1 means successful order
            */
            $orderMap["status"] = 1;
            $orderRes = Order::where($orderMap)->first();
            /*
                if we fall in the below condition, it means we already have an order from same user 
                with the same course id
            */
            if(!empty($orderRes)){
                return response()->json([
                    'code'=>409, //409 means "conflicting"
                    'msg'=>'The order already exist',
                    'data'=>"",
                ],200 );
            }

            $your_domain = env('APP_URL');
            $map = [];
            $map['user_token'] = $token;
            $map['course_id'] = $courseId;
            $map['total_amount'] = $searchCourse->price;
            $map['status'] = 0;
            $map['created_at'] = Carbon::now();
            
            $orderNum = Order::insertGetId($map);

            $checkOutSession = Session::create([
                'line_items' => [[
                    'price_data'=>[
                        'currency'=>'USD',
                        'product_data'=>[
                            'name'=>$searchCourse->name,
                            'description'=>$searchCourse->description,
                        ],
                        'unit_amount'=>intval(($searchCourse->price)*100)
                    ],
                    'quantity'=>1,
                ]],
                'payment_intent_data'=>[
                    'metadata'=>[
                        'order_num'=>$orderNum,
                        'user_token'=>$token,
                    ],
                ],
                'metadata'=>[
                    'order_num'=>$orderNum,
                    'user_token'=>$token,
                ],
                'mode'=>'payment',
                'success_url'=>$your_domain.'success',
                'cancel_url'=>$your_domain.'cancel'
            ]);

            return response()->json([
                'code'=>200,
                'msg'=>'Order has been placed',
                'data'=>$checkOutSession->url,
            ],200);

        } catch(\Throwable $th){
            return response()->json([
                'status' => false,
                'message' => $th->getMessage()
            ], 500);
        }

    }

    public function webGoHooks(){
        Log::info('starts here.....');
        Stripe::setApiKey('sk_test_51Q6MluKGHBCR3csxDGPiSOjFbxCaJmE9xTmAo2OwVx52R9J4dSnXqCng2jEfAXrKij6BrYzsLH377a9jnRMm5ZoO00LycQDgeP');
        $endPointSecret = 'whsec_keeI44hEzrKqaRSVnGZ1Uiwlt33zuvFW';
        $payload = @file_get_contents('php://input');
        $sigHeader = $_SERVER['HTTP_STRIPE_SIGNATURE'];
        $event = null;
        Log::info('set up buffer and handshake done....');
        try{
            $event = \Stripe\Webhook::constructEvent(
                $payload,
                $sigHeader,
                $endPointSecret
            );

        }catch(\UnexpectedValueException $e){
            Log::info('UnexpectedValueException '.$e);
            http_response_code(400);
            exit();
        }catch(\Stripe\Exception\SignatureVerificationException $e){
            Log::info('SignatureVerificationException '.$e);
            http_response_code(400);
            exit();
        }

        if($event->type=="charge.succeeded"){
            $session = $event->data->object;
            $metadata = $session["metadata"];
            $orderNum = $metadata->order_num;
            $userToken = $metadata->user_token;
            Log::info('order id'.$orderNum);
            $map = [];
            $map['status'] = 1;
            $map['updated_at'] = Carbon::now();
            $whereMap = [];
            $whereMap['user_token'] = $userToken;
            $whereMap['id'] = $orderNum;
            Order::where($whereMap)->update($map);
        }

        http_response_code(200);
    }
}
