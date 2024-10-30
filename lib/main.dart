import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizza Menu',
      home: MenuScreen(),
    );
  }
}

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pizza Menu'),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.orange[300],
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.network(
                'https://img.freepik.com/premium-photo/close-up-view-baked-homemade-piza-rustic-pizza-home-made-food-tasty-pizza-with-vegetables-basil_87555-10790.jpg',
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.error);
                },
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(16.0),
                children: [
                  _buildMenuItem(
                    'Pizza Large Meat',
                    'Available',
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWKBc8NugLQUSORAxFJV0SebbmyCXyEgECYw&s',
                    13,
                  ),
                  _buildMenuItem(
                    'Pizza Large Fish',
                    'Available',
                    'https://st.depositphotos.com/1003814/5052/i/450/depositphotos_50523105-stock-photo-pizza-with-tomatoes.jpg',
                    14,
                  ),
                  _buildMenuItem(
                    'Pizza Medium Fish',
                    'Available',
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSApr3p-OdEY7TqNUph5vJHok6v0DqqA5Oy-g&s',
                    11,
                  ),
                  _buildMenuItem(
                    'Pizza Large Chicken',
                    'Available',
                    'https://www.riodejaneiro.com/media/uploads/riodejaneiro.com/2017/03/pizza.jpg',
                    15,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.orange[400],
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back_ios),
            label: 'Back',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.circle),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.square),
            label: 'Order',
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String title, String availability, String imageUrl, double price) {
    return Card(
      child: ListTile(
        leading: Image.network(
          imageUrl,
          width: 50,
          height: 50,
          errorBuilder: (context, error, stackTrace) {
            return Icon(Icons.error);
          },
        ),
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(availability),
            Row(
              children: List.generate(6, (index) {
                return Icon(
                  Icons.star,
                  color: Colors.green[700],
                  size: 16,
                );
              }),
            ),
          ],
        ),
        trailing: Text('\$$price'),
      ),
    );
  }
}

