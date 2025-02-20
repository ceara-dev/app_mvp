// import 'package:flutter/material.dart';

// class BarcodeWidgetPage extends StatelessWidget {
//   const BarcodeWidgetPage({Key? key}) : super(key: key);

//   // Função de callback que será chamada quando o visualizador do scanner for criado
//   void _onBarcodeViewCreated(BarcodeViewController controller) {
//     // Aqui você pode inicializar ou configurar o scanner conforme necessário
//     print('Barcode scanner view created');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Barcode Scanner Widget'),
//       ),
//       body: Center(
//         child: SimpleBarcodeScanner(
//           onBarcodeViewCreated: _onBarcodeViewCreated, // Passando o callback

//           isShowFlashIcon: true,
//           cameraFace: CameraFace.back,
//           scanFormat: ScanFormat.ONLY_BARCODE,
//           delayMillis: 500,
//         ),
//       ),
//     );
//   }
// }
