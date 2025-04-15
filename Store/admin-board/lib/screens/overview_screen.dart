import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('لوحة التحكم'),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.print),
          tooltip: 'تصدير تقرير PDF',
          onPressed: () => _generatePdfReport(context),
        ),
        IconButton(
          icon: const Icon(Icons.notifications),
          tooltip: 'الإشعارات',
          onPressed: () {},
        ),
      ],
    );
  }

  Future<void> _generatePdfReport(BuildContext context) async {
    try {
      final pdf = pw.Document();
      
      // إضافة محتوى التقرير
      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
            return pw.Directionality(
              textDirection: pw.TextDirection.rtl,
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Center(
                    child: pw.Text(
                      'تقرير لوحة التحكم',
                      style: pw.TextStyle(
                        fontSize: 24,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  ),
                  pw.SizedBox(height: 20),
                  pw.Container(
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          'إحصائيات عامة',
                          style: pw.TextStyle(
                            fontSize: 18,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.SizedBox(height: 10),
                        pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Container(
                              padding: const pw.EdgeInsets.all(8),
                              decoration: pw.BoxDecoration(
                                border: pw.Border.all(color: PdfColors.grey),
                                borderRadius: pw.BorderRadius.circular(8),
                              ),
                              child: pw.Column(
                                children: [
                                  pw.Text(
                                    'إجمالي المبيعات',
                                    style: pw.TextStyle(fontSize: 14),
                                  ),
                                  pw.SizedBox(height: 4),
                                  pw.Text(
                                    '1,234',
                                    style: pw.TextStyle(
                                      fontSize: 16,
                                      fontWeight: pw.FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            pw.Container(
                              padding: const pw.EdgeInsets.all(8),
                              decoration: pw.BoxDecoration(
                                border: pw.Border.all(color: PdfColors.grey),
                                borderRadius: pw.BorderRadius.circular(8),
                              ),
                              child: pw.Column(
                                children: [
                                  pw.Text(
                                    'عدد الطلبات',
                                    style: pw.TextStyle(fontSize: 14),
                                  ),
                                  pw.SizedBox(height: 4),
                                  pw.Text(
                                    '56',
                                    style: pw.TextStyle(
                                      fontSize: 16,
                                      fontWeight: pw.FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            pw.Container(
                              padding: const pw.EdgeInsets.all(8),
                              decoration: pw.BoxDecoration(
                                border: pw.Border.all(color: PdfColors.grey),
                                borderRadius: pw.BorderRadius.circular(8),
                              ),
                              child: pw.Column(
                                children: [
                                  pw.Text(
                                    'العملاء النشطين',
                                    style: pw.TextStyle(fontSize: 14),
                                  ),
                                  pw.SizedBox(height: 4),
                                  pw.Text(
                                    '789',
                                    style: pw.TextStyle(
                                      fontSize: 16,
                                      fontWeight: pw.FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  pw.SizedBox(height: 20),
                  pw.Container(
                    padding: const pw.EdgeInsets.all(8),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.grey),
                      borderRadius: pw.BorderRadius.circular(8),
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          'الدخل الشهري',
                          style: pw.TextStyle(
                            fontSize: 16,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.SizedBox(height: 10),
                        pw.Text(
                          '12,345 ريال',
                          style: pw.TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  pw.SizedBox(height: 20),
                  pw.Container(
                    padding: const pw.EdgeInsets.all(8),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.grey),
                      borderRadius: pw.BorderRadius.circular(8),
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          'الإشعارات الأخيرة',
                          style: pw.TextStyle(
                            fontSize: 16,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.SizedBox(height: 10),
                        pw.Text(
                          'لا توجد إشعارات جديدة',
                          style: pw.TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );

      // حفظ/طباعة حسب المنصة
      if (kIsWeb) {
        // للويب - استخدام الطباعة المباشرة
        await Printing.layoutPdf(
          onLayout: (PdfPageFormat format) async => pdf.save(),
        );
      } else {
        // للجوال والديسكتوب - حفظ الملف
        final String? outputPath = await FilePicker.platform.saveFile(
          dialogTitle: 'حفظ التقرير',
          fileName: 'تقرير_لوحة_التحكم_${DateTime.now().toString().split(' ')[0]}.pdf',
          allowedExtensions: ['pdf'],
        );

        if (outputPath != null) {
          final file = File(outputPath);
          await file.writeAsBytes(await pdf.save());
          await OpenFile.open(outputPath);
        }
      }

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('حدث خطأ أثناء إنشاء التقرير: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Widget _buildBody(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 600;
    
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(isMobile ? 12.0 : 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStatisticsRow(isMobile),
            const SizedBox(height: 20),
            _buildIncomeCardsRow(isMobile),
            const SizedBox(height: 20),
            _buildIncomeChartSection(),
            const SizedBox(height: 20),
            _buildNotificationsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatisticsRow(bool isMobile) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (isMobile) {
          return Column(
            children: [
              _buildStatCard('المستخدمون', '١٬٢٤٥', Icons.people, Colors.blue),
              const SizedBox(height: 12),
              _buildStatCard('الطلبات', '٣٥٦', Icons.shopping_cart, Colors.green),
              const SizedBox(height: 12),
              _buildStatCard('المنتجات', '٨٩', Icons.inventory, Colors.orange),
            ],
          );
        } else {
          return Row(
            children: [
              Expanded(
                child: _buildStatCard('المستخدمون', '١٬٢٤٥', Icons.people, Colors.blue),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard('الطلبات', '٣٥٦', Icons.shopping_cart, Colors.green),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard('المنتجات', '٨٩', Icons.inventory, Colors.orange),
              ),
            ],
          );
        }
      },
    );
  }

  Widget _buildIncomeCardsRow(bool isMobile) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (isMobile) {
          return Column(
            children: [
              _buildStatCard('الدخل اليومي', '٢٬١٠٠ ج.م', Icons.today, Colors.purple),
              const SizedBox(height: 12),
              _buildStatCard('الدخل الشهري', '٤٨٬٥٠٠ ج.م', Icons.calendar_month, Colors.red),
            ],
          );
        } else {
          return Row(
            children: [
              Expanded(
                child: _buildStatCard('الدخل اليومي', '٢٬١٠٠ ج.م', Icons.today, Colors.purple),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard('الدخل الشهري', '٤٨٬٥٠٠ ج.م', Icons.calendar_month, Colors.red),
              ),
            ],
          );
        }
      },
    );
  }

  Widget _buildIncomeChartSection() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'اتجاه الدخل الأسبوعي',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 240,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 3000,
                  barTouchData: _buildBarTouchData(),
                  titlesData: _buildTitlesData(),
                  borderData: FlBorderData(show: false),
                  barGroups: _generateDailyIncomeData(),
                  gridData: FlGridData(show: true),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<BarChartGroupData> _generateDailyIncomeData() {
    final amounts = [1200, 1800, 1500, 2100, 1900, 2500, 1700];
    return List.generate(7, (index) {
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: amounts[index].toDouble(),
            color: Colors.blue,
            width: 22,
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      );
    });
  }

  FlTitlesData _buildTitlesData() {
    const weekDays = ['الإثنين', 'الثلاثاء', 'الأربعاء', 'الخميس', 'الجمعة', 'السبت', 'الأحد'];
    
    return FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 36,
          getTitlesWidget: (value, meta) {
            return Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                weekDays[value.toInt()],
                style: const TextStyle(fontSize: 12),
              ),
            );
          },
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 50,
          interval: 1000,
          getTitlesWidget: (value, meta) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                '${value.toInt()} ج.م',
                style: const TextStyle(fontSize: 12),
              ),
            );
          },
        ),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
    );
  }

  BarTouchData _buildBarTouchData() {
    return BarTouchData(
      enabled: true,
      touchTooltipData: BarTouchTooltipData(
        getTooltipColor: (_) => Colors.blueGrey,
        getTooltipItem: (group, groupIndex, rod, rodIndex) {
          return BarTooltipItem(
            '${rod.toY.toInt()} جنيه مصري',
            const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          );
        },
      ),
    );
  }

  Widget _buildNotificationsSection() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'آخر التنبيهات',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildNotificationTile(
              'طلب جديد #٣٥٦ تم استلامه',
              Icons.notifications_active,
              Colors.red,
            ),
            _buildNotificationTile(
              'كمية منخفضة للمنتج X',
              Icons.warning,
              Colors.orange,
            ),
            _buildNotificationTile(
              'تحديث نظام متاح',
              Icons.system_update,
              Colors.blue,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 24, color: color),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 6),
            Text(
              value,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationTile(
    String message,
    IconData icon,
    Color color,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 20, color: color),
        ),
        title: Text(
          message,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          'منذ ساعتين',
          style: TextStyle(color: Colors.grey[600], fontSize: 12),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {},
      ),
    );
  }
}