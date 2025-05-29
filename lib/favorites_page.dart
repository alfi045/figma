import 'package:flutter/material.dart';

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  String selectedCategory = 'clothes';

  final Map<String, List<String>> categoryImages = {
    'clothes': [
      'assets/images/clothes.JPG',
      'assets/images/clothes4.JPG',
      'assets/images/hoodie.jpg',
      
      'assets/images/IMG_1620.JPG',
      
    ],
    'blocnot': [
      'assets/images/book.JPG',
      'assets/images/IMG_1877.JPG',
      'assets/images/IMG_1893.JPG',
      'assets/images/IMG_1784.JPG',
     
    ],
    'bag': [
      'assets/images/bag.jpg',
      'assets/images/IMAGE 2025-05-29 12:09:57.jpg',
      'assets/images/IMAGE 2025-05-29 12:11:00.jpg',
      'assets/images/bag.jpg',
     
    ],
    'bracelet': [
      'assets/images/kkkkkkk.JPG',
      'assets/images/IMAGE 2025-05-29 12:13:02.jpg',
      'assets/images/IMG_1749.JPG',
      'assets/images/IMG_1746.JPG',
      
    ],
  };

  @override
  Widget build(BuildContext context) {
    final images = categoryImages[selectedCategory]!;

    return Scaffold(
      appBar: AppBar(
        title: Text("Best Sellers"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: DropdownButton<String>(
              value: selectedCategory,
              isExpanded: true,
              items: categoryImages.keys.map((category) {
                return DropdownMenuItem(
                  value: category,
                  child: Text(category.toUpperCase()),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() => selectedCategory = value);
                }
              },
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: images.length,
              padding: EdgeInsets.all(12),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
              ),
              itemBuilder: (_, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    images[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}