import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../widgets/custom_bottom_nav_bar.dart';
import '../agenda/agenda_page.dart';
import '../consulta/consulta_page.dart';
import '../inicio/inicio_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  int _currentIndex = 0;

  final List<Widget> _pages = [
    const InicioPage(),
    const ConsultaPage(),
    const AgendaPage(),
  ];

  void _onItemTapped(int index) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _currentIndex = index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_currentIndex],
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
