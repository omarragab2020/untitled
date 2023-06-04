class PersonalDetailsModel {
  String? name, address, phone, address2;
  PersonalDetailsModel(this.name, this.address, this.phone, this.address2);

  PersonalDetailsModel.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        address = json["address"],
        address2 = json["address2"],
        phone = json["phone"];

  Map<String, dynamic> toJson() => {
        'name': name,
        'address': address,
        'address2': address2,
        'phone': phone,
      };
}
