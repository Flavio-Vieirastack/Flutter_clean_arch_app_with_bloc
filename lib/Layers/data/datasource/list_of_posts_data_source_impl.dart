import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:json_place_holder_list/Layers/domain/exceptions/list_fetch_exceptions.dart';

import 'package:json_place_holder_list/Layers/data/DTOs/posts_dto.dart';

import 'package:dartz/dartz.dart';

import 'list_of_posts_data_source.dart';

class ListOfPostsDataSourceImpl implements ListOfPostsDataSource {
 
  @override
  Future<Either<ListFetchExceptions, List<PostsDto>>> fetchData() async {
    final dio = Dio();
    try {
      final response =
          await dio.get<List>('https://jsonplaceholder.typicode.com/posts');
      final data = response.data?.map((e) => PostsDto.fromMap(e)).toList() ??
          <PostsDto>[];
      return Right(data);
    } catch (e, s) {
      log('Erro no httpClient', error: e, stackTrace: s);
      return Left(ListFetchExceptions());
    }
  }
  }

