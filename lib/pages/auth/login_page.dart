import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../enum/mensagem_tipo_enum.dart';
import '../../services/my_shared_preferences.dart';
import '../../utils/console_log.dart';
import '../../utils/shared_preferences_helper.dart';
import '../../widgets/custom_codigo_field.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_password_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  final TextEditingController _codigoController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  String? descricaoEscola;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        child: GestureDetector(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(15),
            color: Colors.white,
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                 
      
                    const SizedBox(height: 80),
                    SizedBox(
                      width: 2000,
                      height: 210,
                      child: Image.asset('assets/logo.png'),
                    ),
                    Text(
                      descricaoEscola ?? '',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10, right: 5, top: 40),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Código de acesso',
                          style: TextStyle(fontSize: 13, color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: CustomCodigoField(
                        textColor: Colors.grey,
                        controller: _codigoController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, informe seu código.';
                          }
                          return null;
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10, right: 5, top: 18),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Senha de acesso',
                          style: TextStyle(fontSize: 13, color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: CustomPasswordField(
                        controller: _senhaController,
                        textColor: Colors.grey,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, informe sua senha.';
                          }
                          return null;
                        },
                      ),
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        width: double.infinity,
                        child: CustomElevatedButton(
                          isLoading: _isLoading,
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                _isLoading = true;
                              });
                              
                              MySharedPreferences mySharedPreferences = MySharedPreferences();

                              await mySharedPreferences.add(id: 1, name: 'Lucas', tokenApi: '88888888888');

                              await Future.delayed(const Duration(seconds: 3), () {
                                setState(() {
                                  _isLoading = false;
                                });
                                Navigator.pushNamed(context, '/home');
                              });
                            }
                          },
                          label: 'Submit',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
