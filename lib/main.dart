import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_cubit_sayac/cubit_conter/conter_cubit.dart';
import 'package:practice_cubit_sayac/cubit_conter/conter_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const MyHomePageWithCubit(),
      ),
    );
  }
}

class MyHomePageWithCubit extends StatelessWidget {
  const MyHomePageWithCubit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('print tetiklendi');
    return Scaffold(
      appBar: AppBar(title: const Text('Cubit Kullanımı')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            /* Text(
              context.watch<CounterCubit>().state.sayac.toString(),
              style: Theme.of(context).textTheme.headline4,
            ), */
            BlocBuilder<CounterCubit, CounterCubitState>(
              builder: (context, CounterCubitState state) {
                return Text(state.sayac.toString());
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterCubit>().arttir();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterCubit>().azalt();
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.minimize_rounded),
          ),
        ],
      ),
    );
  }
}
