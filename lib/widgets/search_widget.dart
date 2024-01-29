import 'package:amazon_prime/services/movies.dart';
import 'package:amazon_prime/widgets/movies_two.dart';
import 'package:flutter/material.dart';

class SearchFuture extends StatefulWidget {
  SearchFuture({super.key, this.value});
  String? value;

  @override
  State<SearchFuture> createState() => _SearchFutureState();
}

class _SearchFutureState extends State<SearchFuture> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: MoviesList.search(widget.value),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.data == null || snapshot.data!.isEmpty) {
              return Center(child: Text("search Some movies"));
            }
            final moviess = snapshot.data;
            return MoviesTwo(datas: moviess!);
          }
        });
  }
}
