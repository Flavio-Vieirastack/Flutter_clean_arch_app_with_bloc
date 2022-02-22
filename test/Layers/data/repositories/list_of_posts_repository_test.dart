import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_place_holder_list/Layers/data/datasource/list_of_posts_data_source.dart';
import 'package:json_place_holder_list/Layers/data/repositories/list_of_posts_repository_impl.dart';
import 'package:json_place_holder_list/Layers/domain/exceptions/list_fetch_exceptions.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/list_dto_mock.dart';

class ListOfPostsDataSourceMock extends Mock implements ListOfPostsDataSource {}

void main() {
  test('deve retornar um listDto ao chamar o datasource', () async {
    final dataSource = ListOfPostsDataSourceMock();
    final repository =
        ListOfPostsRepositoryImpl(listOfPostsDataSource: dataSource);
    when(() => dataSource.fetchData()).thenAnswer((_) async => Right(listDto));
    final sut = await repository.call();
    expect(sut, Right(listDto));
  });
  test('deve chamar o datasource ao chamar o repository', () async {
    final dataSource = ListOfPostsDataSourceMock();
    final repository =
        ListOfPostsRepositoryImpl(listOfPostsDataSource: dataSource);
    when(() => dataSource.fetchData()).thenAnswer((_) async => Right(listDto));
    final sut = await repository.call();
    expect(sut, Right(listDto));
    verify(() => dataSource.fetchData()).called(1);
  });
  test('deve retornar uma exception customizada', () async {
    final dataSource = ListOfPostsDataSourceMock();
    final repository =
        ListOfPostsRepositoryImpl(listOfPostsDataSource: dataSource);
    when(() => dataSource.fetchData()).thenThrow(Left(ListFetchExceptions()));
    final sut = repository.call;
    expect(await sut(), isA<Left>());
  });
}
