
import 'package:flutter_test/flutter_test.dart';
import 'package:json_place_holder_list/Layers/data/DTOs/posts_dto.dart';

import '../../../mocks/json_List_mock.dart';


void main() {
  test('Deve retornar o tamanho total do json', () {
    final dtoData = jsonMock.map((e) => PostsDto.fromMap(e)).toList();
    expect(dtoData.length, 2);
  });
  test('Deve retornar o id correto do json', () {
    final dtoData = jsonMock.map((e) => PostsDto.fromMap(e)).toList();
    final jsonMockData = jsonMock[0]['id'];
    final dtoJson = dtoData[0].id;
    expect(dtoJson, jsonMockData);
  });
  test('Deve retornar o titulo correto do json', () {
    final dtoData = jsonMock.map((e) => PostsDto.fromMap(e)).toList();
    final jsonMockData = jsonMock[0]['title'];
    final dtoJson = dtoData[0].title;
    expect(dtoJson, jsonMockData);
  });
  test('Deve retornar o body correto do json', () {
    final dtoData = jsonMock.map((e) => PostsDto.fromMap(e)).toList();
    final jsonMockData = jsonMock[0]['body'];
    final dtoJson = dtoData[0].body;
    expect(dtoJson, jsonMockData);
  });
}
