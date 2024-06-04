import 'package:camera_app/Pages/servicepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../camera_page.dart';


void main() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
    SystemUiOverlay.bottom
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.bottom
    ]);
    return const MaterialApp(
      home: WeatherPage(),
    );
  }
}

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 400,
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.3),
                      BlendMode.darken,
                    ),
                    child: Image.asset(
                      'images/splash.png',
                      // Add your background image asset here
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dharan',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Monday, Jan 16',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Icon(
                            Icons.wb_sunny,
                            color: Colors.white,
                            size: 24,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Sunny and Warm',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        '35°',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 48,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // const SizedBox(height: 16),
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFFF0F0F0),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5.0),
                  topRight: Radius.circular(5.0),
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'Soil Today',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                        color: Color(0xFF819347),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SoilInfoCard(
                            info: 'Wind',
                            value: '5-8km/h',
                            backgroundColor: Colors.white),
                        SoilInfoCard(
                            info: 'Wind',
                            value: '5-8km/h',
                            backgroundColor: Colors.white),
                        SoilInfoCard(
                            info: 'Wind',
                            value: '5-8km/h',
                            backgroundColor: Colors.white),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'Season harvests',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                        color: Color(0xFF819347),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        HarvestInfoCard(
                            name: 'Maize',
                            days: '19 days since harvest',
                            color: Colors.green),
                        HarvestInfoCard(
                            name: 'Paddy',
                            days: '19 days since harvest',
                            color: Colors.red),
                        HarvestInfoCard(
                            name: 'Raddish',
                            days: '19 days since harvest',
                            color: Colors.green),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const WeatherPage()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ServicesPage()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CameraPage()),
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

class SoilInfoCard extends StatelessWidget {
  final String info;
  final String value;
  final Color backgroundColor;

  const SoilInfoCard({
    Key? key,
    required this.info,
    required this.value,
    this.backgroundColor = Colors.white, // Default background color is white
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7, // Adding elevation to create shadow
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(2.0), // Adjust the curve of edges here
      ),
      color: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(12.0), // Adjust padding as needed
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              info,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xFF819347)),
            ),
            const SizedBox(height: 4), // Add spacing between text and value
            Text(value, style: const TextStyle(color: Color(0xFF819347))),
          ],
        ),
      ),
    );
  }
}

class HarvestInfoCard extends StatelessWidget {
  final String name;
  final String days;
  final Color color;

  const HarvestInfoCard(
      {super.key, required this.name, required this.days, required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
        color: Colors.white,
        child: Row(
          children: [
            const SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/crop.png',
                  height: 30,
                  width: 20,
                )
              ],
            ),
            const SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          color: Color(0xFF819347),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      days,
                      style: const TextStyle(
                          color: Color(0xFF819347), fontSize: 10),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              width: 50,
            ),
            Expanded(
              child: Container(
                width: 10,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(5),
                      bottomRight: Radius.circular(5)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: Colors.white,
//       child: ListTile(
//         leading: Image.asset('images/crop.png', height: 49, width: 35),
//         title: Text(name, style: const TextStyle(color: Color(0xFF819347))),
//         subtitle: Text(days, style: const TextStyle(color: Color(0xFF819347))),
//         trailing: Container(
//           width: 70,
//           height: 70,
//           color: color,
//         ),
//       ),
//     );
//   }
// }
