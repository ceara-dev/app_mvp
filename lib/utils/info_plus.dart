import 'package:package_info_plus/package_info_plus.dart';

class InfoPlus {
  
  final Future<PackageInfo> info = PackageInfo.fromPlatform();

  Future<String> get appName async {
    final packageInfo = await info;
    return packageInfo.appName;
  }

  Future<String> get packageName async {
    final packageInfo = await info;
    return packageInfo.packageName;
  }

  Future<String> get version async {
    final packageInfo = await info;
    return packageInfo.version;
  }

  Future<String> get buildNumber async {
    final packageInfo = await info;
    return packageInfo.buildNumber;
  }

  Future<String> get buildSignature async {
    final packageInfo = await info;
    return packageInfo.buildSignature;
  }
}
