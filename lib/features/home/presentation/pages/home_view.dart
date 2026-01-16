import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/di/injection.dart';
import 'package:task/features/home/add_car/presentation/cubit/add_car_cubit.dart';
import 'package:task/features/home/presentation/pages/home_boody.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

    @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<AddCarCubit>(),
      child: const HomeBody(),
    );
  }
}

