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

  Future<BaseResponse> getArticleDetail() async {
    await Future.delayed(Duration(milliseconds: 1500));

    dynamic data = {
      "data": {
        "title": "Quick Homemade Ramen",
        "subTitle":
            "Take the usual ramen up a notch with this quick homemade ramen. Fresh veggies and herbs make this extra delicious, healthy, and cozy!",
        "content":
            'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32. The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.',
        "author": "cocuden",
        "publishedAt": "06/11/2023",
        "images": [
          "https://picsum.photos/1024/768",
          "https://picsum.photos/1024/768",
          "https://picsum.photos/1024/768",
        ],
        "video":
            "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      }
    };

    final res = BaseResponse(
      statusCode: StatusCode.success,
      data: data["data"],
      message: null,
    );

    return res;
  }
}
