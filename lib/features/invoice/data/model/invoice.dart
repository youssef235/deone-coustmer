import '../../../orders/data/model/order_response.dart';

List<Attachment> attachmentFromJson(List str) => List<Attachment>.from(
      str.map(
        (x) => Attachment.fromJson(x),
      ),
    );

class Invoice {
  int? id;
  String? invoiceNo;
  double? projectCost;
  double? equipmentCost;
  double? totalCost;
  String? status;
  String? noticePayee;
  String? noticePayer;
  String? pdf;
  List<Attachment>? attachments;
  List<Attachment>? attachment_proposal;

  Invoice(
      {this.id,
      this.invoiceNo,
      this.projectCost,
      this.equipmentCost,
      this.totalCost,
      this.status,
      this.noticePayee,
      this.noticePayer,
      this.attachments,
      this.attachment_proposal,
      this.pdf});

  Invoice.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    invoiceNo = json['invoice_no'];
    projectCost = json['project_cost'].toDouble();
    equipmentCost = json['equipment_cost'].toDouble();
    totalCost = json['total_cost'].toDouble();
    status = json['status'];
    attachments = json['attachment'] == null
        ? []
        : attachmentFromJson(json['attachment']);
    attachment_proposal = json['attachment_proposal'] == null
        ? []
        : attachmentFromJson(json['attachment_proposal']);
    noticePayee = json['notice_payee'];
    noticePayer = json['notice_payer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['invoice_no'] = this.invoiceNo;
    data['project_cost'] = this.projectCost;
    data['equipment_cost'] = this.equipmentCost;
    data['total_cost'] = this.totalCost;
    data['status'] = this.status;
    data['attachment'] = this.attachments;
    data['attachment_proposal'] = this.attachment_proposal;

    data['notice_payee'] = this.noticePayee;
    data['notice_payer'] = this.noticePayer;
    return data;
  }
}
