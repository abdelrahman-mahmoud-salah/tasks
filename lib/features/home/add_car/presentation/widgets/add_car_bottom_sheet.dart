import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/extension/context_extention.dart';
import 'package:flutter_application_1/core/widgets/primary_button.dart';
import 'package:flutter_application_1/features/home/add_car/presentation/cubit/add_car_cubit.dart';
import 'package:flutter_application_1/features/home/add_car/presentation/cubit/add_car_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class AddCarBottomSheet extends StatelessWidget {
  const AddCarBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddCarCubit, AddCarState>(
      listener: (context, state) {
        if (state.screenStatus == AddCarStateValue.error) {
          context.showToastError(state.failures ?? 'Failed to add car');
        } else if (state.screenStatus == AddCarStateValue.success) {
          context.showToastSuccess('Car added successfully');
          context.pop();
          // Bookings will be refreshed by BlocListener in HomeView
        }
      },
      builder: (context, state) {
        final cubit = context.read<AddCarCubit>();
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
          ),
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            top: 20.h,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20.h,
          ),
          child: Form(
            key: cubit.formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Handle bar
                  Center(
                    child: Container(
                      width: 40.w,
                      height: 4.h,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(2.r),
                      ),
                    ),
                  ),

                  SizedBox(height: 20.h),

                  // Title
                  Text(
                    'Add Car',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 24.h),

                  // Car Type Field
                  TextFormField(
                    controller: cubit.carTypeController,
                    decoration: InputDecoration(
                      labelText: 'Car Type',
                      hintText: 'e.g., Innova Crysta',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter car type';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 16.h),

                  // Plate Number Field
                  TextFormField(
                    controller: cubit.plateNoController,
                    decoration: InputDecoration(
                      labelText: 'Plate Number',
                      hintText: 'e.g., MH12XY1234',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter plate number';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 16.h),

                  // SSNO Field
                  TextFormField(
                    controller: cubit.ssnoController,
                    decoration: InputDecoration(
                      labelText: 'SSNO',
                      hintText: 'e.g., SSN908080',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter SSNO';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 24.h),

                  // Submit Button
                  if (state.screenStatus == AddCarStateValue.loading)
                    const Center(child: CircularProgressIndicator())
                  else
                    PrimaryButton(
                      label: 'Add Car',
                      onPressed: () async {
                        if (cubit.formKey.currentState!.validate()) {
                          // Get user_id from token storage or login response
                          // For now, using a placeholder - you may need to store user_id during login
                          final userId = "123456";
                        
                            await cubit.addCar(userId);
                          
                        }
                      },
                      isLoading: false,
                    ),

                  SizedBox(height: 8.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}