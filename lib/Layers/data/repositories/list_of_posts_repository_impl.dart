import 'dart:developer';

import 'package:json_place_holder_list/Layers/data/datasource/list_of_posts_data_source.dart';
import 'package:json_place_holder_list/Layers/domain/exceptions/list_fetch_exceptions.dart';
import 'package:json_place_holder_list/Layers/domain/entities/list_posts_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:json_place_holder_list/Layers/domain/repositories/list_posts_repository.dart';

class ListOfPostsRepositoryImpl implements ListPostsRepository {
  final ListOfPostsDataSource _listOfPostsDataSource;
  ListOfPostsRepositoryImpl(
      {required ListOfPostsDataSource listOfPostsDataSource})
      : _listOfPostsDataSource = listOfPostsDataSource;
  @override
  Future<Either<ListFetchExceptions, List<ListPostsEntity>>> call() async {
    try {
      final postsData = await _listOfPostsDataSource.fetchData();
      return postsData;
    } catch (e, s) {
      log('Erro no repository', error: e, stackTrace: s);
      return Left(ListFetchExceptions());
    }
  }
}
