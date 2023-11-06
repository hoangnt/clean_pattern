import 'package:clean_pattern/common/constant/status_code.dart';
import 'package:clean_pattern/common/network/model/base_response.dart';

class ArticleRemoteDatasource {
  static final ArticleRemoteDatasource instance = ArticleRemoteDatasource._();
  ArticleRemoteDatasource._();

  Future<BaseResponse> getAllArticle() async {
    await Future.delayed(Duration(milliseconds: 1500));

    dynamic data = {
      "data": [
        {
          "title": "Yukiichi Ramen is the best Ramen shop ?",
          "content":
              "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups",
          "author": "cocuden",
          "publishedAt": "13/08/1995",
          "image":
              "https://images.foody.vn/res/g118/1172338/prof/s640x400/foody-upload-api-foody-mobile-an-345488e9-230529180034.jpeg",
        },
        {
          "title": "Koketsu's Ramen, the new unicorn store ?",
          "content":
              "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups",
          "author": "phich cam dien",
          "publishedAt": "13/08/1995",
          "image":
              "https://i0.wp.com/tokyotreatblog.wpcomstaging.com/wp-content/uploads/2022/05/Shutterstock_751789537-min.jpg?fit=4096%2C2731&ssl=1",
        },
        {
          "title": "Naruto Kairen Ramen, Vietnamese's Ramen store from manga",
          "content":
              "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups",
          "author": "Chubatgioi",
          "publishedAt": "13/08/1995",
          "image":
              "https://stat.ameba.jp/user_images/20221124/12/tripwithkids/36/6e/j/o1080144015207372336.jpg",
        },
        {
          "title": "The Iroha Ramen, warm and chill store in Old quarter Hanoi",
          "content":
              "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups",
          "author": "cocuden",
          "publishedAt": "13/08/1995",
          "image":
              "https://www.gurutto-vietnam.com/common/image2.php?1=1&h=350&f=%2Fdb%5Fimg%2Fcl%5Fimg%2F5232%2Fmain%5Fimg%5F20230214140948650%2Ejpg",
        },
        {
          "title": "Yukiichi Ramen is the best Ramen shop ?",
          "content":
              "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups",
          "author": "cocuden",
          "publishedAt": "13/08/1995",
          "image":
              "https://images.foody.vn/res/g118/1172338/prof/s640x400/foody-upload-api-foody-mobile-an-345488e9-230529180034.jpeg",
        },
        {
          "title": "Koketsu's Ramen, the new unicorn store ?",
          "content":
              "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups",
          "author": "phich cam dien",
          "publishedAt": "13/08/1995",
          "image":
              "https://i0.wp.com/tokyotreatblog.wpcomstaging.com/wp-content/uploads/2022/05/Shutterstock_751789537-min.jpg?fit=4096%2C2731&ssl=1",
        },
        {
          "title": "Naruto Kairen Ramen, Vietnamese's Ramen store from manga",
          "content":
              "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups",
          "author": "Chubatgioi",
          "publishedAt": "13/08/1995",
          "image":
              "https://stat.ameba.jp/user_images/20221124/12/tripwithkids/36/6e/j/o1080144015207372336.jpg",
        },
        {
          "title": "The Iroha Ramen, warm and chill store in Old quarter Hanoi",
          "content":
              "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups",
          "author": "cocuden",
          "publishedAt": "13/08/1995",
          "image":
              "https://www.gurutto-vietnam.com/common/image2.php?1=1&h=350&f=%2Fdb%5Fimg%2Fcl%5Fimg%2F5232%2Fmain%5Fimg%5F20230214140948650%2Ejpg",
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
