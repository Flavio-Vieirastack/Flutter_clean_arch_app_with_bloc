import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:json_place_holder_list/Layers/domain/usecases/listOfPosts/list_of_posts_use_case.dart';
import 'package:json_place_holder_list/Layers/presenter/cubit/listofposts_cubit.dart';
import 'package:json_place_holder_list/Layers/presenter/ui/home_page.dart';
import 'package:json_place_holder_list/core/inject/inject.dart';

void main() {
  Inject.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => BlocProvider(
              create: (context) => ListofpostsCubit(
                  useCase: GetIt.instance.get<ListOfPostsUseCase>())..loadingPosts(),
              child: const HomePage(),
            )
      },
    );
  }
}
