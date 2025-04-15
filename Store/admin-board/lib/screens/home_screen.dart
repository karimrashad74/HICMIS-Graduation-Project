import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin_board/models/item.dart';
import 'package:admin_board/providers/item_provider.dart';

import 'admin_profile_screen.dart';
import 'orders_screen.dart';
import 'overview_screen.dart';
import 'product_management_screen.dart';
import 'users_management_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Admin Menu'),
            ),
            ListTile(
              title: const Text('Overview / Dashboard'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const OverviewScreen()));
              },
            ),
            ListTile(
              title: const Text('Users Management'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const UsersManagementScreen()));
              },
            ),
            ListTile(
              title: const Text('Product Management'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductManagementScreen()));
              },
            ),
            ListTile(
              title: const Text('Orders / Transactions'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const OrdersScreen()));
              },
            ),
            ListTile(
              title: const Text('Admin Profile'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminProfileScreen()));
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // TODO: Implement add item functionality
            },
          ),
        ],
      ),
      body: Consumer<ItemProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
            itemCount: provider.items.length,
            itemBuilder: (context, index) {
              final item = provider.items[index];
              return ListTile(
                title: Text(item.name),
                subtitle: Text('\${item.price}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        // TODO: Implement edit item functionality
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        // TODO: Implement delete item functionality
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}