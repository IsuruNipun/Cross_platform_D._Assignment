import 'package:cinemania_fan_app/constants.dart';
import 'package:cinemania_fan_app/models/cast.dart';
import 'package:flutter/material.dart';

class CastSlider extends StatelessWidget {
  final List<Cast> castList;

  const CastSlider({Key? key, required this.castList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120, // Adjust the size as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: castList.length,
        itemBuilder: (context, index) {
          Cast castMember = castList[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                // Optionally, navigate to a detailed actor screen
              },
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage('${Constants.imagePath}${castMember.profilePath}'),
                    radius: 40, // Adjust the size as needed
                  ),
                  Text(castMember.name),
                  Text(castMember.character),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
