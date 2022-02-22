import 'package:dartz/dartz.dart';
import 'package:json_place_holder_list/Layers/domain/entities/list_posts_entity.dart';
import 'package:json_place_holder_list/Layers/domain/exceptions/list_fetch_exceptions.dart';

abstract class ListOfPostsUseCase {
  Future<Either<ListFetchExceptions, List<ListPostsEntity>>> call();
}
