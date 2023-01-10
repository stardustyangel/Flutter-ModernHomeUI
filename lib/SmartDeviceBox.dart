import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmartDeviceBox extends StatelessWidget {
  final String? deviceName;
  final String? devicePath;
  final bool? deviceStatus;
  void Function(bool)? onChanged;

  SmartDeviceBox({
    required this.deviceName,
    required this.devicePath,
    required this.deviceStatus,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: deviceStatus! ? Colors.grey[200] : Colors.black87,
          border: Border.all(color:deviceStatus!? Colors.blueAccent : Colors.transparent, width: 3),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                devicePath!,
                height: 50,
                color: deviceStatus! ? Colors.black : Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      deviceName!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: deviceStatus! ? Colors.black : Colors.white,
                      ),
                    )),
                    Transform.rotate(
                        angle: pi / 2,
                        child: CupertinoSwitch(
                          activeColor: Colors.blueAccent,
                            value: deviceStatus!, onChanged: onChanged)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
