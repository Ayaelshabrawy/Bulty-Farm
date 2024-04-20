import 'package:flutter/material.dart';
import 'package:bulty_farmm/Owner/Sensors/SensorCard.dart';
import 'package:bulty_farmm/ProfileSettings/profileScreen.dart';
import 'package:animate_do/animate_do.dart';

class SensorData {
  final String title;
  final String value;
  final IconData icon;
  final String fontFamily;

  SensorData({
    required this.title,
    required this.value,
    required this.icon,
    required this.fontFamily,
  });
}

Future<void> _refreshData() async {
  // Add your data fetching logic here
  // For example:
  // setState(() {
  //   // Update your sensor data
  // });
}

class HomePage extends StatefulWidget {
  static String routeName = "/home";

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<SensorData> sensorData = [
    SensorData(title: 'Temperature', value: '25°C', fontFamily: 'TT Firs Neue', icon: Icons.thermostat),
    SensorData(title: 'PH Level', value: '7.0', fontFamily: 'TT Firs Neue', icon: Icons.waves),
    SensorData(title: 'Fish Diseases', value: 'Healthy', fontFamily: 'TT Firs Neue', icon: Icons.healing),
    SensorData(title: 'Water Level', value: 'Normal', fontFamily: 'TT Firs Neue', icon: Icons.opacity),
    SensorData(title: 'Biomass', value: '1000 kg', fontFamily: 'TT Firs Neue', icon: Icons.group),
  ];

  final double _spacing = 10.0;
  final int _crossAxisCount = 2;

  double _getItemWidth(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = (screenWidth - ((_crossAxisCount - 1) * _spacing)) / _crossAxisCount;
    return itemWidth;
  }

  void _addSensorDialog(BuildContext context) {
    // Dialog implementation goes here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/images/img_10.png',
              height: 45,
              color: Colors.grey[800],
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addSensorDialog(context);
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refreshData,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Sensor Data',
                    style: TextStyle(fontSize: 24.0, fontFamily: 'TT Firs Neue'),
                  ),
                  const SizedBox(height: 20.0),
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      mainAxisSpacing: _spacing,
                      crossAxisSpacing: _spacing,
                      childAspectRatio: (_getItemWidth(context) / (_getItemWidth(context) + 60)),
                    ),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: sensorData.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // Handle tap on sensor card
                        },
                        child: FadeInUp(
                          duration: const Duration(milliseconds: 500),
                          child: SensorCard(
                            title: sensorData[index].title,
                            value: sensorData[index].value,
                            icon: sensorData[index].icon,
                            fontFamily: sensorData[index].fontFamily,
                            sensorData: sensorData,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
