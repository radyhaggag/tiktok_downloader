import 'package:fluttertoast/fluttertoast.dart';

import '../utils/app_colors.dart';
import '../utils/app_enums.dart';
import '../utils/font_manager.dart';

Future<bool?> buildToast({required String msg, required ToastType type}) =>
    Fluttertoast.showToast(
      msg: msg,
      fontSize: FontSize.details,
      textColor: AppColors.white,
      backgroundColor:
          type == ToastType.success ? AppColors.black : AppColors.error,
    );
