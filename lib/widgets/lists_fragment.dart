import 'package:flutter/material.dart';
import 'common_widgets.dart';

class ListasFragment extends StatefulWidget {
  @override
  _ListasFragmentState createState() => _ListasFragmentState();
}

class _ListasFragmentState extends State<ListasFragment> {
  List<ListItem> items = [
    ListItem('🎬', 'Películas', 'Avengers: Endgame', Colors.red),
    ListItem('🎵', 'Música', 'Bohemian Rhapsody', Colors.purple),
    ListItem('📚', 'Libros', 'El Principito', Colors.blue),
    ListItem('🎮', 'Juegos', 'The Legend of Zelda', Colors.green),
    ListItem('🍕', 'Comida', 'Pizza Margherita', Colors.orange),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSectionHeader('📋', 'Listas (RecyclerView/ListView)'),
              SizedBox(height: 10),
              buildDescription(
                'Muestran conjuntos de elementos de forma organizada '
                    'y desplazable, ideales para listas largas.',
              ),
            ],
          ),
        ),

        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListView.builder(
              padding: EdgeInsets.all(15),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        item.color.withOpacity(0.1),
                        Colors.white,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: item.color.withOpacity(0.2),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: item.color.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          item.icon,
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                    title: Text(
                      item.category,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: item.color.withOpacity(0.9),
                      ),
                    ),
                    subtitle: Text(
                      item.title,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                    trailing: Container(
                      decoration: BoxDecoration(
                        color: item.color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.favorite_border, color: item.color),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('❤️ Te gusta ${item.title}'),
                              backgroundColor: item.color,
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    onTap: () {
                      _showItemDetails(item);
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  void _showItemDetails(ListItem item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  item.color.withOpacity(0.1),
                  Colors.white,
                ],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: item.color.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      item.icon,
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  item.title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: item.color,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Categoría: ${item.category}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(Icons.close),
                  label: Text('Cerrar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: item.color,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ListItem {
  final String icon;
  final String category;
  final String title;
  final Color color;

  ListItem(this.icon, this.category, this.title, this.color);
}