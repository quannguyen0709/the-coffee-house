class DiscountModel {
  String brand;
  Coupons coupons ;
  String id;
  String title;
  String description;
  int end_time;
  String time_left;
  String image;
  int discount_rate = 0;
  bool allow_order;
  bool show_all_coupons;

  DiscountModel(
      this.brand,
      this.coupons,
      this.id,
      this.title,
      this.description,
      this.end_time,
      this.time_left,
      this.image,
      this.discount_rate,
      this.allow_order,
      this.show_all_coupons);
}

class Coupons {
  String barcode;
  String image;
  int end_time;

  Coupons(this.barcode, this.image, this.end_time);
}