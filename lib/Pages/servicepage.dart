import 'package:camera_app/Pages/weatherpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ServicesPage(),
    );
  }
}

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  'images/servicemaize.png',
                  // Add your background image asset here
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
                Container(
                  width: double.infinity,
                  height: 300,
                  color: Colors.black.withOpacity(0.3),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      const Text(
                        'Services',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // const SizedBox(height: 8),
                      const Text(
                        'Lorem ipsum dolor sit amet,',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                      // const SizedBox(height: 8),
                      const Text(
                        'consectetur adipiscing elit, sed do',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                      // const SizedBox(height: 8),
                      const Text(
                        'eiusmod tempor incididunt.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 41,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: const TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search for services',
                                  border: InputBorder.none,
                                  isDense: true,
                                  // This makes the TextField more compact
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 12.0,
                                      horizontal:
                                          8.0), // Adjust the vertical padding
                                ),
                                style: TextStyle(
                                    height: 1.0), // Ensures text is centered
                              ),
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          // Add space between the text field and icon
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: const Icon(Icons.search, color: Colors.grey),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: const Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Services we offer',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF819347),
                    ),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    height: 120.0, // Adjust the height as needed
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ServiceCard(
                            icon: Icons.camera_alt,
                            label: 'Disease\nDetection',
                          ),
                          SizedBox(width: 20.0), // Adjust spacing between cards
                          ServiceCard(
                            icon: Icons.agriculture,
                            label: 'Crop\nRecommendation',
                          ),
                          SizedBox(width: 10.0),
                          ServiceCard(
                            icon: Icons.science,
                            label: 'Fertilizer\nRecommendation',
                          ),
                          SizedBox(width: 20.0),
                          ServiceCard(
                            icon: Icons.monitor,
                            label: 'Harvest\nMonitoring',
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Previous Logs',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF819347),
                    ),
                  ),
                  SizedBox(height: 16),
                  PreviousLogCard(
                    date: '29th Jan',
                    crop: 'Maize',
                    service: 'Disease Detection',
                  ),
                  PreviousLogCard(
                    date: '28th Jan',
                    crop: 'Paddy',
                    service: 'Fertilizer Recommendation',
                  ),
                  PreviousLogCard(
                    date: '25th Jan',
                    crop: 'Radish',
                    service: 'Crop Recommendation',
                  ),
                  PreviousLogCard(
                    date: '20th Jan',
                    crop: 'Maize',
                    service: 'Disease Detection',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        backgroundColor: const Color(0xFF819347),
        onTap: (int index) {
          if (index == 0) {
            // Check if 'Home' icon is tapped (index 0)
            Navigator.push(
              // Navigate to the desired page
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const WeatherPage()), // Replace HomePage with your desired page
            );
          } else if (index == 1) {
            // Check if 'Home' icon is tapped (index 0)
            Navigator.push(
              // Navigate to the desired page
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const ServicesPage()), // Replace HomePage with your desired page
            );
          }
        },
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/plant.png', height: 23),
            label: 'Services',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.photo_camera_outlined, color: Colors.white),
            label: 'Camera',
          ),
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String label;

  const ServiceCard({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      // Ensures the column takes only the needed space
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: const Color(0xFF819347),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Icon(icon, color: Colors.white, size: 30.0),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
              color: Color(0xFF819347),
              fontSize: 14,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center, // Center-align the text
        ),
      ],
    );
  }
}

class PreviousLogCard extends StatelessWidget {
  final String date;
  final String crop;
  final String service;

  const PreviousLogCard({
    super.key,
    required this.date,
    required this.crop,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 80, // Set a fixed height for all cards
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 1.5),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20) ,bottomLeft: Radius.circular(20)),
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      date,
                      style: const TextStyle(
                        color: Color(0xFF819347),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 2),
        Expanded(
          child: SizedBox(
            height: 80, // Set a fixed height for all cards
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 1.5),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(1)),
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      crop,
                      style: const TextStyle(
                        color: Color(0xFF819347),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 2),
        Expanded(
          child: SizedBox(
            height: 80, // Set a fixed height for all cards
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 1.5),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(1)),
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      service,
                      style: const TextStyle(
                        color: Color(0xFF819347),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 1),
        Expanded(
          child: SizedBox(
            height: 80, // Set a fixed height for all cards
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 1.5),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topRight: Radius.circular(20) ,bottomRight: Radius.circular(20)),
              ),
              color: const Color(0xFF819347),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/arrow.png',color: Colors.white),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.symmetric(vertical: 1.5),
//       child: ListTile(
//         leading: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               date,
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: Color(0xFF819347),
//               ),
//             ),
//           ],
//         ),
//         title: Text(crop,style: const TextStyle(color: Color(0xFF819347))),
//         subtitle: Text(service,style: const TextStyle(color: Color(0xFF819347))),
//         trailing: const Icon(Icons.arrow_forward, color: Color(0xFF819347)),
//       ),
//     );
//   }
// }
