import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:task/core/services/auth_api_service.dart';
import 'package:task/core/services/booking_api_service.dart';
import 'package:task/core/services/dio_intersptor.dart';
import 'package:task/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:task/features/home/add_car/data/data_sources/remote/add_car_remote_ds.dart';
import 'package:task/features/home/add_car/data/data_sources/remote/add_car_remote_ds_impl.dart';
import 'package:task/features/home/add_car/data/repositories_impl/add_car_repo_impl.dart';
import 'package:task/features/home/add_car/domain/repositories/add_car_repository.dart';
import 'package:task/features/home/add_car/domain/usecases/add_car_usecase.dart';
import 'package:task/features/home/add_car/presentation/cubit/add_car_cubit.dart';
import 'package:task/features/home/bookings/data/data_sources/remote/booking_remote_ds.dart';
import 'package:task/features/home/bookings/data/data_sources/remote/booking_remote_ds_impl.dart';
import 'package:task/features/home/bookings/data/repositories_impl/booking_repo_impl.dart';
import 'package:task/features/home/bookings/domain/repositories/booking_repository.dart';
import 'package:task/features/home/bookings/domain/usecases/get_all_bookings_usecase.dart';
import 'package:task/features/home/bookings/presentation/cubit/booking_cubit.dart';

final sl = GetIt.instance;
Future<void> setupInjector() async {
  await _initCore();
  await _allBooking();
  await  _addCar();
}

Future<void> _initCore() async {
  final dio = DioFactory.getDio();
  final navigatorKey = GlobalKey<NavigatorState>();

  // Services
  sl
    ..registerSingleton<GlobalKey<NavigatorState>>(navigatorKey)
    ..registerLazySingleton<AuthApiService>(() => AuthApiService(dio))
    ..registerLazySingleton<BookingApiService>(() => BookingApiService(dio));

  // Cubits
  sl.registerFactory<LoginCubit>(() => LoginCubit());
}

Future<void> _allBooking() async {
  sl
    ..registerLazySingleton<BookingRemoteDataSource>(
      () => BookingRemoteDataSourceImpl(sl<BookingApiService>()),
    )
    ..registerLazySingleton<BookingRepository>(
      () => BookingRepoImpl(sl<BookingRemoteDataSource>()),
    )
    ..registerLazySingleton<GetAllBookingsUseCase>(
      () => GetAllBookingsUseCase(sl<BookingRepository>()),
    )
    ..registerFactory<BookingCubit>(() => BookingCubit(sl<GetAllBookingsUseCase>()));
}

Future<void> _addCar() async {
  sl
    ..registerLazySingleton<AddCarRemoteDataSource>(
      () => AddCarRemoteDataSourceImpl(sl<AuthApiService>()),
    )
    ..registerLazySingleton<AddCarRepository>(
      () => AddCarRepoImpl(sl<AddCarRemoteDataSource>()),
    )
    ..registerLazySingleton<AddCarUseCase>(
      () => AddCarUseCase(sl<AddCarRepository>()),
    )
    ..registerFactory<AddCarCubit>(() => AddCarCubit(sl<AddCarUseCase>()));
}
