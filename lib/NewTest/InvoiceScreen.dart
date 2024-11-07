import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class InvoiceScreen extends StatelessWidget {
  final int projectId;

  // استقبال projectId كمعامل في البناء
  InvoiceScreen({required this.projectId});

  Future<void> fetchInvoice() async {
    try {
      final response = await Dio().post(
        'https://t8nat.cloud/api/get-invoice',
        data: {'project_id': projectId},
      );
      print(response.data); // طباعة البيانات القادمة من API
    } catch (e) {
      print('Error fetching invoice: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // استدعاء الدالة لجلب البيانات
    fetchInvoice();

    return Scaffold(
      appBar: AppBar(
        title: Text('Invoice Screen'),
      ),
      body: Center(
        child: Text('Project ID: $projectId'),
      ),
    );
  }
}
