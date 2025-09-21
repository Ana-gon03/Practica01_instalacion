import 'package:flutter/material.dart';
import 'widgets/text_fields_fragment.dart';
import 'widgets/buttons_fragment.dart';
import 'widgets/selection_fragment.dart';
import 'widgets/lists_fragment.dart';
import 'widgets/info_elements_fragment.dart';
import 'models/tab_info.dart';

void main() {
  runApp(UIElementsApp());
}

class UIElementsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elementos de UI',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto',
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
        ),
      ),
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  int _currentIndex = 0;
  late TabController _tabController;

  final List<Widget> _fragments = [
    TextFieldsFragment(),
    ButtonsFragment(),
    SelectionFragment(),
    ListasFragment(),
    InfoElementsFragment(),
  ];

  final List<TabInfo> _tabs = [
    TabInfo(Icons.text_fields, 'TextFields', Colors.purple),
    TabInfo(Icons.smart_button, 'Botones', Colors.blue),
    TabInfo(Icons.check_circle, 'Selección', Colors.green),
    TabInfo(Icons.list, 'Listas', Colors.orange),
    TabInfo(Icons.info, 'Información', Colors.red),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _fragments.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              _tabs[_currentIndex].color.withOpacity(0.8),
              _tabs[_currentIndex].color.withOpacity(0.4),
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: _fragments,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            'Elementos de UI',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          Text(
            _tabs[_currentIndex].title,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Colors.grey[100]!],
        ),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: TabBar(
        controller: _tabController,
        tabs: _tabs.asMap().entries.map((entry) {
          int index = entry.key;
          TabInfo tab = entry.value;
          bool isSelected = _currentIndex == index;

          return Tab(
            height: 70, // Incrementé la altura para dar más espacio
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 4), // Reducí el padding vertical
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center, // Centrar contenido
                children: [
                  Icon(
                    tab.icon,
                    color: isSelected ? tab.color : Colors.grey,
                    size: 22, // Reducí ligeramente el tamaño del ícono
                  ),
                  SizedBox(height: 2), // Reducí el espacio entre ícono y texto
                  Flexible( // Agregué Flexible para manejar overflow
                    child: Text(
                      tab.title,
                      style: TextStyle(
                        fontSize: 9, // Reducí el tamaño de fuente
                        color: isSelected ? tab.color : Colors.grey,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                      maxLines: 1, // Limité a una línea
                      overflow: TextOverflow.ellipsis, // Agregar puntos suspensivos si es muy largo
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        indicator: BoxDecoration(),
        labelColor: Colors.transparent,
        unselectedLabelColor: Colors.transparent,
      ),
    );
  }
}