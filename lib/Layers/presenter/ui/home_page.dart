import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_place_holder_list/Layers/presenter/cubit/listofposts_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const _Content(),
    );
  }
}

class _BodyPage extends StatelessWidget {
  const _BodyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final posts = context.select((ListofpostsCubit cubit) => cubit.state.posts);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: posts?.length ?? 0,
        itemBuilder: (context, index) {
          final postsData = posts![index];
          return ListTile(
            title: Text(postsData.title),
            subtitle: Text(postsData.body),
          );
        },
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final status =
        context.select((ListofpostsCubit cubit) => cubit.state.status);
    switch (status) {
      case PostsStatus.initial:
        return const SizedBox.shrink();
      case PostsStatus.loading:
        return const Center(child: CircularProgressIndicator());
      case PostsStatus.sucess:
        return const _BodyPage();

      case PostsStatus.faliure:
        return const Text('Erro ao pegar arquivos');
    }
  }
}
