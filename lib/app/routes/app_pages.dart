import 'package:byitpay/app/modules/ApplyLoanView/views/employment_status_view.dart';
import 'package:byitpay/app/modules/ApplyLoanView/views/how_much_view.dart';
import 'package:byitpay/app/modules/ApplyLoanView/views/loan_overview_view.dart';
import 'package:byitpay/app/modules/ApplyLoanView/views/loan_purpose_view.dart';
import 'package:byitpay/app/modules/ApplyLoanView/views/repayment_method_view.dart';
import 'package:byitpay/app/modules/ApplyLoanView/views/salary_view.dart';
import 'package:byitpay/app/modules/ApplyLoanView/views/select_your_offer_view.dart';
import 'package:byitpay/app/modules/ApplyLoanView/views/verify_identity_view.dart';
import 'package:get/get.dart';

import '../modules/ApplyLoanView/bindings/apply_loan_view_binding.dart';
import '../modules/ApplyLoanView/views/apply_loan_view_view.dart';
import '../modules/TabView/bindings/tab_view_binding.dart';
import '../modules/TabView/views/tab_view_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/pincode/bindings/pincode_binding.dart';
import '../modules/pincode/views/pincode_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.TAB_VIEW;
  static const INITIALPINCODE = Routes.PINCODE;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PINCODE,
      page: () => PincodeView(),
      binding: PincodeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.TAB_VIEW,
      page: () => TabViewView(),
      binding: TabViewBinding(),
    ),
    GetPage(
      name: _Paths.APPLY_LOAN_VIEW,
      page: () => const ApplyLoanViewView(),
      binding: ApplyLoanViewBinding(),
    ),
    GetPage(
      name: _Paths.LOAN_PUPOSE,
      page: () => const LoanPurposeView(),
      binding: ApplyLoanViewBinding(),
    ),
    GetPage(
      name: _Paths.HOWMUCH,
      page: () => const HowMuchView(),
      binding: ApplyLoanViewBinding(),
    ),
    GetPage(
      name: _Paths.EMPLOYEMENT,
      page: () => const EmploymentStatusView(),
      binding: ApplyLoanViewBinding(),
    ),
    GetPage(
      name: _Paths.SALARY,
      page: () => const SalaryView(),
      binding: ApplyLoanViewBinding(),
    ),
    GetPage(
      name: _Paths.REPAYMENT,
      page: () => const RepaymentMethodView(),
      binding: ApplyLoanViewBinding(),
    ),
    GetPage(
      name: _Paths.VERIFYIDENTITY,
      page: () => const VerifyIdentityView(),
      binding: ApplyLoanViewBinding(),
    ),
    GetPage(
      name: _Paths.LOANOVERVIEW,
      page: () => const LoanOverviewView(),
      binding: ApplyLoanViewBinding(),
    ),
    GetPage(
      name: _Paths.SELECTOFFER,
      page: () => const SelectYourOfferView(),
      binding: ApplyLoanViewBinding(),
    ),
  ];
}
