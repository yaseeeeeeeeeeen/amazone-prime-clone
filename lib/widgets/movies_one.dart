import 'package:flutter/material.dart';

class MoviesOne extends StatefulWidget {
  MoviesOne({super.key, required this.datas});
  List datas = [];
  @override
  State<MoviesOne> createState() => _MoviesOneState();
}

class _MoviesOneState extends State<MoviesOne> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, index) {
        return SizedBox(width: 10);
      },
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: widget.datas.length,
      itemBuilder: (context, index) {
        final movie = widget.datas[index];
        String imagePath =
            'https://image.tmdb.org/t/p/w500/${movie.posterPath}';
        return SizedBox(
          height: 80,
          child: ListTile(
            leading: Image(image: NetworkImage(imagePath)),
            title: Text(movie.name, maxLines: 1),
          ),
        );

        //  Container(
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(10),
        //     image: DecorationImage(
        //         image: NetworkImage(
        //            imagePath),
        //         fit: BoxFit.cover),
        //   ),
        //   width: width / 1.5,
        // );
      },
    );
  }
}
