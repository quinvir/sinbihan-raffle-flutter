import 'package:flutter/material.dart';
import 'dart:math';

import 'models/winner.dart';
import 'models/festival.dart';
import 'services/raffle_service.dart';
import 'widgets/number_display.dart';
import 'widgets/draw_button.dart';
import 'widgets/festival_dropdown.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int dong = 0;
  int ho = 0;
  bool isLoading = false;
  List<Festival> festivals = Festival.values;
  Festival currentFestival = Festival.tejeon;
  final RaffleService _raffleService = RaffleService();

  Future<void> drawWinner() async {
    setState(() => isLoading = true);
    
    try {
      final winner = await _raffleService.drawWinner(currentFestival);
      setState(() {
        dong = int.parse(winner.dong);
        ho = int.parse(winner.ho);
      });
    } catch (e) {
      print('Error drawing winner: $e');
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF794097),
        body: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 1600,
              maxHeight: 900,
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/img_bg.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  margin: EdgeInsets.all(60),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        child: Image.asset('assets/images/img_header.png'),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(horizontal: 120),
                              child: Text(
                                currentFestival.name,
                                style: TextStyle(
                                  fontFamily: "PyeongChangPeace-Bold",
                                  fontSize: 60,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(height: 60),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 80),
                              child: Row(
                                children: [
                                  NumberDisplay(value: dong, label: '동'),
                                  SizedBox(width: 10),
                                  NumberDisplay(value: ho, label: '호'),
                                ],
                              ),
                            ),
                            SizedBox(height: 60),
                            DrawButton(
                              isLoading: isLoading,
                              onTap: drawWinner,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  bottom: 0,
                  child: SizedBox(
                    width: 240,
                    height: 210,
                    child: Image.asset(
                      'assets/images/img_avoid.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  top: 4,
                  left: 16,
                  child: FestivalDropdown(
                    currentFestival: currentFestival,
                    festivals: festivals,
                    onChanged: (Festival newValue) {
                      setState(() {
                        currentFestival = newValue;
                        dong = 0;
                        ho = 0;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}