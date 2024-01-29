import 'package:amazon_prime/screens/serach_main.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List genres = [
    'Action',
    'Horror',
    'Romance',
    'Documentary',
    'Drama',
    'Thriller',
    'Comedy',
    'Western'
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return ScreenSearchPage();
                },
              ));
            },
            child: TextField(
              enabled: false,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(Icons.search, color: Colors.black),
                  hintText: 'Search Movies in Here...',
                  hintStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(borderSide: BorderSide(width: 5))),
            ),
          ),
          Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Genres',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              )),
          SizedBox(height: 10),
          SizedBox(
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: 8,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 2.5),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black38,
                  ),
                  margin: EdgeInsets.all(5),
                  child: Center(
                    child: Text(
                      genres[index],
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
