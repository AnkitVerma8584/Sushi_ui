import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_ui/pages/details/detail_screen.dart';
import '../models/sushi_fav.dart';
import 'package:like_button/like_button.dart';

class CategoryCard extends StatefulWidget {
  const CategoryCard({super.key, required this.sushi});
  final Sushi sushi;

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailsScreen(sushi: widget.sushi))),
      child: Card(
        child: Container(
          height: 200,
          width: 200,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(children: [
                Hero(
                  tag: widget.sushi.id.toString(),
                  child: Image.asset(
                    widget.sushi.itemImage,
                    height: 100,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: LikeButton(
                    isLiked: isLiked,
                    likeBuilder: (bool isLiked) {
                      return Icon(
                        isLiked
                            ? CupertinoIcons.heart_fill
                            : CupertinoIcons.heart,
                        color: isLiked ? Colors.red : Colors.grey,
                      );
                    },
                    onTap: (like) async {
                      isLiked = !like;
                      return isLiked;
                    },
                  ),
                )
              ]),
              Text(
                widget.sushi.itemName,
                style: GoogleFonts.dmSerifDisplay(fontSize: 20),
              ),
              Row(
                children: [
                  const Icon(Icons.currency_rupee_outlined, size: 18),
                  Text(
                    widget.sushi.price.toString(),
                    style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Icon(Icons.star, color: Colors.yellow[700], size: 18),
                  Text(widget.sushi.rating.toString())
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
