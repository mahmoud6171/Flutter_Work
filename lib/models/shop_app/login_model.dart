class ShopLoginModel
{
  bool? status;
  late String message;
  UserData? data;

  ShopLoginModel.FromJson(Map<String,dynamic>json)
  {
    status=json['status'];
    message=json['message'];
    data=json['data'] != null? UserData.FromJson(json['data']): null;
  }
}

class UserData
{
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credits;
  String? token;

//   UserData({
//     this.id,
//     this.name,
//     this.email,
//     this.phone,
//     this.image,
//     this.points,
//     this.credits,
//     this.token,
// });

  UserData.FromJson(Map<String,dynamic>json)
  {
    id=json['id'];
    name=json['name'];
    email=json['email'];
    phone=json['phone'];
    image=json['image'];
    points=json['points'];
    credits=json['credits'];
    token=json['token'];

  }

}
