import 'package:get_it/get_it.dart';
import 'package:json_place_holder_list/Layers/data/datasource/list_of_posts_data_source.dart';
import 'package:json_place_holder_list/Layers/data/datasource/list_of_posts_data_source_impl.dart';
import 'package:json_place_holder_list/Layers/data/repositories/list_of_posts_repository_impl.dart';
import 'package:json_place_holder_list/Layers/domain/repositories/list_posts_repository.dart';
import 'package:json_place_holder_list/Layers/domain/usecases/listOfPosts/list_of_posts_use_case.dart';
import 'package:json_place_holder_list/Layers/domain/usecases/listOfPosts/list_of_posts_use_case_impl.dart';

class Inject {
  Inject._();
  static void init() {
    GetIt getIt = GetIt.instance;
    
    getIt.registerLazySingleton<ListOfPostsDataSource>(
        () => ListOfPostsDataSourceImpl());

    getIt.registerLazySingleton<ListPostsRepository>(
        () => ListOfPostsRepositoryImpl(listOfPostsDataSource: getIt()));

    getIt.registerLazySingleton<ListOfPostsUseCase>(
        () => ListOfPostsUseCaseImpl(repository: getIt()));
  }
}
