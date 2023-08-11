class LoanModel {
  String amount;
  String paidAmount;
  String code;
  String money;
  String loanTerm;
  String status;
  String interest;
  bool isPaid;

  LoanModel({
    required this.amount,
    required this.paidAmount,
    required this.code,
    required this.money,
    required this.loanTerm,
    required this.status,
    required this.interest,
    required this.isPaid,
  });
}
