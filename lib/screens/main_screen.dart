import 'package:flutter/material.dart';
import '../widgets/buttons_fragment.dart';
import '../widgets/info_elements_fragment.dart';
import '../widgets/text_fields_fragment.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
              Colors.blue[400]!,
              Colors.purple[400]!,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Componentes Básicos',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Pantalla Principal',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/second');
                        },
                        icon: Icon(Icons.arrow_forward, color: Colors.white),
                        tooltip: 'Ir a segunda pantalla',
                      ),
                    ),
                  ],
                ),
              ),

              // Tab Bar
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  labelColor: Colors.purple[700],
                  unselectedLabelColor: Colors.white,
                  tabs: [
                    Tab(
                      icon: Icon(Icons.touch_app),
                      text: 'Botones',
                    ),
                    Tab(
                      icon: Icon(Icons.info),
                      text: 'Info',
                    ),
                    Tab(
                      icon: Icon(Icons.edit),
                      text: 'Texto',
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              // Tab Views
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ButtonsFragment(),
                    InfoElementsFragment(),
                    TextFieldsFragment(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}