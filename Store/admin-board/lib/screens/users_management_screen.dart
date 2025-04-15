import 'package:flutter/material.dart';
import 'package:admin_board/theme/admin_theme.dart';

class UsersManagementScreen extends StatelessWidget {
  const UsersManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users Management'),
        backgroundColor: AdminTheme.primaryColor,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                'User Management Dashboard',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('ID')),
                      DataColumn(label: Text('Name')),
                      DataColumn(label: Text('Email')),
                      DataColumn(label: Text('Status')),
                      DataColumn(label: Text('Actions')),
                    ],
                    rows: List<DataRow>.generate(
                      10,
                      (index) => DataRow(
                        cells: [
                          DataCell(Text((index + 1).toString())),
                          DataCell(Text('User ${index + 1}')),
                          DataCell(Text('user${index + 1}@example.com')),
                          DataCell(
                            Text(
                              index % 3 == 0 ? 'Active' : 'Inactive',
                              style: TextStyle(
                                color: index % 3 == 0 ? Colors.green : Colors.red,
                              ),
                            ),
                          ),
                          DataCell(
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.visibility),
                                  color: Colors.blue,
                                  onPressed: () {
                                    // View user action
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  color: Colors.orange,
                                  onPressed: () {
                                    // Edit user action
                                  },
                                ),
                                IconButton(
                                  icon: Icon(
                                    index % 3 == 0
                                        ? Icons.toggle_on
                                        : Icons.toggle_off,
                                  ),
                                  color: index % 3 == 0 ? Colors.green : Colors.red,
                                  onPressed: () {
                                    // Toggle user status
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  color: Colors.red,
                                  onPressed: () {
                                    // Delete user action
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: const Text('Confirm Delete'),
                                        content: const Text(
                                            'Are you sure you want to delete this user?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(context),
                                            child: const Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              // Delete logic here
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Delete'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}