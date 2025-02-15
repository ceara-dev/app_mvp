import 'package:flutter/material.dart';
import '../pages/agenda/agenda_page.dart';
import '../pages/home/home_page.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _currentIndex = 0;

  // Páginas que serão mostradas ao selecionar cada item
  final List<Widget> _pages = [
    const HomePage(),
    const AgendaPage(),
    const AgendaPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: _onItemTapped, // Atualiza o índice ao clicar
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Minha conta",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: "Agenda",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_basket),
          label: "Pedidos",
        ),
      ],
    );
  }
}
