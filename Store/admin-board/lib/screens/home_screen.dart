import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin_board/models/item.dart';
import 'package:admin_board/providers/item_provider.dart';
import 'package:admin_board/theme/admin_theme.dart';

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
      drawer: LayoutBuilder(
        builder: (context, constraints) {
          return Drawer(
            width: constraints.maxWidth > 600 ? 300 : 250,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: AdminTheme.primaryColor,
                  ),
                  child: Text('Admin Menu', style: TextStyle(fontSize: 24, color: Colors.white)),
                ),
                ListTile(
                  leading: const Icon(Icons.dashboard),
                  title: const Text('Overview / Dashboard'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const OverviewScreen()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.people),
                  title: const Text('Users Management'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const UsersManagementScreen()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.shopping_bag),
                  title: const Text('Product Management'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductManagementScreen()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.receipt),
                  title: const Text('Orders / Transactions'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const OrdersScreen()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('Admin Profile'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminProfileScreen()));
                  },
                ),
              ],
            ),
          );
        },
      ),
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Add Item',
            onPressed: () {
              // TODO: Implement add item functionality
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh',
            onPressed: () {},
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: constraints.maxWidth > 600 
                ? GridView.count(
                    crossAxisCount: constraints.maxWidth > 900 ? 3 : 2,
                    childAspectRatio: 1.5,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    padding: const EdgeInsets.all(16),
                    children: [
                      Card(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Overview', style: Theme.of(context).textTheme.titleLarge),
                                const SizedBox(height: 8),
                                const Text('Total Users: 120'),
                                const Text('Total Products: 45'),
                                const Text('Recent Orders: 12'),
                                const SizedBox(height: 16),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const OverviewScreen()));
                                  },
                                  child: const Text('See More'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AdminTheme.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Users Management', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                const SizedBox(height: 8),
                                const Text('Active Users: 98'),
                                const Text('New Users Today: 5'),
                                const SizedBox(height: 16),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const UsersManagementScreen()));
                                  },
                                  child: const Text('See More'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Product Management', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                const SizedBox(height: 8),
                                const Text('Total Products: 45'),
                                const Text('Out of Stock: 3'),
                                const SizedBox(height: 16),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductManagementScreen()));
                                  },
                                  child: const Text('See More'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Orders', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                const SizedBox(height: 8),
                                const Text('Pending Orders: 5'),
                                const Text('Completed Today: 7'),
                                const SizedBox(height: 16),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const OrdersScreen()));
                                  },
                                  child: const Text('See More'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Admin Profile', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                const SizedBox(height: 8),
                                const Text('Last Login: Today'),
                                const SizedBox(height: 16),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminProfileScreen()));
                                  },
                                  child: const Text('See More'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Card(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Overview', style: Theme.of(context).textTheme.titleLarge),
                                const SizedBox(height: 8),
                                const Text('Total Users: 120'),
                                const Text('Total Products: 45'),
                                const Text('Recent Orders: 12'),
                                const SizedBox(height: 16),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const OverviewScreen()));
                                  },
                                  child: const Text('See More'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AdminTheme.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Card(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Users Management', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                const SizedBox(height: 8),
                                const Text('Active Users: 98'),
                                const Text('New Users Today: 5'),
                                const SizedBox(height: 16),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const UsersManagementScreen()));
                                  },
                                  child: const Text('See More'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Product Management', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                const SizedBox(height: 8),
                                const Text('Total Products: 45'),
                                const Text('Out of Stock: 3'),
                                const SizedBox(height: 16),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductManagementScreen()));
                                  },
                                  child: const Text('See More'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Orders', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                const SizedBox(height: 8),
                                const Text('Pending Orders: 5'),
                                const Text('Completed Today: 7'),
                                const SizedBox(height: 16),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const OrdersScreen()));
                                  },
                                  child: const Text('See More'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Admin Profile', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                const SizedBox(height: 8),
                                const Text('Last Login: Today'),
                                const SizedBox(height: 16),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminProfileScreen()));
                                  },
                                  child: const Text('See More'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}