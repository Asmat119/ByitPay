class AccountInfoModel {
  String title;
  List<AccountInfoRowModel> modelList;
  AccountInfoModel({required this.title, required this.modelList});
}

class AccountInfoRowModel {
  String leadingText, trailingText;
  AccountInfoRowModel({required this.leadingText, required this.trailingText});
}
