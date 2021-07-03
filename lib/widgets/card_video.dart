import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_app/models/cast_model.dart';
import 'package:google_fonts/google_fonts.dart';

class CardVideo extends StatelessWidget {
  final CastModel item;

  CardVideo({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 10,
      ),
      width: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: item.profilePath.isNotEmpty
                ? CachedNetworkImage(
                    imageUrl: item.profilePath,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    placeholder: (BuildContext context, String url) =>
                        Container(
                      width: 80,
                      height: 80,
                      child: Image.asset(
                        'assets/images/placeholder.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : Image.asset(
                    'assets/images/placeholder.jpg',
                    fit: BoxFit.cover,
                    width: 80,
                    height: 80,
                  ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            item.originalName,
            maxLines: 2,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
