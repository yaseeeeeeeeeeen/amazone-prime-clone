import 'dart:math';

import 'package:amazon_prime/services/movies_picture.dart';
import 'package:flutter/material.dart';

class MoviesTwo extends StatefulWidget {
  MoviesTwo({super.key, required this.datas});
  List<Movies> datas = [];
  @override
  State<MoviesTwo> createState() => _MoviesTwoState();
}

class _MoviesTwoState extends State<MoviesTwo> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, index) {
        return SizedBox(width: 10);
      },
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: widget.datas.length,
      itemBuilder: (context, index) {
        final movie = widget.datas[index];
        String imagePath =
            'https://image.tmdb.org/t/p/w500/${movie.posterPath}';
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage(imagePath), fit: BoxFit.cover)),
          width: width / 2.7,
        );
      },
    );
  }
}
