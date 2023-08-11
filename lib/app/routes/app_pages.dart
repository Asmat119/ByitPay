import 'package:byitpay/app/modules/generalSetting/views/customer_support_view.dart';
import 'package:byitpay/app/modules/generalSetting/views/document_view.dart';
import 'package:byitpay/app/modules/generalSetting/views/helpcenter_view.dart';
import 'package:get/get.dart';
import '../../widgets/receipt.dart';
import '../modules/ApplyLoanView/bindings/apply_loan_view_binding.dart';
import '../modules/ApplyLoanView/views/apply_loan_view_view.dart';
import '../modules/ApplyLoanView/views/employment_status_view.dart';
import '../modules/ApplyLoanView/views/how_much_view.dart';
import '../modules/ApplyLoanView/views/loan_overview_view.dart';
import '../modules/ApplyLoanView/views/loan_purpose_view.dart';
import '../modules/ApplyLoanView/views/repayment_method_view.dart';
import '../modules/ApplyLoanView/views/salary_view.dart';
import '../modules/ApplyLoanView/views/select_your_offer_view.dart';
import '../modules/ApplyLoanView/views/verify_identity_view.dart';
import '../modules/GeneralSetting/bindings/general_setting_binding.dart';
import '../modules/GeneralSetting/views/general_setting_view.dart';
import '../modules/TabView/bindings/tab_view_binding.dart';
import '../modules/TabView/views/LoanTab/loan_details_view.dart';
import '../modules/TabView/views/LoanTab/loan_document_view.dart';
import '../modules/TabView/views/LoanTab/loan_statement_view.dart';
import '../modules/TabView/views/LoanTab/loan_view.dart';
import '../modules/TabView/views/ProfileTab/views/profile_view.dart';
import '../modules/TabView/views/tab_view_view.dart';
import '../modules/changepin/bindings/changepin_binding.dart';
import '../modules/changepin/views/changepin_view.dart';
import '../modules/generalSetting/views/notification_setting_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/makepayment/bindings/makepayment_binding.dart';
import '../modules/makepayment/views/makepayment_view.dart';
import '../modules/pincode/bindings/pincode_binding.dart';
import '../modules/pincode/views/pincode_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;
  static const INITIALPINCODE = Routes.PROFILE;

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
    GetPage(
      name: _Paths.LOAN,
      page: () => const LoanView(),
      binding: TabViewBinding(),
    ),
    GetPage(
      name: _Paths.LOANDETAILS,
      page: () => LoanDetailsView(),
      binding: TabViewBinding(),
    ),
    GetPage(
      name: _Paths.LOANDOCUMENT,
      page: () => const LoanDocumentView(),
      binding: TabViewBinding(),
    ),
    GetPage(
      name: _Paths.LOANSTATEMENT,
      page: () => const LoanStatementView(),
      binding: TabViewBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: TabViewBinding(),
    ),
    GetPage(
      name: _Paths.RECEIPT,
      page: () => Receipt(),
    ),
    GetPage(
      name: _Paths.DOCUMENT,
      page: () => const DocumentView(),
      binding: GeneralSettingBinding(),
    ),
    GetPage(
      name: _Paths.HELPCENTER,
      page: () => const HelpcenterView(),
      binding: GeneralSettingBinding(),
    ),
    GetPage(
      name: _Paths.CUSTOMERSUPPORT,
      page: () => const CustomerSupportView(),
      binding: GeneralSettingBinding(),
    ),
    GetPage(
      name: _Paths.GENERAL_SETTING,
      page: () => const GeneralSettingView(),
      binding: GeneralSettingBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION_SETTING,
      page: () => const NotificationSettingView(),
      binding: GeneralSettingBinding(),
    ),
    GetPage(
      name: _Paths.CHANGEPIN,
      page: () => const ChangepinView(),
      binding: ChangepinBinding(),
    ),
    GetPage(
      name: _Paths.MAKEPAYMENT,
      page: () => MakepaymentView(),
      binding: MakepaymentBinding(),
    ),
  ];
}
