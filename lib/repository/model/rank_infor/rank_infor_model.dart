class RankInfor {
  String id;
  String name;
  int min;
  int max;
  String icon;
  List<Benefit> listBenefit = [];

  RankInfor(
      this.id, this.name, this.min, this.max, this.icon, this.listBenefit);
}

class Benefit {
  String icon;
  String name;

  Benefit(this.icon, this.name);
}