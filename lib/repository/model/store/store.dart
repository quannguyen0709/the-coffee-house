class Store{
  int id;
  String puCity;
  String name;
  String openTime;
  List<String> images;
  String phone;
  List<Map<String, double>> location = [{"lat": 0}, {"long": 0}];
  String fullAddress;
  List<String> serviceTypes;
  bool tableServe;
  String textOrderTable;

  Store(
      this.id,
      this.puCity,
      this.name,
      this.openTime,
      this.images,
      this.phone,
      this.location,
      this.fullAddress,
      this.serviceTypes,
      this.tableServe,
      this.textOrderTable);
}