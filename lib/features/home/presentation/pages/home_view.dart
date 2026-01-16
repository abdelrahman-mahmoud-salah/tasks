import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/di/injection.dart';
import 'package:flutter_application_1/features/home/add_car/presentation/cubit/add_car_cubit.dart';
import 'package:flutter_application_1/features/home/presentation/pages/home_boody.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


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

