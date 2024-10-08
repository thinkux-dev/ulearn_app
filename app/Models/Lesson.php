<?php

namespace App\Models;

use Encore\Admin\Traits\DefaultDatetimeFormat;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Lesson extends Model
{
    use HasFactory;
    use DefaultDatetimeFormat;

    protected $casts = [
        'video'=>'json'
    ];

    public function setVideoAttribute($value){
        //the below method json_encode converts the object to json from array
        /*
            'a'=>'val1',
            'b'=>'val2',
            ........
            {
                'a':'val1',
                'b':'val2',
            }
        */
        $this->attributes['video'] = json_encode(array_values($value));
    }

    public function getVideoAttribute($value){
        $resultVideo = json_decode($value, true)?:[];

        if(!empty($resultVideo)){
            foreach($resultVideo as $k=>$v){
                $resultVideo[$k]["url"]=$v["url"];
                $resultVideo[$k]["thumbnail"]=$v["thumbnail"];
            }
        }

        return $resultVideo;
    }
}