import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_place_holder_list/Layers/domain/entities/list_posts_entity.dart';
import 'package:json_place_holder_list/Layers/domain/exceptions/list_fetch_exceptions.dart';
import 'package:json_place_holder_list/Layers/domain/usecases/listOfPosts/list_of_posts_use_case.dart';
import 'package:json_place_holder_list/Layers/presenter/cubit/listofposts_cubit.dart';
import 'package:mocktail/mocktail.dart';

class MockListOfPostsUseCase extends Mock implements ListOfPostsUseCase {}

void main() {
  late ListOfPostsUseCase useCase;
  late ListofpostsCubit cubit;
  late List<ListPostsEntity> entities;
  setUp(() {
    useCase = MockListOfPostsUseCase();
    cubit = ListofpostsCubit(useCase: useCase);
    entities = [
      ListPostsEntity(
        id: 1,
        title:
            'sunt aut facere repellat provident occaecati excepturi optio reprehenderit',
        body:
            'quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto',
      ),
      ListPostsEntity(
        id: 2,
        title: 'qui est esse',
        body:
            'est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla',
      ),
    ];
  });
  blocTest<ListofpostsCubit, ListofpostsState>(
    'Deve retornar o estado correto quando sucesso',
    build: () => cubit,
    act: (cubit) => cubit.loadingPosts(),
    setUp: () {
      when(() => useCase.call()).thenAnswer((_) async => Right(entities));
    },
    expect: ()=> [
      const ListofpostsState(posts: null, status: PostsStatus.loading),
      ListofpostsState(posts: entities, status: PostsStatus.sucess),
    ],
  );
  blocTest<ListofpostsCubit, ListofpostsState>(
    'Deve retornar o estado correto quando der falha',
    build: () => cubit,
    act: (cubit) => cubit.loadingPosts(),
    setUp: () {
      when(() => useCase.call()).thenAnswer((_) async => Left(ListFetchExceptions(message: 'Erro ao carregar posts')));
    },
    expect: ()=> [
      const ListofpostsState(posts: null, status: PostsStatus.loading),
      const ListofpostsState(posts: null, status: PostsStatus.faliure),
    ],
  );
}
