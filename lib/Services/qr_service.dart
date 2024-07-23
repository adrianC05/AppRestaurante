import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRService {
  QRViewController? controller;

  void onQRViewCreated(QRViewController controller, Function(String) onCodeScanned) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      controller.pauseCamera();
      onCodeScanned(scanData.code ?? '');
    });
  }

  void restartCamera() {
    controller?.resumeCamera();
  }

  void dispose() {
    controller?.dispose();
  }
}
