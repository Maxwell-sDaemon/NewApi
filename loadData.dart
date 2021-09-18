class LoadData {
  String area;
  String city;
  String id;
  String info;
  String location;
  String locurl;
  String name;
  String pic;
  String type;

  LoadData(
      {this.area,
      this.city,
      this.id,
      this.info,
      this.location,
      this.locurl,
      this.name,
      this.pic,
      this.type});

  LoadData.fromJson(Map<String, dynamic> json) {
    area = json['area'];
    city = json['city'];
    id = json['id'];
    info = json['info'];
    location = json['location'];
    locurl = json['locurl'];
    name = json['name'];
    pic = json['pic'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['area'] = this.area;
    data['city'] = this.city;
    data['id'] = this.id;
    data['info'] = this.info;
    data['location'] = this.location;
    data['locurl'] = this.locurl;
    data['name'] = this.name;
    data['pic'] = this.pic;
    data['type'] = this.type;
    return data;
  }
}