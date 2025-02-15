import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Adicione a importação do pacote
import 'enum/mensagem_tipo_enum.dart';
import 'firebase_options.dart';
import 'pages/agenda/agenda_page.dart';
import 'pages/auth/login_page.dart';
import 'pages/consulta/consulta_page.dart';
import 'pages/home/home_page.dart';
import 'utils/console_log.dart';
import 'utils/firebase_messaging.dart';
import 'utils/permission_manager.dart';
import 'utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Load environment variables
  await dotenv.load(fileName: ".env");

  // Set system UI overlay settings
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: SystemUiOverlay.values,
  );

  // Initialize permissions and Firebase Messaging
  await _initializePermissionsAndMessaging();

  runApp(const MyApp());
}

Future<void> _initializePermissionsAndMessaging() async {
  final permissionManager = PermissionManager();

  // Verificação e solicitação de permissões necessárias
  bool hasPhonePermission = await permissionManager.checkPhoneStatePermission();
  bool hasLocationPermission = await permissionManager.checkLocationPermission();
  bool hasBackgroundLocationPermission = await permissionManager.checkBackgroundLocationPermission();
  bool hasCoarseLocationPermission = await permissionManager.checkCoarseLocationPermission();
  bool hasLocationExtraCommandsPermission = await permissionManager.checkLocationExtraCommandsPermission();
  
  ConsoleLog.mensagem(
    titulo: "Permissão de Telefone",
    mensagem: hasPhonePermission 
        ? "Permissão de estado do telefone concedida." 
        : "Permissão de estado do telefone negada.",
    tipo: hasPhonePermission ? MensagemTipo.SUCESSO : MensagemTipo.ERROR,
  );

  ConsoleLog.mensagem(
    titulo: "Permissão de Localização",
    mensagem: hasLocationPermission 
        ? "Permissão de localização concedida." 
        : "Permissão de localização negada.",
    tipo: hasLocationPermission ? MensagemTipo.SUCESSO : MensagemTipo.ERROR,
  );

  ConsoleLog.mensagem(
    titulo: "Permissão de Localização em Segundo Plano",
    mensagem: hasBackgroundLocationPermission 
        ? "Permissão de localização em segundo plano concedida." 
        : "Permissão de localização em segundo plano negada.",
    tipo: hasBackgroundLocationPermission ? MensagemTipo.SUCESSO : MensagemTipo.ERROR,
  );

  ConsoleLog.mensagem(
    titulo: "Permissão de Localização Aproximada",
    mensagem: hasCoarseLocationPermission 
        ? "Permissão de localização aproximada concedida." 
        : "Permissão de localização aproximada negada.",
    tipo: hasCoarseLocationPermission ? MensagemTipo.SUCESSO : MensagemTipo.ERROR,
  );

  // Verifica a conexão com a internet
  bool isInternetAvailable = await permissionManager.checkInternetConnection();
  ConsoleLog.mensagem(
    titulo: "Conexão com a Internet",
    mensagem: isInternetAvailable 
        ? "Conexão com a internet está disponível." 
        : "Sem conexão com a internet.",
    tipo: isInternetAvailable ? MensagemTipo.SUCESSO : MensagemTipo.ERROR,
  );

  ConsoleLog.mensagem(
    titulo: "Permissão de Acesso a Comandos de Localização Extras",
    mensagem: hasLocationExtraCommandsPermission 
        ? "Permissão de acesso a comandos de localização extras concedida." 
        : "Permissão de acesso a comandos de localização extras negada.",
    tipo: hasLocationExtraCommandsPermission ? MensagemTipo.SUCESSO : MensagemTipo.ERROR,
  );


  // Configuração do Firebase Messaging
  final myFirebaseMessaging = MyFirebaseMessaging();
  await myFirebaseMessaging.setupFirebaseMessaging();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    String appName = dotenv.env['APP_NAME'] ?? 'App Name Not Defined';

    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(title: appName),
        '/home': (context) => const HomePage(),
        '/consulta': (context) => const ConsultaPage(),
        '/agenda': (context) => const AgendaPage(),
      },
    );
  }
}
