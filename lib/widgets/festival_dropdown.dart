import 'package:flutter/material.dart';
import '../models/festival.dart';

class FestivalDropdown extends StatelessWidget {
  final Festival currentFestival;
  final List<Festival> festivals;
  final Function(Festival) onChanged;

  const FestivalDropdown({
    super.key,
    required this.currentFestival,
    required this.festivals,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton<Festival>(
        value: currentFestival,
        icon: Icon(Icons.arrow_drop_down, color: Colors.white),
        elevation: 16,
        dropdownColor: Color(0xFF794097),
        underline: Container(),
        style: TextStyle(
          fontFamily: "PyeongChangPeace-Bold",
          fontSize: 12,
          color: Colors.white,
        ),
        onChanged: (Festival? newValue) => onChanged(newValue!),
        items: festivals.map<DropdownMenuItem<Festival>>((Festival festival) {
          return DropdownMenuItem<Festival>(
            value: festival,
            child: SizedBox(
              width: 170,
              child: Text(
                festival.name,
                style: TextStyle(
                  fontFamily: "PyeongChangPeace-Bold",
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}