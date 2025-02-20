import 'package:flutter/material.dart';
import 'package:simple_barcode_scanner/enum.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class BarcodeScannerPage extends StatefulWidget {
  const BarcodeScannerPage({Key? key}) : super(key: key);

  @override
  State<BarcodeScannerPage> createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  String barcodeResult = 'Nenhum código escaneado';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scanner de Barcode'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                // Abre o scanner e espera o resultado
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SimpleBarcodeScannerPage(
                      scanType: ScanType.barcode, // Apenas Barcodes
                    ),
                  ),
                );

                // Atualiza o resultado escaneado
                if (result is String && result.isNotEmpty) {
                  setState(() {
                    barcodeResult = result;
                  });
                }
              },
              child: const Text('Iniciar Scanner de Barcode'),
            ),
            const SizedBox(height: 20),
            Text(
              'Resultado: $barcodeResult',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
