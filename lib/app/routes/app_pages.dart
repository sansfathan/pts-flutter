import 'package:get/get.dart';

import 'package:uts_flutter/app/modules/create_data/bindings/create_data_binding.dart';
import 'package:uts_flutter/app/modules/create_data/views/create_data_view.dart';
import 'package:uts_flutter/app/modules/detail_mahasiswa/bindings/detail_mahasiswa_binding.dart';
import 'package:uts_flutter/app/modules/detail_mahasiswa/views/detail_mahasiswa_view.dart';
import 'package:uts_flutter/app/modules/email_check/bindings/email_check_binding.dart';
import 'package:uts_flutter/app/modules/email_check/views/email_check_view.dart';
import 'package:uts_flutter/app/modules/forgot_password/bindings/forgot_password_binding.dart';
import 'package:uts_flutter/app/modules/forgot_password/views/forgot_password_view.dart';
import 'package:uts_flutter/app/modules/home/bindings/home_binding.dart';
import 'package:uts_flutter/app/modules/home/views/home_view.dart';
import 'package:uts_flutter/app/modules/login/bindings/login_binding.dart';
import 'package:uts_flutter/app/modules/login/views/login_view.dart';
import 'package:uts_flutter/app/modules/register/bindings/register_binding.dart';
import 'package:uts_flutter/app/modules/register/views/register_view.dart';
import 'package:uts_flutter/app/modules/update_data/bindings/update_data_binding.dart';
import 'package:uts_flutter/app/modules/update_data/views/update_data_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.EMAIL_CHECK,
      page: () => EmailCheckView(),
      binding: EmailCheckBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_MAHASISWA,
      page: () => DetailMahasiswaView(),
      binding: DetailMahasiswaBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_DATA,
      page: () => CreateDataView(),
      binding: CreateDataBinding(),
    ),
    GetPage(
      name: _Paths.UPDATE_DATA,
      page: () => UpdateDataView(),
      binding: UpdateDataBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
  ];
}
