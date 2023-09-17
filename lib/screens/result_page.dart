import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savings_calculator/data/data_controller.dart';
import 'package:savings_calculator/utils/utils.dart';
import 'package:savings_calculator/widget/custom_app_bar.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final dataController = Get.find<DataController>();
  int savingTotals = 0;
  int savingNeeded = 0;
  int currentSavings = 0;

  @override
  void initState() {
    int month = dataController.product.value?.month ?? 0;
    currentSavings = int.parse(dataController.product.value?.amount ?? '0');
    int price = int.parse(dataController.product.value?.price ?? '0');
    savingTotals = month * currentSavings;
    savingNeeded = price ~/ month;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(name: 'Result'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Harga ${dataController.product.value?.name}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 5),
            Text(
              'Rp. ${Utils.formatDecimal(int.parse(dataController.product.value!.price!))},-',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            const Text(
              'Kemampuan savings per bulan',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 5),
            Text(
              'Rp. ${Utils.formatDecimal(int.parse(dataController.product.value!.amount!))},- x ${dataController.product.value?.month}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Text(
              'Uang yang akan terkumpul pada bulan ke-${dataController.product.value?.month ?? 0}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 5),
            Text(
              'Rp. ${Utils.formatDecimal(savingTotals)},-',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Text(
              'Savings per bulan yang dibutuhkan untuk membeli ${dataController.product.value?.name ?? 0}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 5),
            Text(
              'Rp. ${Utils.formatDecimal(savingNeeded)},-',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            const Text(
              'Kesimpulan',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 5),
            Text(
              currentSavings >= savingNeeded
                  ? 'Anda bisa mendapatkan ${dataController.product.value?.name} dengan jumlah savings anda.'
                  : 'Anda tidak bisa mendapatkan ${dataController.product.value?.name} dengan jumlah savings anda.',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
