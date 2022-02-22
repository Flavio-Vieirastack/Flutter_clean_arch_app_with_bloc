import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_place_holder_list/Layers/data/datasource/list_of_posts_data_source.dart';
import 'package:json_place_holder_list/Layers/domain/exceptions/list_fetch_exceptions.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/list_dto_mock.dart';

class ListOfPostsDataSourceMock extends Mock implements ListOfPostsDataSource {}

void main() {
  test('deve retornar um list DTO', () async {
    final dataSource = ListOfPostsDataSourceMock();
    when(() => dataSource.fetchData()).thenAnswer((_) async => Right(listDto));
    final sut = await dataSource.fetchData();
    expect(sut, Right(listDto));
  });
  test('deve retornar uma list fetch Exeption', () async {
    final dataSource = ListOfPostsDataSourceMock();
    when(() => dataSource.fetchData())
        .thenAnswer((_) async => Left(ListFetchExceptions()));
    final sut = dataSource.fetchData;
    expect(await sut(), Left(ListFetchExceptions()));
  });

}
