import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import 'package:json_place_holder_list/Layers/domain/entities/list_posts_entity.dart';
import 'package:json_place_holder_list/Layers/domain/usecases/listOfPosts/list_of_posts_use_case.dart';

part 'listofposts_state.dart';

class ListofpostsCubit extends Cubit<ListofpostsState> {
  ListofpostsCubit({required ListOfPostsUseCase useCase})
      : _useCase = useCase,
        super(const ListofpostsState());
  final ListOfPostsUseCase _useCase;

  Future<void> loadingPosts() async {
    emit(ListofpostsState(posts: state.posts, status: PostsStatus.loading));
    final postsData = await _useCase.call();
    await Future.delayed(const Duration(seconds: 5));
    postsData.fold(
      (faliure) => emit(
          ListofpostsState(posts: state.posts, status: PostsStatus.faliure)),
      (posts) =>
          emit(ListofpostsState(posts: posts, status: PostsStatus.sucess)),
    );
  }
}
