import 'package:flutter/material.dart';
import 'package:newsapp/model/news_model/news.dart';
import '../service/news_service/news_service.dart';
import 'share_widget/news_navigate.dart';
import 'news/news_items.dart';

class NewsHome extends StatefulWidget {
  const NewsHome({super.key});

  @override
  State<NewsHome> createState() => _NewsHomeState();
}

class _NewsHomeState extends State<NewsHome> {
  final newsserive = NewsSerive();

  Future<Newslist>? futurenewslist;
  Newslist? newslist;

  void callApi() {
    futurenewslist = newsserive.getNews();
  }

  void initState() {
    super.initState();
    callApi();
  }

  @override
  Widget build(BuildContext context) {
    int paddingbetween = 10;
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    setState(() {
                      value.isNotEmpty
                          ? futurenewslist =
                              newsserive.get(queryParam: {'q': value})
                          : futurenewslist =
                              newsserive.get(queryParam: {'q': 'keyword'});
                    });
                  },
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.grey[300],
                child: IconButton(
                  icon: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          )),
      drawer: Drawer(
        child: NewsNavigate(),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width - paddingbetween,
        child: FutureBuilder(
          future: futurenewslist,
          builder: (context, snapshot) {
            newslist = snapshot.data;
            if (snapshot.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return RefreshIndicator(
                child: ListView.builder(
                  itemCount: newslist!.articles!.length,
                  itemBuilder: (context, index) {
                    return NewsItem(newslist: newslist, index: index);
                  },
                ),
                onRefresh: () {
                  setState(() {
                    callApi();
                  });
                  return Future.value(true);
                },
              );
            }
          },
        ),
      ),
    );
  }
}
