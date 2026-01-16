import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/extension/context_extention.dart';
import 'package:task/core/routes/app_router.dart';
import 'package:task/core/storage/token_storage.dart';
import 'package:task/core/storage/user_storage.dart';

class HomeHeader extends StatelessWidget {
  final VoidCallback onAddCarPressed;

  const HomeHeader({super.key, required this.onAddCarPressed});

  Future<void> _logout(BuildContext context) async {
    // Show confirmation dialog
    final shouldLogout = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Logout'),
            content: const Text('Are you sure you want to logout?'),
            actions: [
              TextButton(
                onPressed: () => context.pop(),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () { 
                  TokenStorage.clearToken();
                  UserStorage.clearUserId();
                  context.pushNamedAndRemoveUntil(pageName: AppRouter.login);
                  context.showToastSuccess('Logged out successfully');
             
                },
                child: const Text('Logout'),
              ),
            ],
          ),
    );

    if (shouldLogout == true && context.mounted) {
      // Clear token and user data
      await TokenStorage.clearToken();
      await UserStorage.clearUserId();

      // Navigate to login and clear navigation stack
      context.pushNamedAndRemoveUntil(pageName: AppRouter.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        children: [
          // Hamburger menu with logout
          PopupMenuButton<String>(
            icon: const Icon(Icons.menu),
            onSelected: (value) {
              if (value == 'logout') {
                _logout(context);
              }
            },
            itemBuilder:
                (context) => [
                  const PopupMenuItem(
                    value: 'logout',
                    child: Row(
                      children: [
                        Icon(Icons.logout, color: Colors.red),
                        SizedBox(width: 8),
                        Text('Logout'),
                      ],
                    ),
                  ),
                ],
          ),

         

          // Clock icon and text
          Row(
            children: [
              Icon(Icons.access_time, size: 16.sp, color: Colors.grey),
              SizedBox(width: 4.w),
              Text(
                'On time, every time.',
                style: TextStyle(fontSize: 12.sp, color: Colors.grey),
              ),
            ],
          ),

          SizedBox(width: 8.w),

          // Vertical ellipsis
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Handle more options
            },
          ),

          // Add Car Button
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            color: Colors.orange,
            onPressed: onAddCarPressed,
            tooltip: 'Add Car',
          ),
        ],
      ),
    );
  }
}
