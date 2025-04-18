import 'package:flutter/material.dart';

class CardButton extends StatelessWidget {
  final String txt;
  const CardButton({super.key, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Card(
      key: UniqueKey(),
      shadowColor: Colors.blue,
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50)
      ),
      child: Container(
        height: 50,
        width: 236,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  txt,
                  style: Theme.of(context).textTheme.labelLarge ?? const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}