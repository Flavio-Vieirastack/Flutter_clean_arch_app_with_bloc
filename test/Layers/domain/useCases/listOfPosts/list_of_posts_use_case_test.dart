import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_place_holder_list/Layers/domain/exceptions/list_fetch_exceptions.dart';
import 'package:json_place_holder_list/Layers/domain/repositories/list_posts_repository.dart';
import 'package:json_place_holder_list/Layers/domain/usecases/listOfPosts/list_of_posts_use_case_impl.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/list_dto_mock.dart';

class ListOfPostsRepositoryMock extends Mock implements ListPostsRepository {}

void main() {
  test('Deve retornar uma lista de postsDto', () async {
    final postsRepository = ListOfPostsRepositoryMock();
    final useCase = ListOfPostsUseCaseImpl(repository: postsRepository);
    when((() => postsRepository.call()))
        .thenAnswer((_) async => Right(listDto));
    final sut = await useCase.call();
    expect(sut, Right(listDto));
  });
  test('Deve chamar o listPostsRepository', () async {
    final postsRepository = ListOfPostsRepositoryMock();
    final useCase = ListOfPostsUseCaseImpl(repository: postsRepository);
    when((() => postsRepository.call()))
        .thenAnswer((_) async => Right(listDto));
    final sut = await useCase.call();
    expect(sut, Right(listDto));
    verify(() => postsRepository.call()).called(1);
  });
  test('Deve retornar uma listFetchException', () async {
    final postsRepository = ListOfPostsRepositoryMock();
    final useCase = ListOfPostsUseCaseImpl(repository: postsRepository);
    when((() => postsRepository.call())).thenThrow(Left(ListFetchExceptions()));
    final sut = useCase.call;
    expect(await sut(), isA<Left>());
  });
  test('Deve retornar uma listFetchException com o segundo metodo', () async {
    final postsRepository = ListOfPostsRepositoryMock();
    final useCase = ListOfPostsUseCaseImpl(repository: postsRepository);
    when((() => postsRepository.call()))
        .thenAnswer((_) async => Left(ListFetchExceptions()));
    final sut = useCase.call;
    expect(await sut(), Left(ListFetchExceptions()));
  });
}
