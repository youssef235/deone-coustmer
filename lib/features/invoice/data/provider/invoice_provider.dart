import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasq/features/invoice/data/model/invoice.dart';
import 'package:wasq/features/invoice/data/repository/invoice_repository.dart';
import 'package:wasq/features/invoice/data/states/invoice_state.dart';

import '../../../../utils/utils.dart';


final invoiceNotifierProvider =
    StateNotifierProvider<InvoiceStateNotifier, InvoiceState>((ref) {
  final repo = ref.watch(invoiceRepositoryProvider);
  return InvoiceStateNotifier(repo, null);
});

class InvoiceStateNotifier extends StateNotifier<InvoiceState> {
  final InvoiceRepository _repo;

  InvoiceStateNotifier(this._repo, [Invoice? state])
      : super(const InvoiceState());

  Future<Invoice?> getInvoice(int project_id) async {
    state = state.copyWith(loading: true);
    try {
      Invoice res = await _repo.getInvoice(project_id);
      state = state.copyWith(invoiceResponse: res, loading: false);
      return res;
    } catch (e) {
      AppSnackbar.show(buildSnackBar(text: e.toString()));
      state = state.copyWith(loading: false, errorMessage: e.toString());
    }
  }

  Future getInvoicePdf(int invoice) async {
    state = state.copyWith(loading: true);
    try {
      var res = await _repo.getInvoicePdf(invoice);
      state = state.copyWith(loading: false);
      return res;
    } catch (e) {
      state = state.copyWith(loading: false, errorMessage: e.toString());
    }
  }


  Future createPayment({
    required int invoiceID,
    String? orderID,
    String? name,
    String? paymentMethod,
  }) async {
    print("Starting createPayment"); // بداية عملية إنشاء الدفع
    try {
      // طباعة القيم المدخلة
      print("Creating payment with invoiceID: $invoiceID, orderID: $orderID, name: $name, paymentMethod: $paymentMethod");

      String res = await _repo.createPayment(
        paymentMethod: paymentMethod,
        invoiceID: invoiceID,
        name: name!,
        orderID: orderID!,
      );

      print("Payment created successfully: $res"); // طباعة النتيجة
      state = state.copyWith(loading: false);
      return res;
    } catch (e) {
      print("Error in createPayment: $e"); // طباعة الخطأ
      state = state.copyWith(loading: false, errorMessage: e.toString());
    }
  }

  void setSelectedPaymentString(String payment) {
    state = state.copyWith(selectedPaymentString: payment);
  }

}
