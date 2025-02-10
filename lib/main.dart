import 'package:clean_arquitecture_bloc/features/pokemon/presentation/blocs/search_pokemos/search_pokemons_bloc.dart';
import 'package:clean_arquitecture_bloc/features/pokemon/presentation/pages/pokemons_page.dart';
import 'package:clean_arquitecture_bloc/services_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

void main() async {
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GetIt.instance.get<SearchPokemonsBloc>())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pokemon APP',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const PokemonsScreen(),
      ),
    );
  }
}
