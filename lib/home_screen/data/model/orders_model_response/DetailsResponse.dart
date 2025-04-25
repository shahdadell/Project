/// status : "success"
/// data : [{"itemsprice":"30","countitems":"1","cart_id":"503","cart_usersid":"890","cart_itemsid":"1","cart_orders":"169","cart_quantity":"2","items_id":"1","service_id":"1","items_name":"Fried Chicken Meal","items_name_ar":"وجبة دجاج مقلية","items_des":"A delicious meal of fried chicken served with rice or fries, salad, and a drink.","items_des_ar":"وجبة لذيذة من الدجاج المقلي تقدم مع الأرز أو البطاطس المقلية، سلطة، ومشروب.","items_image":"https://abdulrahmanantar.com/outbye/upload/items/fried chicken meal.jpeg","items_count":"40","items_active":"1","items_price":"120","items_discount":"75","items_date":"2025-01-26 04:00:00","items_cat":"4"},{"itemsprice":"162","countitems":"1","cart_id":"505","cart_usersid":"890","cart_itemsid":"56","cart_orders":"169","cart_quantity":"2","items_id":"56","service_id":"1","items_name":"Mixed Grill Platter","items_name_ar":"طبق مشاوي مشكل","items_des":"A platter of mixed grilled meats including kofta, chicken, and lamb chops.","items_des_ar":"طبق مشاوي مشكل يحتوي على كفتة، دجاج، وقطع لحم ضأن.","items_image":"https://abdulrahmanantar.com/outbye/upload/items/mixed girral .jpg","items_count":"25","items_active":"1","items_price":"180","items_discount":"10","items_date":"2025-02-13 19:59:57","items_cat":"4"},{"itemsprice":"76.5","countitems":"1","cart_id":"506","cart_usersid":"890","cart_itemsid":"58","cart_orders":"169","cart_quantity":"5","items_id":"58","service_id":"1","items_name":"Vegetarian Pizza","items_name_ar":"بيتزا نباتية","items_des":"A pizza topped with fresh vegetables and mozzarella cheese.","items_des_ar":"بيتزا مغطاة بالخضروات الطازجة وجبنة الموزاريلا.","items_image":"https://abdulrahmanantar.com/outbye/upload/items/-veggie-pizza-f-2.jpg","items_count":"30","items_active":"1","items_price":"90","items_discount":"15","items_date":"2025-02-13 19:59:57","items_cat":"4"}]

class DetailsResponse {
  DetailsResponse({
    this.status,
    this.data,
  });

  DetailsResponse.fromJson(dynamic json) {
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  String? status;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// itemsprice : "30"
/// countitems : "1"
/// cart_id : "503"
/// cart_usersid : "890"
/// cart_itemsid : "1"
/// cart_orders : "169"
/// cart_quantity : "2"
/// items_id : "1"
/// service_id : "1"
/// items_name : "Fried Chicken Meal"
/// items_name_ar : "وجبة دجاج مقلية"
/// items_des : "A delicious meal of fried chicken served with rice or fries, salad, and a drink."
/// items_des_ar : "وجبة لذيذة من الدجاج المقلي تقدم مع الأرز أو البطاطس المقلية، سلطة، ومشروب."
/// items_image : "https://abdulrahmanantar.com/outbye/upload/items/fried chicken meal.jpeg"
/// items_count : "40"
/// items_active : "1"
/// items_price : "120"
/// items_discount : "75"
/// items_date : "2025-01-26 04:00:00"
/// items_cat : "4"

class Data {
  Data({
    this.itemsprice,
    this.countitems,
    this.cartId,
    this.cartUsersid,
    this.cartItemsid,
    this.cartOrders,
    this.cartQuantity,
    this.itemsId,
    this.serviceId,
    this.itemsName,
    this.itemsNameAr,
    this.itemsDes,
    this.itemsDesAr,
    this.itemsImage,
    this.itemsCount,
    this.itemsActive,
    this.itemsPrice,
    this.itemsDiscount,
    this.itemsDate,
    this.itemsCat,
  });

  Data.fromJson(dynamic json) {
    itemsprice = json['itemsprice'];
    countitems = json['countitems'];
    cartId = json['cart_id'];
    cartUsersid = json['cart_usersid'];
    cartItemsid = json['cart_itemsid'];
    cartOrders = json['cart_orders'];
    cartQuantity = json['cart_quantity'];
    itemsId = json['items_id'];
    serviceId = json['service_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDes = json['items_des'];
    itemsDesAr = json['items_des_ar'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsDate = json['items_date'];
    itemsCat = json['items_cat'];
  }
  String? itemsprice;
  String? countitems;
  String? cartId;
  String? cartUsersid;
  String? cartItemsid;
  String? cartOrders;
  String? cartQuantity;
  String? itemsId;
  String? serviceId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDes;
  String? itemsDesAr;
  String? itemsImage;
  String? itemsCount;
  String? itemsActive;
  String? itemsPrice;
  String? itemsDiscount;
  String? itemsDate;
  String? itemsCat;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['itemsprice'] = itemsprice;
    map['countitems'] = countitems;
    map['cart_id'] = cartId;
    map['cart_usersid'] = cartUsersid;
    map['cart_itemsid'] = cartItemsid;
    map['cart_orders'] = cartOrders;
    map['cart_quantity'] = cartQuantity;
    map['items_id'] = itemsId;
    map['service_id'] = serviceId;
    map['items_name'] = itemsName;
    map['items_name_ar'] = itemsNameAr;
    map['items_des'] = itemsDes;
    map['items_des_ar'] = itemsDesAr;
    map['items_image'] = itemsImage;
    map['items_count'] = itemsCount;
    map['items_active'] = itemsActive;
    map['items_price'] = itemsPrice;
    map['items_discount'] = itemsDiscount;
    map['items_date'] = itemsDate;
    map['items_cat'] = itemsCat;
    return map;
  }
}
