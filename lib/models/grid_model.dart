class Requisition {
  String requisitionNumber;
  String poNo;
  String requestor;
  String requisitionDate;
  String department;
  String currency;
  String amount;
  String gbpAmount;
  String vatAmount;
  String totalAmount;
  String status;
  String ceaYesNo;
  String ceaNumber;
  String remarks;

  Requisition({
    required this.requisitionNumber,
    required this.poNo,
    required this.requestor,
    required this.requisitionDate,
    required this.department,
    required this.currency,
    required this.amount,
    required this.gbpAmount,
    required this.vatAmount,
    required this.totalAmount,
    required this.status,
    required this.ceaYesNo,
    required this.ceaNumber,
    required this.remarks,
  });

  factory Requisition.fromJson(Map<String, dynamic> json) {
    return Requisition(
      requisitionNumber: json['requisitionNumber'],
      poNo: json['poNo'],
      requestor: json['requestor'],
      requisitionDate: json['requisitionDate'],
      department: json['department'],
      currency: json['currency'],
      amount: json['amount'],
      gbpAmount: json['gbpAmount'],
      vatAmount: json['vatAmount'],
      totalAmount: json['totalAmount'],
      status: json['status'],
      ceaYesNo: json['ceaYesNo'],
      ceaNumber: json['ceaNumber'],
      remarks: json['remarks'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'requisitionNumber': requisitionNumber,
      'poNo': poNo,
      'requestor': requestor,
      'requisitionDate': requisitionDate,
      'department': department,
      'currency': currency,
      'amount': amount,
      'gbpAmount': gbpAmount,
      'vatAmount': vatAmount,
      'totalAmount': totalAmount,
      'status': status,
      'ceaYesNo': ceaYesNo,
      'ceaNumber': ceaNumber,
      'remarks': remarks,
    };
  }
}
