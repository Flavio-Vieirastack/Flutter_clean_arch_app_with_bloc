import 'package:dartz/dartz.dart';
import 'package:json_place_holder_list/Layers/data/DTOs/posts_dto.dart';
import 'package:json_place_holder_list/Layers/domain/exceptions/list_fetch_exceptions.dart';

abstract class ListOfPostsDataSource {
  Future<Either<ListFetchExceptions, List<PostsDto>>> fetchData();
}
