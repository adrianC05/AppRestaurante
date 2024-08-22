// lib/Views/scanner_screen.dart
import 'package:flutter/material.dart';
import 'package:proyecto/Views/login.dart';
import 'package:proyecto/Views/home_screen.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../Services/qr_service.dart';

class ScannerScreen extends StatefulWidget {
  @override
  _ScannerScreenState createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  final QRService qrService = QRService();

  @override
  void reassemble() {
    super.reassemble();
    if (qrService.controller != null) {
      qrService.controller!.pauseCamera();
    }
    qrService.controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurante'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: Icon(Icons.login, size: 30),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: QRView(
              key: qrKey,
              onQRViewCreated: (controller) {
                qrService.onQRViewCreated(controller, (scannedCode) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          HomeScreen(tableNumber: scannedCode),
                    ),
                  ).then((_) => qrService.restartCamera());
                });
              },
              overlay: QrScannerOverlayShape(
                borderColor: Colors.green,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: MediaQuery.of(context).size.width * 0.8,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.qr_code_scanner,
                    size: 50,
                    color: Colors.green,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Apunta la cámara al código QR',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    qrService.dispose();
    super.dispose();
  }
}
