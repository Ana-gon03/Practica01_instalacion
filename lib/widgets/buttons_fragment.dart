import 'package:flutter/material.dart';
import 'common_widgets.dart';

class ButtonsFragment extends StatefulWidget {
  @override
  _ButtonsFragmentState createState() => _ButtonsFragmentState();
}

class _ButtonsFragmentState extends State<ButtonsFragment> {
  String _lastAction = '';
  int _clickCount = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildSectionHeader('🎨', 'Botones (Button, ImageButton)'),
          SizedBox(height: 10),
          buildDescription(
            'Se usan para ejecutar una acción al hacer clic, '
                'ya sea con texto o con una imagen como ícono.',
          ),
          SizedBox(height: 30),

          buildInteractiveSection([
            // Elevated Button
            Container(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () => _handleButtonPress('Botón Elevado'),
                icon: Icon(Icons.rocket_launch),
                label: Text('Botón Elevado'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),

            // Outlined Button
            Container(
              width: double.infinity,
              height: 50,
              child: OutlinedButton.icon(
                onPressed: () => _handleButtonPress('Botón Outlined'),
                icon: Icon(Icons.favorite_border),
                label: Text('Botón Outlined'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.blue,
                  side: BorderSide(color: Colors.blue, width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),

            // Text Button
            Container(
              width: double.infinity,
              height: 50,
              child: TextButton.icon(
                onPressed: () => _handleButtonPress('Botón de Texto'),
                icon: Icon(Icons.touch_app),
                label: Text('Botón de Texto'),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.blue,
                  textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Image Buttons Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildImageButton(Icons.star, Colors.orange, 'Estrella'),
                _buildImageButton(Icons.favorite, Colors.red, 'Corazón'),
                _buildImageButton(Icons.thumb_up, Colors.green, 'Like'),
              ],
            ),
            SizedBox(height: 30),

            // Floating Action Button
            Center(
              child: FloatingActionButton.extended(
                onPressed: () => _handleButtonPress('FAB'),
                icon: Icon(Icons.add),
                label: Text('Acción Flotante'),
                backgroundColor: Colors.blue,
              ),
            ),
            SizedBox(height: 30),

            // Result Display
            if (_lastAction.isNotEmpty)
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue[100]!, Colors.blue[50]!],
                  ),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.blue[200]!),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.info, color: Colors.blue),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Última acción: $_lastAction',
                            style: TextStyle(
                              color: Colors.blue[800],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Total de clics: $_clickCount',
                      style: TextStyle(
                        color: Colors.blue[600],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
          ]),
        ],
      ),
    );
  }

  Widget _buildImageButton(IconData icon, Color color, String name) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Material(
        color: color,
        shape: CircleBorder(),
        child: InkWell(
          customBorder: CircleBorder(),
          onTap: () => _handleButtonPress(name),
          child: Container(
            width: 60,
            height: 60,
            child: Icon(icon, color: Colors.white, size: 30),
          ),
        ),
      ),
    );
  }

  void _handleButtonPress(String action) {
    setState(() {
      _lastAction = action;
      _clickCount++;
    });
  }
}