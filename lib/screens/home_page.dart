import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController timeleftController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  String? price = '0';
  static const _locale = 'id';
  String _formatNumber(String s) =>
      NumberFormat.decimalPattern(_locale).format(int.parse(s));
  String get _currency =>
      NumberFormat.compactSimpleCurrency(locale: _locale).currencySymbol;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'Savings Calculator',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
        ),
        backgroundColor: Colors.teal[50],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Row(),
            const SizedBox(height: 20),
            const Text(
              'Nama Barang',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 5),
            TextField(
              controller: nameController,
              cursorColor: Colors.teal,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 10),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 0.5,
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.teal[100]!,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Harga Barang',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 5),
            TextField(
              controller: priceController,
              decoration: InputDecoration(
                prefixText: _currency,
                contentPadding: const EdgeInsets.only(left: 10),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 0.5,
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.teal[100]!,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: (value) {
                value = _formatNumber(value.replaceAll('.', ''));
                priceController.value = TextEditingValue(
                  text: value,
                  selection: TextSelection.collapsed(offset: value.length),
                );
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Berapa lama lagi barang akan kamu beli',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 5),
            TextField(
              controller: timeleftController,
              decoration: InputDecoration(
                suffix: const Text('Bulan'),
                contentPadding: const EdgeInsets.only(left: 10, right: 20),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 0.5,
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.teal[100]!,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Uang yang bisa ditabung tiap bulannya',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 5),
            TextField(
              controller: amountController,
              decoration: InputDecoration(
                prefix: const Text('Rp.'),
                contentPadding: const EdgeInsets.only(left: 10),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 0.5,
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.teal[100]!,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: (value) {
                value = _formatNumber(value.replaceAll('.', ''));
                amountController.value = TextEditingValue(
                  text: value,
                  selection: TextSelection.collapsed(offset: value.length),
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                backgroundColor: Colors.teal,
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Lihat Hasil Perhitungan',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
