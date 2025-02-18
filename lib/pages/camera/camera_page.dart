import 'package:flutter/material.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

import 'barcode_widget_page.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  String result = '';

  // Método para construir o BarcodeAppBar
  BarcodeAppBar _buildBarcodeAppBar() {
    return const BarcodeAppBar(
      appBarTitle: 'Test',
      centerTitle: false,
      enableBackButton: true,
      backButtonIcon: Icon(Icons.arrow_back_ios),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () async {
                String? res = await SimpleBarcodeScanner.scanBarcode(
                  context,
                  barcodeAppBar: _buildBarcodeAppBar(),
                  isShowFlashIcon: true,
                  delayMillis: 500,
                  cameraFace: CameraFace.back,
                  scanFormat: ScanFormat.ONLY_BARCODE,
                );

                setState(() {
                  result =
                      res ?? 'Scan failed or canceled'; // Tratamento de erro
                });
              },
              child: const Text('Scan Barcode'),
            ),
            const SizedBox(
              height: 10,
            ),
            Text('Scan Barcode Result: $result'),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                SimpleBarcodeScanner.streamBarcode(
                  context,
                  barcodeAppBar: _buildBarcodeAppBar(),
                  isShowFlashIcon: true,
                  delayMillis: 2000,
                ).listen((event) {
                  print("Stream Barcode Result: $event");
                });
              },
              child: const Text('Stream Barcode'),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const BarcodeWidgetPage();
                }));
              },
              child: const Text('Barcode Scanner Widget(Android Only)'),
            ),
          ],
        ),
      ),
    );
  }
}
