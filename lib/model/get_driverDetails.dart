class getDriver {
  Drivers drivers;

  getDriver({this.drivers});

  getDriver.fromJson(Map<String, dynamic> json) {
    drivers =
        json['drivers'] != null ? new Drivers.fromJson(json['drivers']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.drivers != null) {
      data['drivers'] = this.drivers.toJson();
    }
    return data;
  }
}

class Drivers {
  String driverId;
  int driverCommissionFlag;
  String driverName;
  Null staffImage;
  int floatAmt;
  String pickedOrdersCount;
  String deliveredOrdersCount;
  List<Orders> orders;

  Drivers(
      {this.driverId,
      this.driverCommissionFlag,
      this.driverName,
      this.staffImage,
      this.floatAmt,
      this.pickedOrdersCount,
      this.deliveredOrdersCount,
      this.orders});

  Drivers.fromJson(Map<String, dynamic> json) {
    driverId = json['driver_id'];
    driverCommissionFlag = json['driver_commission_flag'];
    driverName = json['driver_name'];
    staffImage = json['staff_image'];
    floatAmt = json['float_amt'];
    pickedOrdersCount = json['picked_orders_count'];
    deliveredOrdersCount = json['delivered_orders_count'];
    if (json['orders'] != null) {
      orders = new List<Orders>();
      json['orders'].forEach((v) {
        orders.add(new Orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['driver_id'] = this.driverId;
    data['driver_commission_flag'] = this.driverCommissionFlag;
    data['driver_name'] = this.driverName;
    data['staff_image'] = this.staffImage;
    data['float_amt'] = this.floatAmt;
    data['picked_orders_count'] = this.pickedOrdersCount;
    data['delivered_orders_count'] = this.deliveredOrdersCount;
    if (this.orders != null) {
      data['orders'] = this.orders.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Orders {
  String pickedOrders;
  String status;
  String pickedTime;
  int timer;
  String orderId;
  String datetime;
  String receivedAmount;
  String amount;
  int paymentStatus;
  double change;
  String paymentMode;
  String orderitems;
  String customerName;
  String phoneNumber;
  String doorNum;
  String address1;
  Null address2;
  String town;
  String postcode;
  String latitude;
  String langitude;
  String distance;
  String orderType;
  String deviceCode;
  String orderTypes;
  String tokenId;
  String guestCount;
  String taxAmount;
  String subtotalAmount;
  String extraServiceCharge;
  String extraServiceTemCharge;
  String extraServiceTax;
  int deliveryCharges;
  String deliveryTax;
  List<Null> deliveryTaxDetail;
  String taxOnBill;
  List<Null> orderTaxDetails;
  String orderTaxFlag;
  String totalBill;
  int specialDisAmt;
  int redeemLoyaltyPoints;
  int totalRedeemLoyaltyAmount;
  List<Null> extraChargeDetails;
  int giftcardAmount;
  int couponDiscount;
  int staffDiscount;
  int discountOnBill;
  int driverCommission;
  List<Items> items;

  Orders(
      {this.pickedOrders,
      this.status,
      this.pickedTime,
      this.timer,
      this.orderId,
      this.datetime,
      this.receivedAmount,
      this.amount,
      this.paymentStatus,
      this.change,
      this.paymentMode,
      this.orderitems,
      this.customerName,
      this.phoneNumber,
      this.doorNum,
      this.address1,
      this.address2,
      this.town,
      this.postcode,
      this.latitude,
      this.langitude,
      this.distance,
      // this.orderType,
      this.deviceCode,
      // this.orderType,
      this.tokenId,
      this.guestCount,
      this.taxAmount,
      this.subtotalAmount,
      this.extraServiceCharge,
      this.extraServiceTemCharge,
      this.extraServiceTax,
      this.deliveryCharges,
      this.deliveryTax,
      this.deliveryTaxDetail,
      this.taxOnBill,
      this.orderTaxDetails,
      this.orderTaxFlag,
      this.totalBill,
      this.specialDisAmt,
      this.redeemLoyaltyPoints,
      this.totalRedeemLoyaltyAmount,
      this.extraChargeDetails,
      this.giftcardAmount,
      this.couponDiscount,
      this.staffDiscount,
      this.discountOnBill,
      this.driverCommission,
      this.items});

  Orders.fromJson(Map<String, dynamic> json) {
    pickedOrders = json['picked_orders'];
    status = json['status'];
    pickedTime = json['picked_time'];
    timer = json['timer'];
    orderId = json['order_id'];
    datetime = json['datetime'];
    receivedAmount = json['receivedAmount'];
    amount = json['amount'];
    paymentStatus = json['payment_status'];
    change = json['change'];
    paymentMode = json['payment_mode'];
    orderitems = json['orderitems'];
    customerName = json['customer_name'];
    phoneNumber = json['phone_number'];
    doorNum = json['door_num'];
    address1 = json['address1'];
    address2 = json['address2'];
    town = json['town'];
    postcode = json['postcode'];
    latitude = json['latitude'];
    langitude = json['langitude'];
    distance = json['distance'];
    orderType = json['OrderType'];
    deviceCode = json['device_code'];
    orderType = json['order_type'];
    tokenId = json['token_id'];
    guestCount = json['guest_count'];
    taxAmount = json['tax_amount'];
    subtotalAmount = json['subtotal_amount'];
    extraServiceCharge = json['extra_service_charge'];
    extraServiceTemCharge = json['extra_service_tem_charge'];
    extraServiceTax = json['extra_service_tax'];
    deliveryCharges = json['delivery_charges'];
    deliveryTax = json['delivery_tax'];
    // if (json['delivery_tax_detail'] != null) {
    //   deliveryTaxDetail = new List<Null>();
    //   json['delivery_tax_detail'].forEach((v) {
    //     deliveryTaxDetail.add(new Null.fromJson(v));
    //   });
    // }
    taxOnBill = json['tax_on_bill'];
    // if (json['order_tax_details'] != null) {
    //   orderTaxDetails = new List<Null>();
    //   json['order_tax_details'].forEach((v) {
    //     orderTaxDetails.add(new Null.fromJson(v));
    //   });
    // }
    orderTaxFlag = json['order_tax_flag'];
    totalBill = json['total_bill'];
    specialDisAmt = json['special_dis_amt'];
    redeemLoyaltyPoints = json['redeem_loyalty_points'];
    totalRedeemLoyaltyAmount = json['total_redeem_loyalty_amount'];
    // if (json['extra_charge_details'] != null) {
    //   extraChargeDetails = new List<Null>();
    //   json['extra_charge_details'].forEach((v) {
    //     extraChargeDetails.add(new Null.fromJson(v));
    //   });
    // }
    giftcardAmount = json['giftcard_amount'];
    couponDiscount = json['coupon_discount'];
    staffDiscount = json['staff_discount'];
    discountOnBill = json['discount_on_bill'];
    driverCommission = json['driver_commission'];
    if (json['items'] != null) {
      items = new List<Items>();
      json['items'].forEach((v) {
        items.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['picked_orders'] = this.pickedOrders;
    data['status'] = this.status;
    data['picked_time'] = this.pickedTime;
    data['timer'] = this.timer;
    data['order_id'] = this.orderId;
    data['datetime'] = this.datetime;
    data['receivedAmount'] = this.receivedAmount;
    data['amount'] = this.amount;
    data['payment_status'] = this.paymentStatus;
    data['change'] = this.change;
    data['payment_mode'] = this.paymentMode;
    data['orderitems'] = this.orderitems;
    data['customer_name'] = this.customerName;
    data['phone_number'] = this.phoneNumber;
    data['door_num'] = this.doorNum;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['town'] = this.town;
    data['postcode'] = this.postcode;
    data['latitude'] = this.latitude;
    data['langitude'] = this.langitude;
    data['distance'] = this.distance;
    data['OrderType'] = this.orderType;
    data['device_code'] = this.deviceCode;
    data['order_type'] = this.orderType;
    data['token_id'] = this.tokenId;
    data['guest_count'] = this.guestCount;
    data['tax_amount'] = this.taxAmount;
    data['subtotal_amount'] = this.subtotalAmount;
    data['extra_service_charge'] = this.extraServiceCharge;
    data['extra_service_tem_charge'] = this.extraServiceTemCharge;
    data['extra_service_tax'] = this.extraServiceTax;
    data['delivery_charges'] = this.deliveryCharges;
    data['delivery_tax'] = this.deliveryTax;
    // if (this.deliveryTaxDetail != null) {
    //   data['delivery_tax_detail'] =
    //       this.deliveryTaxDetail.map((v) => v.toJson()).toList();
    // }
    data['tax_on_bill'] = this.taxOnBill;
    // if (this.orderTaxDetails != null) {
    //   data['order_tax_details'] =
    //       this.orderTaxDetails.map((v) => v.toJson()).toList();
    // }
    data['order_tax_flag'] = this.orderTaxFlag;
    data['total_bill'] = this.totalBill;
    data['special_dis_amt'] = this.specialDisAmt;
    data['redeem_loyalty_points'] = this.redeemLoyaltyPoints;
    data['total_redeem_loyalty_amount'] = this.totalRedeemLoyaltyAmount;
    // if (this.extraChargeDetails != null) {
    //   data['extra_charge_details'] =
    //       this.extraChargeDetails.map((v) => v.toJson()).toList();
    // }
    data['giftcard_amount'] = this.giftcardAmount;
    data['coupon_discount'] = this.couponDiscount;
    data['staff_discount'] = this.staffDiscount;
    data['discount_on_bill'] = this.discountOnBill;
    data['driver_commission'] = this.driverCommission;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int voucherStatus;
  String voucherCode;
  String itemUID;
  int isSplitItem;
  int guest;
  String insertId;
  String itemid;
  String type;
  String itemname;
  double price;
  int itemTax;
  Null offerType;
  String size;
  String quantity;
  String voidStatus;
  String actualPrice;
  Null kitchenMessage;
  Null offerTitle;
  String toppingStyle;
  String toppingPriceSignal;
  String toppingActualPriceLeft;
  String toppingPriceLeft;
  String toppingItemTaxLeft;
  String toppingQuantityLeft;
  Null toppingMultipleTaxLeft;
  String toppingActualPriceRight;
  String toppingPriceRight;
  String toppingItemTaxRight;
  String toppingQuantityRight;
  Null toppingMulitpleTaxRight;
  Null itemMultipleTaxs;
  int refundFlag;
  Null refundStaff;
  int refundType;
  int refundAmount;
  List<Null> subItems;
  List<Modifiers> modifiers;

  Items(
      {this.voucherStatus,
      this.voucherCode,
      this.itemUID,
      this.isSplitItem,
      this.guest,
      this.insertId,
      this.itemid,
      this.type,
      this.itemname,
      this.price,
      this.itemTax,
      this.offerType,
      this.size,
      this.quantity,
      this.voidStatus,
      this.actualPrice,
      this.kitchenMessage,
      this.offerTitle,
      this.toppingStyle,
      this.toppingPriceSignal,
      this.toppingActualPriceLeft,
      this.toppingPriceLeft,
      this.toppingItemTaxLeft,
      this.toppingQuantityLeft,
      this.toppingMultipleTaxLeft,
      this.toppingActualPriceRight,
      this.toppingPriceRight,
      this.toppingItemTaxRight,
      this.toppingQuantityRight,
      this.toppingMulitpleTaxRight,
      this.itemMultipleTaxs,
      this.refundFlag,
      this.refundStaff,
      this.refundType,
      this.refundAmount,
      this.subItems,
      this.modifiers});

  Items.fromJson(Map<String, dynamic> json) {
    voucherStatus = json['voucher_status'];
    voucherCode = json['voucher_code'];
    itemUID = json['itemUID'];
    isSplitItem = json['isSplitItem'];
    guest = json['guest'];
    insertId = json['insert_id'];
    itemid = json['itemid'];
    type = json['type'];
    itemname = json['itemname'];
    price = json['price'];
    itemTax = json['item_tax'];
    offerType = json['offer_type'];
    size = json['size'];
    quantity = json['quantity'];
    voidStatus = json['void_status'];
    actualPrice = json['actual_price'];
    kitchenMessage = json['kitchenMessage'];
    offerTitle = json['offer_title'];
    toppingStyle = json['topping_style'];
    toppingPriceSignal = json['topping_price_signal'];
    toppingActualPriceLeft = json['topping_actual_price_left'];
    toppingPriceLeft = json['topping_price_left'];
    toppingItemTaxLeft = json['topping_item_tax_left'];
    toppingQuantityLeft = json['topping_quantity_left'];
    toppingMultipleTaxLeft = json['topping_multiple_tax_left'];
    toppingActualPriceRight = json['topping_actual_price_right'];
    toppingPriceRight = json['topping_price_right'];
    toppingItemTaxRight = json['topping_item_tax_right'];
    toppingQuantityRight = json['topping_quantity_right'];
    toppingMulitpleTaxRight = json['topping_mulitple_tax_right'];
    itemMultipleTaxs = json['item_multiple_taxs'];
    refundFlag = json['refund_flag'];
    refundStaff = json['refund_staff'];
    refundType = json['refund_type'];
    refundAmount = json['refund_amount'];
    // if (json['sub_items'] != null) {
    //   subItems = new List<Null>();
    //   json['sub_items'].forEach((v) {
    //     subItems.add(new Null.fromJson(v));
    //   });
    // }
    if (json['modifiers'] != null) {
      modifiers = new List<Modifiers>();
      json['modifiers'].forEach((v) {
        modifiers.add(new Modifiers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['voucher_status'] = this.voucherStatus;
    data['voucher_code'] = this.voucherCode;
    data['itemUID'] = this.itemUID;
    data['isSplitItem'] = this.isSplitItem;
    data['guest'] = this.guest;
    data['insert_id'] = this.insertId;
    data['itemid'] = this.itemid;
    data['type'] = this.type;
    data['itemname'] = this.itemname;
    data['price'] = this.price;
    data['item_tax'] = this.itemTax;
    data['offer_type'] = this.offerType;
    data['size'] = this.size;
    data['quantity'] = this.quantity;
    data['void_status'] = this.voidStatus;
    data['actual_price'] = this.actualPrice;
    data['kitchenMessage'] = this.kitchenMessage;
    data['offer_title'] = this.offerTitle;
    data['topping_style'] = this.toppingStyle;
    data['topping_price_signal'] = this.toppingPriceSignal;
    data['topping_actual_price_left'] = this.toppingActualPriceLeft;
    data['topping_price_left'] = this.toppingPriceLeft;
    data['topping_item_tax_left'] = this.toppingItemTaxLeft;
    data['topping_quantity_left'] = this.toppingQuantityLeft;
    data['topping_multiple_tax_left'] = this.toppingMultipleTaxLeft;
    data['topping_actual_price_right'] = this.toppingActualPriceRight;
    data['topping_price_right'] = this.toppingPriceRight;
    data['topping_item_tax_right'] = this.toppingItemTaxRight;
    data['topping_quantity_right'] = this.toppingQuantityRight;
    data['topping_mulitple_tax_right'] = this.toppingMulitpleTaxRight;
    data['item_multiple_taxs'] = this.itemMultipleTaxs;
    data['refund_flag'] = this.refundFlag;
    data['refund_staff'] = this.refundStaff;
    data['refund_type'] = this.refundType;
    data['refund_amount'] = this.refundAmount;
    // if (this.subItems != null) {
    //   data['sub_items'] = this.subItems.map((v) => v.toJson()).toList();
    // }
    if (this.modifiers != null) {
      data['modifiers'] = this.modifiers.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Modifiers {
  String insertId;
  String itemid;
  String itemname;
  int type;
  String size;
  String quantity;
  String splitPart;
  int includedTempQty;
  int itemTax;
  int price;
  String actualPrice;
  Null itemMultipleTaxs;
  String modifierbaseFlag;
  int toppingFlag;

  Modifiers(
      {this.insertId,
      this.itemid,
      this.itemname,
      this.type,
      this.size,
      this.quantity,
      this.splitPart,
      this.includedTempQty,
      this.itemTax,
      this.price,
      this.actualPrice,
      this.itemMultipleTaxs,
      this.modifierbaseFlag,
      this.toppingFlag});

  Modifiers.fromJson(Map<String, dynamic> json) {
    insertId = json['insert_id'];
    itemid = json['itemid'];
    itemname = json['itemname'];
    type = json['type'];
    size = json['size'];
    quantity = json['quantity'];
    splitPart = json['split_part'];
    includedTempQty = json['includedTempQty'];
    itemTax = json['item_tax'];
    price = json['price'];
    actualPrice = json['actual_price'];
    itemMultipleTaxs = json['item_multiple_taxs'];
    modifierbaseFlag = json['modifierbase_flag'];
    toppingFlag = json['topping_flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['insert_id'] = this.insertId;
    data['itemid'] = this.itemid;
    data['itemname'] = this.itemname;
    data['type'] = this.type;
    data['size'] = this.size;
    data['quantity'] = this.quantity;
    data['split_part'] = this.splitPart;
    data['includedTempQty'] = this.includedTempQty;
    data['item_tax'] = this.itemTax;
    data['price'] = this.price;
    data['actual_price'] = this.actualPrice;
    data['item_multiple_taxs'] = this.itemMultipleTaxs;
    data['modifierbase_flag'] = this.modifierbaseFlag;
    data['topping_flag'] = this.toppingFlag;
    return data;
  }
}
