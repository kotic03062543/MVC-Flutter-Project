import 'package:flutter/material.dart';
import 'package:newsapp/model/news.dart';
import 'package:newsapp/screen/share_widget/news_items.dart';

import '../service/news_service.dart';

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
        title: Text('News Home'),
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
              return ListView.builder(
                itemCount: newslist!.articles!.length,
                itemBuilder: (context, index) {
                  return NewsItem(newslist: newslist, index: index);
                },
              );
            }
          },
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:newsapp/model/news.dart';

// import '../service/news_service.dart';

// class NewsHome extends StatefulWidget {
//   const NewsHome({super.key});

//   @override
//   State<NewsHome> createState() => _NewsHomeState();
// }

// class _NewsHomeState extends State<NewsHome> {
//   final newsserive = NewsSerive();

//   Future<Newslist>? futurenewslist;
//   Newslist? newslist1;

//   void callApi() {
//     futurenewslist = newsserive.getNews();
//     //ดึงข้อมูลจาก API มาแสดง
//     futurenewslist!.then((value) {
//       setState(() {
//         newslist1 = value;
//       });
//     });
//   }

//   void initState() {
//     super.initState();
//     callApi();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('News Home'),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(10),
//         child: Card(
//           elevation: 3,
//           //ดึงข้อมูลจาก API มาแสดง
//           child: newslist1 == null
//               ? Center(
//                   child: CircularProgressIndicator(),
//                 )
//               : ListView.builder(
//                   itemCount: newslist1!.articles!.length,
//                   itemBuilder: (context, index) {
//                     return Container(
//                       padding: const EdgeInsets.symmetric(vertical: 5),
//                       margin: const EdgeInsets.symmetric(
//                           vertical: 5, horizontal: 5),
//                       decoration: const BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(6)),
//                         color: Color(0xFFffffff),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Color.fromARGB(255, 214, 213, 213),
//                             blurRadius: 1.0, // soften the shadow
//                             spreadRadius: 1.0, //extend the shadow
//                             offset: Offset(
//                               1.0, // Move to right 5  horizontally
//                               1.0, // Move to bottom 5 Vertically
//                             ),
//                           ),
//                         ],
//                       ),
//                       child: ListTile(
//                         leading: Container(
//                           width: 80,
//                           height: 80,
//                           child: FadeInImage.assetNetwork(
//                             placeholder: 'assets/images/loading.jpg',
//                             image: '${newslist1!.articles![index].urlToImage}',
//                             fit: BoxFit.cover,
//                           )
//                         ),
//                         title: Container(
//                           margin: EdgeInsets.only(bottom: 15),
//                           child: Text(
//                             '${newslist1!.articles![index].title}',
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                             style: TextStyle(
//                               fontSize: 14,
//                             ),
//                           ),
//                         ),
//                         subtitle: Row(
//                           children: [
//                             Expanded(
//                               child: Row(
//                                 children: [
//                                   Icon(Icons.person, size: 14),
//                                   Text(
//                                     '${newslist1!.articles![index].author!.substring(0, 5)}',
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Spacer(),
//                             Flexible(
//                               child: Row(
//                                 children: [
//                                   Icon(Icons.calendar_today, size: 14),
//                                   Text(
//                                     '${newslist1!.articles![index].publishedAt!.substring(0, 10)}',
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             SizedBox.shrink(),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//         ),
//       ),
//     );
//   }
// }
