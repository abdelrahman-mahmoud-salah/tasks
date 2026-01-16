import 'package:flutter/material.dart';

extension ContextExtention on BuildContext {
  //textstyle

  //colors

  Future<dynamic> pushNamed({required String pageName, Object? arg}) =>
      Navigator.of(this).pushNamed(pageName, arguments: arg);

  Future<dynamic> pushReplacedNamed({required String pageName, Object? arg}) =>
      Navigator.of(this).pushReplacementNamed(pageName, arguments: arg);

  Future<dynamic> pushNamedAndRemoveUntil({
    required String pageName,
    Object? arg,
  }) => Navigator.of(this).pushNamedAndRemoveUntil(pageName, (route) => false);

  void pop() => Navigator.of(this).pop();

  void showToastError(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void showToastSuccess(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
