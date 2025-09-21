import 'package:flutter/material.dart';
import 'common_widgets.dart';

class TextFieldsFragment extends StatefulWidget {
  @override
  _TextFieldsFragmentState createState() => _TextFieldsFragmentState();
}

class _TextFieldsFragmentState extends State<TextFieldsFragment> {
  final TextEditingController _basicController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _displayText = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildSectionHeader('📝', 'TextFields (EditText)'),
          SizedBox(height: 10),
          buildDescription(
            'Los TextFields Permiten al usuario ingresar y editar texto, como nombres, correos o contraseñas.',
          ),
          SizedBox(height: 30),

          buildInteractiveSection([
            _buildTextField(
              controller: _basicController,
              label: 'Texto básico',
              hint: 'Escribe algo aquí...',
              icon: Icons.text_fields,
              onChanged: (value) => setState(() => _displayText = value),
            ),
            SizedBox(height: 20),

            _buildTextField(
              controller: _emailController,
              label: 'Email',
              hint: 'ejemplo@correo.com',
              icon: Icons.email,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),

            _buildTextField(
              controller: _passwordController,
              label: 'Contraseña',
              hint: 'Tu contraseña segura',
              icon: Icons.lock,
              obscureText: true,
            ),
            SizedBox(height: 30),

            if (_displayText.isNotEmpty)
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.purple[100]!, Colors.purple[50]!],
                  ),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.purple[200]!),
                ),
                child: Row(
                  children: [
                    Icon(Icons.chat_bubble, color: Colors.purple),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Has escrito: $_displayText',
                        style: TextStyle(
                          color: Colors.purple[800],
                          fontWeight: FontWeight.w500,
                        ),
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    bool obscureText = false,
    TextInputType? keyboardType,
    Function(String)? onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          prefixIcon: Icon(icon, color: Colors.purple),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.purple, width: 2),
          ),
        ),
      ),
    );
  }
}