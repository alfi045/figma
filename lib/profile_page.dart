import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? selectedSize;

  final List<String> sizes = ['XS', 'S', 'M', 'L', 'XL', 'XXL'];

  // Стандартные параметры по размеру
  final Map<String, Map<String, String>> sizeStandards = {
    'XS': {
      'Height': '150-160 cm',
      'Weight': '40-50 kg',
      'Age': '16-22 years',
    },
    'S': {
      'Height': '160-170 cm',
      'Weight': '50-60 kg',
      'Age': '18-25 years',
    },
    'M': {
      'Height': '170-180 cm',
      'Weight': '60-70 kg',
      'Age': '20-30 years',
    },
    'L': {
      'Height': '180-190 cm',
      'Weight': '70-80 kg',
      'Age': '25-35 years',
    },
    'XL': {
      'Height': '190-200 cm',
      'Weight': '80-90 kg',
      'Age': '30-40 years',
    },
    'XXL': {
      'Height': '200+ cm',
      'Weight': '90+ kg',
      'Age': '35+ years',
    },
  };

  String getSizeAdvice(String size) {
    switch (size) {
      case 'XS':
        return "Recommended for petite builds. Fits very slim body types.";
      case 'S':
        return "Suitable for small frames. Comfortable and snug.";
      case 'M':
        return "Medium size fits most body types comfortably.";
      case 'L':
        return "Great for a loose fit. Ideal if you prefer more space.";
      case 'XL':
        return "For larger builds or if you like oversized styles.";
      case 'XXL':
        return "Extra room for maximum comfort and layering.";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedStandards = selectedSize != null ? sizeStandards[selectedSize!] : null;

    return Scaffold(
      appBar: AppBar(
        title: Text("JIHC BRAND"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/IMG_1620.JPG'), // Своя фотография
              ),
              SizedBox(height: 16),
              Text("Your Size", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text("Catalog"),
              SizedBox(height: 24),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Size",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 12),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: sizes.map((size) {
                  final isSelected = size == selectedSize;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedSize = size;
                      });
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.black : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: isSelected ? Colors.black : Colors.grey,
                          width: 2,
                        ),
                      ),
                      child: Text(
                        size,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 24),
              if (selectedSize != null) ...[
                Text(
                  "Selected Size: $selectedSize",
                  style: TextStyle(fontSize: 16, color: Colors.blueGrey),
                ),
                SizedBox(height: 12),
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.blue.shade200),
                  ),
                  child: Text(
                    getSizeAdvice(selectedSize!),
                    style: TextStyle(fontSize: 14, color: Colors.blue.shade900),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 24),

                // Отображение стандартов для выбранного размера
                if (selectedStandards != null) ...[
                  Text(
                    "Standard Measurements:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildMeasurementInfo("Height", selectedStandards['Height']!),
                      _buildMeasurementInfo("Weight", selectedStandards['Weight']!),
                      _buildMeasurementInfo("Age", selectedStandards['Age']!),
                    ],
                  ),
                ],
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMeasurementInfo(String title, String value) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        SizedBox(height: 6),
        Text(
          value,
          style: TextStyle(color: Colors.blueGrey),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
