import 'package:clean_pattern/common/network/model/server_response.dart';
import 'package:clean_pattern/features/home/domain/repositories/store_repo.dart';

class StoreRepoImpl extends StoreRepo {
  @override
  Future<ServerResponse> getListStore() async {
    await Future.delayed(Duration(seconds: 2));

    Map<String, dynamic> data = {
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
    final res = ServerResponse(
      statusCode: 200,
      data: data,
      message: null,
    );

    return res;
  }
}
