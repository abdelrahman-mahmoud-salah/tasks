import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/add_car/presentation/cubit/add_car_cubit.dart';
import 'package:flutter_application_1/features/home/add_car/presentation/widgets/add_car_bottom_sheet.dart';
import 'package:flutter_application_1/features/home/bookings/presentation/pages/all_booking.dart';
import 'package:flutter_application_1/features/home/bookings/presentation/widgets/booking_tabs.dart';
import 'package:flutter_application_1/features/home/bookings/presentation/widgets/home_header.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  String selectedTab = 'All';

  void _showAddCarBottomSheet() {
    final addCarCubit = context.read<AddCarCubit>();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: addCarCubit,
        child: const AddCarBottomSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            HomeHeader(
              onAddCarPressed: _showAddCarBottomSheet,
            ),

            // Tabs
            BookingTabs(
              selectedTab: selectedTab,
              onTabChanged: (tab) {
                setState(() {
                  selectedTab = tab;
                });
              },
            ),

            // Bookings List
            const Expanded(
              child: AllBooking(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
Widget _buildBottomNavigationBar() {
  return Container(
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withValues(alpha: 0.3),
          spreadRadius: 1,
          blurRadius: 5,
          offset: const Offset(0, -2),
        ),
      ],
    ),
    child: BottomNavigationBar(
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.directions_car),
          label: 'My Fleet',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    ),
  );
}
