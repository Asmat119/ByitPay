class ReceiptModel {
  String leading, trailing;
  bool? isShowDivider;
  bool? isShowTotal;
  ReceiptModel(
      {required this.leading,
      required this.trailing,
      this.isShowDivider = false,
      this.isShowTotal = false});
}
