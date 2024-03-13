// import 'package:cinemania_fan_app/colors.dart';
// import 'package:cinemania_fan_app/constants.dart';
// import 'package:cinemania_fan_app/models/movie.dart';
// import 'package:cinemania_fan_app/widgets/back_button.dart';
 
// //import 'package:cinemania_fan_app/widgets/pop_up_card.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:google_fonts/google_fonts.dart';


import 'package:cinemania_fan_app/api/api.dart';
import 'package:cinemania_fan_app/models/cast.dart';
import 'package:cinemania_fan_app/widgets/add_button.dart';
import 'package:cinemania_fan_app/widgets/cast_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cinemania_fan_app/colors.dart';
import 'package:cinemania_fan_app/constants.dart';
import 'package:cinemania_fan_app/models/movie.dart';
import 'package:cinemania_fan_app/widgets/back_button.dart';
// Make sure to import the AddButtonWidget file correctly


class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Media movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar.large(
                leading: const BackBtn(),
                backgroundColor: Colours.scaffoldBgColor,
                expandedHeight: 500,
                pinned: true,
                floating: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    movie.title,
                    style: GoogleFonts.belleza(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  background: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    ),
                    child: Image.network(
                      '${Constants.imagePath}${movie.backDropPath}',
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text
                      (
                        'OverView',
                        style: GoogleFonts.openSans
                          (
                            fontSize: 30,
                            fontWeight: FontWeight.w800
                          ),
                      ),
                const SizedBox(height: 16),
                Text(movie.overView,
                style: GoogleFonts.roboto
                    (
                      fontSize: 25,
                      fontWeight: FontWeight.w400
                    ),
                    //textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 16),
                    SizedBox
                    (
                      child: Row
                      (mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: 
                        [
                          Container
                          (
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration
                            (
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row
                            (children: 
                              [
                              Text('Release date: ',
                              style: GoogleFonts.roboto
                                (
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ), 
                              ),
                              Text(movie.releaseDate,
                              style: GoogleFonts.roboto
                                (
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold
                                ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration
                            (
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Text('Rating',
                                 style: GoogleFonts.roboto
                                (
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold
                                ),
                                ),
                                const Icon(Icons.star,
                                color: Colors.amber,
                                ),
                                Text('${movie.voteAverage.toStringAsFixed
                                (1)}/10'),
                              ],
                            ),
                          ),
                          
                        ],
                      ),
                    )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            right: 7,
            bottom: 32.5,
            child: AddButtonWidget(), // Using the AddButtonWidget
          ),
        ],
      ),
    );
  }
}



