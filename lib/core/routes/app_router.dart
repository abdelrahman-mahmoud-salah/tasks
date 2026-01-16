import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/di/injection.dart';
import 'package:task/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:task/features/auth/login/presentation/pages/login_view.dart';
import 'package:task/features/home/bookings/presentation/cubit/booking_cubit.dart';
import 'package:task/features/home/presentation/pages/home_view.dart';

class AppRouter {
  static const String login = '/login';
  static const String home = '/home';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => sl.get<LoginCubit>(),
                child: const LoginView(),
              ),
        );

      case home:
        return MaterialPageRoute(builder: (_) => BlocProvider(
                create: (context) => sl.get<BookingCubit>()..getAllBookings(), child : HomeView()));

      default:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => sl.get<LoginCubit>(),
                child: const LoginView(),
              ),
        );
    }
  }
}
