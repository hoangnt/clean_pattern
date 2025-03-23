import 'package:clean_pattern/common/constant/hive_box_key.dart';
import 'package:clean_pattern/features/article/data/repositories/article_repo_impl.dart';
import 'package:clean_pattern/features/article/domain/repositories/article_repo.dart';
import 'package:clean_pattern/features/article/domain/usecase/get_article_detail_usecase.dart';
import 'package:clean_pattern/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:clean_pattern/features/auth/domain/repositories/auth_repo.dart';
import 'package:clean_pattern/features/auth/domain/usecase/get_user_profile_usecase.dart';
import 'package:clean_pattern/features/auth/domain/usecase/logout_usecase.dart';
import 'package:clean_pattern/features/customer/data/model/ramen_flavor.dart';
import 'package:clean_pattern/features/article/domain/usecase/get_all_article_usecase.dart';
import 'package:clean_pattern/features/auth/domain/usecase/login_usecase.dart';
import 'package:clean_pattern/features/store/data/repositories/store_repo_impl.dart';
import 'package:clean_pattern/features/store/domain/repositories/store_repo.dart';
import 'package:clean_pattern/features/store/domain/usecase/get_all_store_usecase.dart';
import 'package:clean_pattern/features/store/domain/usecase/get_top_store_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

final getIt = GetIt.instance;

Future<void> dependenciesInjection() async {
  homeInjection();
  loginInjection();
  await hiveBoxInjection();
}

void loginInjection() {
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl());

  getIt.registerSingleton<LoginUsecase>(LoginUsecase(getIt()));
  getIt
      .registerSingleton<GetUserProfileUsecase>(GetUserProfileUsecase(getIt()));
  getIt.registerSingleton<LogoutUsecase>(LogoutUsecase(getIt()));
}

void homeInjection() {
  getIt.registerSingleton<StoreRepo>(StoreRepoImpl());
  getIt.registerSingleton<ArticleRepo>(ArticleRepoImpl());

  getIt.registerSingleton<GetAllStoreUsecase>(GetAllStoreUsecase(getIt()));
  getIt.registerSingleton<GetTopStoreUsecase>(GetTopStoreUsecase(getIt()));
  getIt.registerSingleton<GetAllArticleUsecase>(GetAllArticleUsecase(getIt()));
  getIt.registerSingleton<GetArticleDetailUsecase>(
      GetArticleDetailUsecase(getIt()));
}

Future<void> hiveBoxInjection() async {
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(HiveAdapterId.ramenFlavor)) {
    Hive.registerAdapter(RamenFlavorAdapter());
  }
  if (!Hive.isBoxOpen(HiveBoxKey.ramenFlavor)) {
    await Hive.openBox<RamenFlavor>(HiveBoxKey.ramenFlavor);
  }
}
