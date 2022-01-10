class HomeModel
{
  bool? status;
  HomeDataModel? data;

  HomeModel.FromJson(Map<String,dynamic>json)
  {
    status=json['status'];
    data= HomeDataModel.FromJson(json['data']);
  }
}

class HomeDataModel
{
  List<BannerModel>banners=[];
  List<ProductModel>products=[];

  HomeDataModel.FromJson(Map<String,dynamic>json)
  {
    json['banners'].forEach((element)
        {
          banners.add(element);
        });

    json['products'].forEach((element)
    {
      banners.add(element);
    });
  }
}

class BannerModel
{
  int? id;
  String? image;

  BannerModel.FromJson(Map<String,dynamic>json)
  {
    id=json['id'];
    image=json['image'];
  }
}

class ProductModel
{
  int? id;
  dynamic? price;
  dynamic? oldPrice;
  dynamic? discount;
  String? image;
  String? name;
  bool? inFavourite;
  bool? inCart;


  ProductModel.FromJson(Map<String,dynamic>json)
  {
    id=json['id'];
    price=json['price'];
    oldPrice=json['old_price'];
    discount=json['discount'];
    image=json['image'];
    name=json['name'];
    inFavourite=json['in_favourite'];
    inCart=json['in_cart'];
  }
}