import 'dart:async';

import 'package:amazon_prime/services/movies.dart';
import 'package:amazon_prime/services/movies_picture.dart';
import 'package:amazon_prime/widgets/movies_one.dart';
import 'package:amazon_prime/widgets/movies_two.dart';

import 'package:flutter/material.dart';

class ScreenSearchPage extends StatefulWidget {
  const ScreenSearchPage({super.key});

  @override
  State<ScreenSearchPage> createState() => _ScreenSearchPageState();
}

String? values;
List<Movies> movies = [];

class _ScreenSearchPageState extends State<ScreenSearchPage> {
  Timer? _debounce;

  void debouncedSearch(String value) {
    _debounce?.cancel();

    _debounce = Timer(Duration(milliseconds: 500), () async {
      final datass = await MoviesList.search(value);
      setState(() {
        movies = datass;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
            )),
        actions: const [
          Icon(Icons.cast, size: 25),
          SizedBox(width: 10),
          CircleAvatar(
            radius: 16,
            backgroundColor: Colors.blue,
            child: Icon(Icons.person, color: Colors.white),
          ),
          SizedBox(width: 10),
        ],
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: [
                    SizedBox(
                      height: 46,
                      width: 370,
                      child: TextField(
                          style: TextStyle(color: Colors.black),
                          onTap: () {
                            setState(() {});
                          },
                          onChanged: (value) {
                            setState(() {
                              values = value;
                              debouncedSearch(value);
                            });
                          },
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon:
                                  Icon(Icons.search, color: Colors.black),
                              hintText: 'Search Movies in Here...',
                              hintStyle: TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 5)))),
                    ),
                    SizedBox(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Results',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 70,
                            height: 30,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 79, 77, 77),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              'Filter',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              // Expanded(
              //     child: SizedBox(
              //         height: MediaQuery.sizeOf(context).height / 5,
              //         child: MoviesOne(datas: movies))),
              Expanded(
                  // height: MediaQuery.sizeOf(context).height,
                  child: MoviesOne(datas: movies))
            ],
          ),
        ),
      ),
    );
  }
}
