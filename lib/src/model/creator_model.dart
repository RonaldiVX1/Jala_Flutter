class CreatorModel {
  int? id;
  int? roleId;
  String? name;
  String? email;
  String? avatar;
  bool? emailVerified;
  int? subscriptionTypeId;
  String? phone;
  bool? phoneVerified;
  int? gender;
  String? occupation;
  bool? buyer;

  CreatorModel({
    this.id,
    this.roleId,
    this.name,
    this.email,
    this.avatar,
    this.emailVerified,
    this.subscriptionTypeId,
    this.phone,
    this.phoneVerified,
    this.gender,
    this.occupation,
    this.buyer,
  });

  factory CreatorModel.fromJson(Map<String, dynamic> json) => CreatorModel(
        id: json["id"],
        roleId: json["role_id"],
        name: json["name"],
        email: json["email"],
        avatar: json["avatar"],
        emailVerified: json["email_verified"],
        subscriptionTypeId: json["subscription_type_id"],
        phone: json["phone"],
        phoneVerified: json["phone_verified"],
        gender: json["gender"],
        occupation: json["occupation"],
        buyer: json["buyer"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "role_id": roleId,
        "name": name,
        "email": email,
        "avatar": avatar,
        "email_verified": emailVerified,
        "subscription_type_id": subscriptionTypeId,
        "phone": phone,
        "phone_verified": phoneVerified,
        "gender": gender,
        "occupation": occupation,
        "buyer": buyer,
      };
}
