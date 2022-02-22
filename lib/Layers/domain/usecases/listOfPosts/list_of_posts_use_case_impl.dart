import 'dart:developer';

import 'package:json_place_holder_list/Layers/domain/exceptions/list_fetch_exceptions.dart';
import 'package:json_place_holder_list/Layers/domain/entities/list_posts_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:json_place_holder_list/Layers/domain/repositories/list_posts_repository.dart';
import 'package:json_place_holder_list/Layers/domain/usecases/listOfPosts/list_of_posts_use_case.dart';

class ListOfPostsUseCaseImpl implements ListOfPostsUseCase {
  final ListPostsRepository _repository;
  ListOfPostsUseCaseImpl({required ListPostsRepository repository})
      : _repository = repository;
  @override
  Future<Either<ListFetchExceptions, List<ListPostsEntity>>> call() async {
    try {
      return _repository.call();
    } catch (e, s) {
      log('Erro no repository', error: e, stackTrace: s);
      return Left(ListFetchExceptions());
    }
  }
}
