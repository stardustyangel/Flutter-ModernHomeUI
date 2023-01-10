import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarthome/SmartDeviceBox.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String day = DateFormat("EEE").format(DateTime.now());
  String dateNmonth = DateFormat("MMMM dd ").format(DateTime.now());
  final double hp = 40; // Horizental padding
  final double vp = 25; // Vertical padding
  List SmartDevices = [
    ['Smart light ', 'assets/Light-bulb.png', false],
    ['Smart TV ', 'assets/Smart-TV.png', false],
    ['Smart AC ', 'assets/Air-conditionner.png', false],
    ['Smart Fan ', 'assets/Fan.png', false]
  ];
  void OnChangedSwitch(int index, bool value) {
    setState(() {
      SmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //TODO - Custom appbar :
            Padding(
              padding: EdgeInsets.symmetric(horizontal: hp, vertical: vp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //menu icon :
                  Image.asset(
                    'assets/Menu.png',
                    height: 27,
                    color: Colors.black87,
                  ),
                  Icon(
                    Icons.person,
                    color: Colors.black87,
                    size: 38,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //TODO - Welcom Home NAME :
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: hp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Welcome Home '),
                      Text(
                        'TAISSIR',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 45,
                            fontFamily: GoogleFonts.anton().fontFamily),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: hp) ,
                    child: Container(
                      width: 80,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(12)
                
                      ),
                
                      child: Column(
                        
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            day,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontFamily: GoogleFonts.anton().fontFamily),
                          ),
                          Text(dateNmonth,style: TextStyle(color: Colors.white,fontSize: 10,fontFamily: GoogleFonts.poppins().fontFamily),),

                        ],
                        
                      ),
                      
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),

            // TODO - Smart Device :
            Padding(
              padding: EdgeInsets.symmetric(horizontal: hp),
              child: Text(
                'Smart Devices',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1 / 1.3),
                padding: EdgeInsets.all(20),
                itemCount: SmartDevices.length,
                itemBuilder: (BuildContext context, int index) {
                  return SmartDeviceBox(
                    deviceName: SmartDevices[index][0],
                    devicePath: SmartDevices[index][1],
                    deviceStatus: SmartDevices[index][2],
                    onChanged: (value) {
                      OnChangedSwitch(index, value);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
