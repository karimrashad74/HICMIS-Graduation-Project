import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders / Transactions'),
      ),
      body: const Center(
        child: Text('Orders Screen Content'),
      ),
    );
  }
}