import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/features/home/bookings/presentation/cubit/booking_cubit.dart';
import 'package:task/features/home/bookings/presentation/cubit/booking_state.dart';
import 'package:task/features/home/bookings/presentation/widgets/booking_card.dart';

class AllBooking extends StatelessWidget {
  const AllBooking({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingCubit, BookingState>(
      builder: (context, state) {
        if (state.screenStatus == BookingStateValue.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.screenStatus == BookingStateValue.error) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  state.failures ?? 'An error occurred',
                  style: TextStyle(fontSize: 16.sp),
                ),
                SizedBox(height: 16.h),
                ElevatedButton(
                  onPressed: () {
                    context.read<BookingCubit>().getAllBookings();
                  },
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        } else {
          final bookings = state.bookings ?? [];
    
          if (bookings.isEmpty) {
            return Center(
              child: Text(
                'No bookings found',
                style: TextStyle(fontSize: 16.sp),
              ),
            );
          }
    
          return ListView.builder(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 8.h,
            ),
            itemCount: bookings.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: BookingCard(booking: bookings[index]),
              );
            },
          );
        }
      },
    );
  }
}