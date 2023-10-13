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
          "bestSeller": "tonkotsu ramen",
        },
        {
          "name": "Naruto Kairen Ramen",
          "address": "10 P. Kim Mã Thượng, Cống Vị, Ba Đình, Hà Nội",
          "owner": "Ngo The Hoang",
          "bestSeller": "tonkotsu ramen",
        },
        {
          "name": "Yukiichi Ramen",
          "address": "Yukiichi Ramen",
          "owner": "Tran The Hoang",
          "bestSeller": "miso ramen",
        },
      ],
    };
    final res = BaseResponse(
      statusCode: StatusCode.success,
      data: data,
      message: null,
    );

    return res;
  }
}
