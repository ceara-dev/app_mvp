import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionManager {
  /// Verifica e solicita permissão de estado do telefone
  Future<bool> checkPhoneStatePermission() async {
    var status = await Permission.phone.status;
    if (!status.isGranted) {
      status = await Permission.phone.request();
    }
    return status.isGranted;
  }

  /// Verifica e solicita permissão de localização (em primeiro plano)
  Future<bool> checkLocationPermission() async {
    var status = await Permission.location.status;
    if (!status.isGranted) {
      status = await Permission.location.request();
    }
    return status.isGranted;
  }

  /// Verifica e solicita permissão de localização em segundo plano
  Future<bool> checkBackgroundLocationPermission() async {
    var status = await Permission.locationAlways.status;
    if (!status.isGranted) {
      status = await Permission.locationAlways.request();
    }
    return status.isGranted;
  }

  /// Verifica e solicita permissão de localização aproximada
  Future<bool> checkCoarseLocationPermission() async {
    var status = await Permission.locationWhenInUse.status;
    if (!status.isGranted) {
      status = await Permission.locationWhenInUse.request();
    }
    return status.isGranted;
  }

  /// Verifica e solicita permissão de câmera
  Future<bool> checkCameraPermission() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      status = await Permission.camera.request();
    }
    return status.isGranted;
  }

  /// Verifica e solicita permissão de leitura e gravação no armazenamento
  Future<bool> checkStoragePermission() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      status = await Permission.storage.request();
    }
    return status.isGranted;
  }

  /// Verifica a conexão de internet
  Future<bool> checkInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  Future<bool> checkLocationExtraCommandsPermission() async {
    var status = await Permission.locationAlways.status; // Ou Permission.locationWhenInUse
    if (!status.isGranted) {
      status = await Permission.locationAlways.request(); // Ou Permission.locationWhenInUse
    }
    return status.isGranted;
  }
}
