import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Orders / Transactions'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'View Orders'),
              Tab(text: 'Order Status'),
              Tab(text: 'Invoice'),
              Tab(text: 'Order Tracking'),
            ],
            isScrollable: true,
            indicatorColor: Colors.white,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('View Orders Content')),
            Center(child: Text('Order Status Content')),
            Center(child: Text('Invoice Content')),
            Center(child: Text('Order Tracking Content')),
          ],
        ),
      ),
    );
  }
}