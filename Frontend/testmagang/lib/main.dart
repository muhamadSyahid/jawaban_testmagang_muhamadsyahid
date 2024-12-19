import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cartridge Kings',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CartridgeKingsHomePage(),
    );
  }
}

class CartridgeKingsHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('CARTRIDGE KINGS'),
            Row(
              children: [
                Icon(Icons.search),
                SizedBox(width: 16),
                Icon(Icons.shopping_cart),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header Section
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.blueAccent,
              child: Column(
                children: [
                  Text(
                    'FIND THE RIGHT CARTRIDGES FOR YOUR PRINTER',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.05, // Adjust font size based on screen width
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02), // Responsive vertical spacing
                  isLandscape
                      ? Row(
                          children: [
                            Expanded(child: _buildDropdown('Printer Brand')),
                            SizedBox(width: screenWidth * 0.02),
                            Expanded(child: _buildDropdown('Printer Series')),
                            SizedBox(width: screenWidth * 0.02),
                            Expanded(child: _buildDropdown('Printer Model')),
                          ],
                        )
                      : Column(
                          children: [
                            _buildDropdown('Printer Brand'),
                            SizedBox(height: screenHeight * 0.02),
                            _buildDropdown('Printer Series'),
                            SizedBox(height: screenHeight * 0.02),
                            _buildDropdown('Printer Model'),
                          ],
                        ),
                  SizedBox(height: screenHeight * 0.02),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('FIND CARTRIDGES'),
                  ),
                ],
              ),
            ),
            // Featured Products
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'FEATURED PRODUCTS',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: screenHeight * 0.4, // Adjust carousel height based on screen height
                autoPlay: false,
                enlargeCenterPage: true,
                aspectRatio: screenWidth / screenHeight, // Responsive aspect ratio
                enableInfiniteScroll: true,
              ),
              items: List.generate(3, (index) {
                return Builder(
                  builder: (BuildContext context) {
                    return Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Image.network(
                              'https://via.placeholder.com/150',
                              fit: BoxFit.cover,
                              width: double.infinity, // Make image stretch to container width
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'HP 62 Black Ink Cartridge',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: screenWidth * 0.04,
                                  ),
                                ),
                                Text(
                                  '\$9.49',
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.035,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('ADD TO CART'),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown(String label) {
    return DropdownButtonFormField<String>(
      items: ['Option 1', 'Option 2']
          .map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (value) {},
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(),
      ),
    );
  }
}
