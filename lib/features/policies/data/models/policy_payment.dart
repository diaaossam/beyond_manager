class MainPolicyPayment {
  MainPolicyPayment({
    this.result,
    this.totalCount,
    this.totalPages,
  });

  MainPolicyPayment.fromJson(dynamic json) {
    if (json['result'] != null) {
      result = [];
      json['result'].forEach((v) {
        result?.add(PolicyPayment.fromJson(v));
      });
    }
    totalCount = json['total_count'];
    totalPages = json['total_pages'];
  }

  List<PolicyPayment>? result;
  num? totalCount;
  num? totalPages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (result != null) {
      map['result'] = result?.map((v) => v.toJson()).toList();
    }
    map['total_count'] = totalCount;
    map['total_pages'] = totalPages;
    return map;
  }
}

class PolicyPayment {
  PolicyPayment({
    this.amount,
    this.currency,
    this.dueDate,
    this.invoiceFile,
    this.invoiceFileName,
    this.invoiced,
    this.paid,
    this.paymentDate,
    this.branchName,
    this.paymentFile,
    this.paymentFileName,
    this.paymentMethod,
  });

  PolicyPayment.fromJson(dynamic json) {
    branchName = json['Branch Name'];
    amount = json['Amount'];
    currency = json['Currency'];
    dueDate = json['Due Date'];
    invoiceFile = json['Invoice File'];
    invoiceFileName = json['Invoice File Name'];
    invoiced = json['Invoiced'];
    paid = json['Paid'];
    paymentDate = json['Payment Date'];
    paymentFile = json['Payment File'];
    paymentFileName = json['Payment File Name'];
    paymentMethod = json['Payment Method'];
  }

  num? amount;
  String? currency;
  String? branchName;
  String? dueDate;
  String? invoiceFile;
  String? invoiceFileName;
  bool? invoiced;
  bool? paid;
  String? paymentDate;
  String? paymentFile;
  String? paymentFileName;
  String? paymentMethod;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Amount'] = amount;
    map['Currency'] = currency;
    map['Due Date'] = dueDate;
    map['Invoice File'] = invoiceFile;
    map['Invoice File Name'] = invoiceFileName;
    map['Invoiced'] = invoiced;
    map['Paid'] = paid;
    map['Payment Date'] = paymentDate;
    map['Payment File'] = paymentFile;
    map['Payment File Name'] = paymentFileName;
    map['Payment Method'] = paymentMethod;
    return map;
  }
}
