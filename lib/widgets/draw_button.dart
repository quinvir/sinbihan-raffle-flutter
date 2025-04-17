import 'package:flutter/material.dart';

class DrawButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onTap;

  const DrawButton({
    super.key,
    required this.isLoading,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isLoading ? null : onTap,
        child: Container(
          alignment: Alignment.center,
          width: 192,
          height: 76,
          decoration: BoxDecoration(
            color: isLoading ? Colors.grey : Colors.black,
            borderRadius: BorderRadius.circular(10),
          ),
          child: isLoading
              ? SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 3,
                  ),
                )
              : Text(
                  "추첨 시작",
                  style: TextStyle(
                    fontFamily: "PyeongChangPeace-Bold",
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
        ),
      ),
    );
  }
} 