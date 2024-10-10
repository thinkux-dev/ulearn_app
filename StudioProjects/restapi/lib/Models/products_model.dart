class ProductsModel {
  ProductsModel({
      this.success, 
      this.message, 
      this.data,});

  ProductsModel.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  bool? success;
  String? message;
  List<Data>? data;
ProductsModel copyWith({  bool? success,
  String? message,
  List<Data>? data,
}) => ProductsModel(  success: success ?? this.success,
  message: message ?? this.message,
  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data {
  Data({
      this.id, 
      this.onSale, 
      this.salePercent, 
      this.sold, 
      this.sliderNew, 
      this.sliderRecent, 
      this.sliderSold, 
      this.date, 
      this.title, 
      this.categories, 
      this.subcat, 
      this.shop, 
      this.price, 
      this.saleTitle, 
      this.salePrice, 
      this.description, 
      this.color, 
      this.size, 
      this.inWishlist, 
      this.images,});

  Data.fromJson(dynamic json) {
    id = json['_id'];
    onSale = json['on_sale'];
    salePercent = json['sale_percent'];
    sold = json['sold'];
    sliderNew = json['slider_new'];
    sliderRecent = json['slider_recent'];
    sliderSold = json['slider_sold'];
    date = json['date'];
    title = json['title'];
    categories = json['categories'] != null ? Categories.fromJson(json['categories']) : null;
    subcat = json['subcat'] != null ? Subcat.fromJson(json['subcat']) : null;
    shop = json['shop'] != null ? Shop.fromJson(json['shop']) : null;
    price = json['price'];
    saleTitle = json['sale_title'];
    salePrice = json['sale_price'];
    description = json['description'];
    color = json['color'];
    size = json['size'];
    inWishlist = json['in_wishlist'];
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images?.add(Images.fromJson(v));
      });
    }
  }
  String? id;
  bool? onSale;
  num? salePercent;
  num? sold;
  bool? sliderNew;
  bool? sliderRecent;
  bool? sliderSold;
  String? date;
  String? title;
  Categories? categories;
  Subcat? subcat;
  Shop? shop;
  String? price;
  String? saleTitle;
  String? salePrice;
  String? description;
  String? color;
  String? size;
  bool? inWishlist;
  List<Images>? images;
Data copyWith({  String? id,
  bool? onSale,
  num? salePercent,
  num? sold,
  bool? sliderNew,
  bool? sliderRecent,
  bool? sliderSold,
  String? date,
  String? title,
  Categories? categories,
  Subcat? subcat,
  Shop? shop,
  String? price,
  String? saleTitle,
  String? salePrice,
  String? description,
  String? color,
  String? size,
  bool? inWishlist,
  List<Images>? images,
}) => Data(  id: id ?? this.id,
  onSale: onSale ?? this.onSale,
  salePercent: salePercent ?? this.salePercent,
  sold: sold ?? this.sold,
  sliderNew: sliderNew ?? this.sliderNew,
  sliderRecent: sliderRecent ?? this.sliderRecent,
  sliderSold: sliderSold ?? this.sliderSold,
  date: date ?? this.date,
  title: title ?? this.title,
  categories: categories ?? this.categories,
  subcat: subcat ?? this.subcat,
  shop: shop ?? this.shop,
  price: price ?? this.price,
  saleTitle: saleTitle ?? this.saleTitle,
  salePrice: salePrice ?? this.salePrice,
  description: description ?? this.description,
  color: color ?? this.color,
  size: size ?? this.size,
  inWishlist: inWishlist ?? this.inWishlist,
  images: images ?? this.images,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['on_sale'] = onSale;
    map['sale_percent'] = salePercent;
    map['sold'] = sold;
    map['slider_new'] = sliderNew;
    map['slider_recent'] = sliderRecent;
    map['slider_sold'] = sliderSold;
    map['date'] = date;
    map['title'] = title;
    if (categories != null) {
      map['categories'] = categories?.toJson();
    }
    if (subcat != null) {
      map['subcat'] = subcat?.toJson();
    }
    if (shop != null) {
      map['shop'] = shop?.toJson();
    }
    map['price'] = price;
    map['sale_title'] = saleTitle;
    map['sale_price'] = salePrice;
    map['description'] = description;
    map['color'] = color;
    map['size'] = size;
    map['in_wishlist'] = inWishlist;
    if (images != null) {
      map['images'] = images?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Images {
  Images({
      this.id, 
      this.url,});

  Images.fromJson(dynamic json) {
    id = json['id'];
    url = json['url'];
  }
  String? id;
  String? url;
Images copyWith({  String? id,
  String? url,
}) => Images(  id: id ?? this.id,
  url: url ?? this.url,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['url'] = url;
    return map;
  }

}

class Shop {
  Shop({
      this.id, 
      this.isActive, 
      this.createdAt, 
      this.name, 
      this.description, 
      this.shopemail, 
      this.shopaddress, 
      this.shopcity, 
      this.userid, 
      this.image,});

  Shop.fromJson(dynamic json) {
    id = json['_id'];
    isActive = json['is_active'];
    createdAt = json['created_At'];
    name = json['name'];
    description = json['description'];
    shopemail = json['shopemail'];
    shopaddress = json['shopaddress'];
    shopcity = json['shopcity'];
    userid = json['userid'];
    image = json['image'];
  }
  String? id;
  bool? isActive;
  String? createdAt;
  String? name;
  String? description;
  String? shopemail;
  String? shopaddress;
  String? shopcity;
  String? userid;
  String? image;
Shop copyWith({  String? id,
  bool? isActive,
  String? createdAt,
  String? name,
  String? description,
  String? shopemail,
  String? shopaddress,
  String? shopcity,
  String? userid,
  String? image,
}) => Shop(  id: id ?? this.id,
  isActive: isActive ?? this.isActive,
  createdAt: createdAt ?? this.createdAt,
  name: name ?? this.name,
  description: description ?? this.description,
  shopemail: shopemail ?? this.shopemail,
  shopaddress: shopaddress ?? this.shopaddress,
  shopcity: shopcity ?? this.shopcity,
  userid: userid ?? this.userid,
  image: image ?? this.image,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['is_active'] = isActive;
    map['created_At'] = createdAt;
    map['name'] = name;
    map['description'] = description;
    map['shopemail'] = shopemail;
    map['shopaddress'] = shopaddress;
    map['shopcity'] = shopcity;
    map['userid'] = userid;
    map['image'] = image;
    return map;
  }

}

class Subcat {
  Subcat({
      this.id, 
      this.type, 
      this.salePercent, 
      this.date, 
      this.name,});

  Subcat.fromJson(dynamic json) {
    id = json['_id'];
    type = json['type'];
    salePercent = json['sale_percent'];
    date = json['date'];
    name = json['name'];
  }
  String? id;
  String? type;
  num? salePercent;
  String? date;
  String? name;
Subcat copyWith({  String? id,
  String? type,
  num? salePercent,
  String? date,
  String? name,
}) => Subcat(  id: id ?? this.id,
  type: type ?? this.type,
  salePercent: salePercent ?? this.salePercent,
  date: date ?? this.date,
  name: name ?? this.name,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['type'] = type;
    map['sale_percent'] = salePercent;
    map['date'] = date;
    map['name'] = name;
    return map;
  }

}

class Categories {
  Categories({
      this.id, 
      this.type, 
      this.salePercent, 
      this.date, 
      this.name, 
      this.image,});

  Categories.fromJson(dynamic json) {
    id = json['_id'];
    type = json['type'];
    salePercent = json['sale_percent'];
    date = json['date'];
    name = json['name'];
    image = json['image'];
  }
  String? id;
  String? type;
  num? salePercent;
  String? date;
  String? name;
  String? image;
Categories copyWith({  String? id,
  String? type,
  num? salePercent,
  String? date,
  String? name,
  String? image,
}) => Categories(  id: id ?? this.id,
  type: type ?? this.type,
  salePercent: salePercent ?? this.salePercent,
  date: date ?? this.date,
  name: name ?? this.name,
  image: image ?? this.image,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['type'] = type;
    map['sale_percent'] = salePercent;
    map['date'] = date;
    map['name'] = name;
    map['image'] = image;
    return map;
  }

}