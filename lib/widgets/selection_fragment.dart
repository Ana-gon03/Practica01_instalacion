import 'package:flutter/material.dart';
import 'common_widgets.dart';

class SelectionFragment extends StatefulWidget {
  @override
  _SelectionFragmentState createState() => _SelectionFragmentState();
}

class _SelectionFragmentState extends State<SelectionFragment> {
  bool _checkbox1 = false;
  bool _checkbox2 = false;
  bool _checkbox3 = false;
  String _radioValue = 'opcion1';
  bool _switchValue = false;
  List<String> _selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildSectionHeader('✅', 'Elementos de Selección'),
          SizedBox(height: 10),
          buildDescription(
            'Permiten al usuario seleccionar opciones de forma individual o múltiple. '
                'Incluyen checkboxes, radio buttons y switches.',
          ),
          SizedBox(height: 30),

          buildInteractiveSection([
            // CheckBoxes
            _buildSubsection('CheckBoxes', [
              _buildCheckboxTile('🍕 Pizza', _checkbox1, (value) {
                setState(() {
                  _checkbox1 = value!;
                  _updateSelectedItems();
                });
              }),
              _buildCheckboxTile('🍔 Hamburguesa', _checkbox2, (value) {
                setState(() {
                  _checkbox2 = value!;
                  _updateSelectedItems();
                });
              }),
              _buildCheckboxTile('🍣 Sushi', _checkbox3, (value) {
                setState(() {
                  _checkbox3 = value!;
                  _updateSelectedItems();
                });
              }),
            ]),

            SizedBox(height: 30),

            // Radio Buttons
            _buildSubsection('Radio Buttons', [
              _buildRadioTile('🌞 Mañana', 'opcion1'),
              _buildRadioTile('🌅 Tarde', 'opcion2'),
              _buildRadioTile('🌙 Noche', 'opcion3'),
            ]),

            SizedBox(height: 30),

            // Switch
            _buildSubsection('Switch', [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(
                      _switchValue ? Icons.notifications : Icons.notifications_off,
                      color: _switchValue ? Colors.green : Colors.grey,
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Notificaciones ${_switchValue ? "Activadas" : "Desactivadas"}',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Switch(
                      value: _switchValue,
                      onChanged: (value) => setState(() => _switchValue = value),
                      activeColor: Colors.green,
                    ),
                  ],
                ),
              ),
            ]),

            SizedBox(height: 30),

            // Results Display
            _buildResultsDisplay(),
          ]),
        ],
      ),
    );
  }

  Widget _buildSubsection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.green[700],
          ),
        ),
        SizedBox(height: 10),
        ...children,
      ],
    );
  }

  Widget _buildCheckboxTile(String title, bool value, Function(bool?) onChanged) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: CheckboxListTile(
        title: Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
        value: value,
        onChanged: onChanged,
        activeColor: Colors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Widget _buildRadioTile(String title, String value) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: RadioListTile<String>(
        title: Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
        value: value,
        groupValue: _radioValue,
        onChanged: (value) => setState(() => _radioValue = value!),
        activeColor: Colors.green,
      ),
    );
  }

  Widget _buildResultsDisplay() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.green[100]!, Colors.green[50]!],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.assessment, color: Colors.green),
              SizedBox(width: 10),
              Text(
                'Selecciones Actuales:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[800],
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            'Comidas: ${_selectedItems.isEmpty ? "Ninguna" : _selectedItems.join(", ")}',
            style: TextStyle(color: Colors.green[700]),
          ),
          SizedBox(height: 8),
          Text(
            'Horario preferido: ${_getRadioText()}',
            style: TextStyle(color: Colors.green[700]),
          ),
          SizedBox(height: 8),
          Text(
            'Notificaciones: ${_switchValue ? "Habilitadas" : "Deshabilitadas"}',
            style: TextStyle(color: Colors.green[700]),
          ),
        ],
      ),
    );
  }

  void _updateSelectedItems() {
    _selectedItems.clear();
    if (_checkbox1) _selectedItems.add('Pizza');
    if (_checkbox2) _selectedItems.add('Hamburguesa');
    if (_checkbox3) _selectedItems.add('Sushi');
  }

  String _getRadioText() {
    switch (_radioValue) {
      case 'opcion1': return 'Mañana';
      case 'opcion2': return 'Tarde';
      case 'opcion3': return 'Noche';
      default: return 'No seleccionado';
    }
  }
}