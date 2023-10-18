import 'package:clean_pattern/common/constant/status_code.dart';
import 'package:clean_pattern/common/network/model/base_response.dart';

class StoreRemoteDatasouce {
  static final StoreRemoteDatasouce instance = StoreRemoteDatasouce._();
  StoreRemoteDatasouce._();

  Future<BaseResponse> getAllStore() async {
    await Future.delayed(Duration(seconds: 2));
    dynamic data = {
      "data": [
        {
          "name": "Yukiichi Ramen",
          "address": "9 P. Phan Kế Bính, Cống Vị, Ba Đình, Hà Nội 10000",
          "owner": "Tran The Hoang",
          "bestSeller": "Tonkotsu ramen",
          "image":
              "https://thesmartlocal.co.th/wp-content/uploads/2023/03/donut__nattaya-posts-2022-09-25-19.29-POSTID_1_4-309047578_413285770879444_6125526682658968584_n.jpg",
        },
        {
          "name": "Naruto Kairen Ramen",
          "address": "10 P. Kim Mã Thượng, Cống Vị, Ba Đình, Hà Nội",
          "owner": "Ngo The Hoang",
          "bestSeller": "Tonkotsu ramen",
          "image":
              "https://images.unsplash.com/photo-1486533803613-e0ce3d009238?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80",
        },
        {
          "name": "Kotetsu's Ramen",
          "address": "Ngõ 46, Linh Lang, Cống Vị, Ba Đình, Hà Nội",
          "owner": "Truong The Hoang",
          "bestSeller": "Miso ramen",
          "image":
              "https://rimage.gnst.jp/livejapan.com/public/article/detail/a/00/01/a0001973/img/en/a0001973_parts_5a964bd0102bc.jpg?20201225172208&q=80",
        },
      ],
    };
    final res = BaseResponse(
      statusCode: StatusCode.success,
      data: data["data"],
      message: null,
    );

    return res;
  }

  Future<BaseResponse> getTopStore() async {
    await Future.delayed(Duration(seconds: 2));
    dynamic data = {
      "data": [
        {
          "name": "Daisuki Ramen",
          "address": "9 P. Phan Kế Bính, Cống Vị, Ba Đình, Hà Nội 10000",
          "owner": "Emi Takahata",
          "bestSeller": "Tonkotsu ramen",
          "image":
              "https://glebekitchen.com/wp-content/uploads/2017/04/tonkotsuramenfront.jpg",
        },
        {
          "name": "Ichiran Ramen",
          "address": "9 P. Phan Kế Bính, Cống Vị, Ba Đình, Hà Nội 10000",
          "owner": "Emi Takahata",
          "bestSeller": "Tonkotsu ramen",
          "image":
              "https://assets.epicurious.com/photos/54ad70036529d92b2c046e6b/6:4/w_884,h_589,c_limit/51187270_shoyu-ramen_1x1.jpg",
        },
        {
          "name": "Kipponshi Ramen",
          "address": "9 P. Phan Kế Bính, Cống Vị, Ba Đình, Hà Nội 10000",
          "owner": "Emi Takahata",
          "bestSeller": "Tonkotsu ramen",
          "image":
              "https://a0.cdn.japantravel.com/photo/65295-219803/738x415.125!/tokyo-kipposhi-ramen-219803.jpg",
        },
        {
          "name": "Samurai Noodle",
          "address": "10 P. Kim Mã Thượng, Cống Vị, Ba Đình, Hà Nội",
          "owner": "Jakeisha Wilmore",
          "bestSeller": "Tonkotsu ramen",
          "image":
              "https://cdn.vox-cdn.com/thumbor/lMpHyGdCpOjz0lfEA-NooW-DGh4=/323x22:2269x1482/1200x800/filters:focal(323x22:2269x1482)/cdn.vox-cdn.com/uploads/chorus_image/image/45805772/samurai_houston.0.0.jpg",
        },
        {
          "name": "Musashiya Ramen",
          "address": "Ngõ 46, Linh Lang, Cống Vị, Ba Đình, Hà Nội",
          "owner": "John Ringor",
          "bestSeller": "Shoyu ramen",
          "image":
              "https://res.cloudinary.com/the-infatuation/image/upload/c_fill,w_3840,ar_4:3,g_center,f_auto/cms/Musashiya_Exterior_KimKovacik_Chicago_02",
        },
      ],
    };
    final res = BaseResponse(
      statusCode: StatusCode.success,
      data: data["data"],
      message: null,
    );

    return res;
  }
}
