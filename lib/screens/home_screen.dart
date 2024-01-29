import 'package:amazon_prime/services/movies.dart';
import 'package:amazon_prime/services/movies_picture.dart';
import 'package:amazon_prime/widgets/movies_two.dart';
import 'package:amazon_prime/widgets/title_text.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  List<Movies> trendingMovies = [];
  List<Movies> upcoming = [];
  List<Movies> topRated = [];
  List<Movies> watchlist = [];
  bool loaded = false;
  loadmovies() async {
    final toprated = await MoviesList.dataFetch(
        apiUrl:
            'https://api.themoviedb.org/3/movie/top_rated?api_key=f2b8b3296ac3f32e7e489cf9e9b4cac0');
    final trendingMV = await MoviesList.dataFetch(
        apiUrl:
            'https://api.themoviedb.org/3/tv/top_rated?api_key=f2b8b3296ac3f32e7e489cf9e9b4cac0');
    final upComing = await MoviesList.dataFetch(
        apiUrl:
            'https://api.themoviedb.org/3/movie/upcoming?api_key=f2b8b3296ac3f32e7e489cf9e9b4cac0');
    final watchList = await MoviesList.dataFetch(
        apiUrl:
            'https://api.themoviedb.org/3/movie/now_playing?api_key=f2b8b3296ac3f32e7e489cf9e9b4cac0');
    setState(() {
      upcoming = upComing;
      topRated = toprated;
      trendingMovies = trendingMV;
      watchlist = watchList;
      loaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;

    return SafeArea(
      child: Scaffold(
          body: loaded
              ? ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          TitleText(text: 'Recently added movies', ctne: true),
                          SizedBox(
                              height: height / 4,
                              child: MoviesTwo(datas: trendingMovies)),
                          TitleText(text: 'Now Playing', ctne: false),
                          SizedBox(
                              height: height / 4,
                              child: MoviesTwo(datas: watchlist)),
                          TitleText(text: 'Top Rated Movies', ctne: true),
                          SizedBox(
                              height: height / 4,
                              child: MoviesTwo(datas: topRated)),
                          TitleText(text: 'Trending Movies', ctne: true),
                          SizedBox(
                              height: height / 4,
                              child: MoviesTwo(datas: trendingMovies)),
                          TitleText(text: 'Upcoming Movies', ctne: true),
                          SizedBox(
                              height: height / 4,
                              child: MoviesTwo(datas: upcoming)),
                        ],
                      ),
                    ),
                  ],
                )
              : Center(child: CircularProgressIndicator())),
    );
  }
}
