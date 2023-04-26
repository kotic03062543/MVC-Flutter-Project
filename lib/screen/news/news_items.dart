import 'package:flutter/material.dart';
import 'package:newsapp/model/news_model/news.dart';
import '../news_detail/news_detail.dart';

class NewsItem extends StatefulWidget {
  final Newslist? newslist;
  final int index;

  NewsItem({super.key, required this.newslist, required this.index});

  @override
  State<NewsItem> createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  @override
  Widget build(BuildContext context) {
    int paddingbetween = 10;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetail(
              urlimag: widget.newslist!.articles![widget.index].urlToImage,
              title: widget.newslist!.articles![widget.index].title,
              description: widget.newslist!.articles![widget.index].description,
              author: widget.newslist!.articles![widget.index].author,
              publishedAt: widget.newslist!.articles![widget.index].publishedAt,
            ),
          ),
        );
      },
      child: Container(
        child: SizedBox(
          width: MediaQuery.of(context).size.width - paddingbetween,
          height: 150,
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            // clipBehavior: Clip.hardEdge,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      margin: EdgeInsets.only(right: 10),
                      child:
                          widget.newslist!.articles![widget.index].urlToImage !=
                                  null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: Image.network(
                                    '${widget.newslist!.articles![widget.index].urlToImage}',
                                    width: 130,
                                    height: 120,
                                    fit: BoxFit.cover,
                                    errorBuilder: (BuildContext context,
                                        Object exception,
                                        StackTrace? stackTrace) {
                                      return Image.network(
                                        'https://images.unsplash.com/photo-1674574124349-0928f4b2bce3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80',
                                        width: 130,
                                        height: 120,
                                        fit: BoxFit.cover,
                                      );
                                    },
                                  ),
                                )
                              : Image.network(
                                  'https://images.unsplash.com/photo-1674574124349-0928f4b2bce3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80',
                                  width: 130,
                                  height: 110,
                                  fit: BoxFit.cover,
                                ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 100,
                            child: Text(
                              '${widget.newslist!.articles![widget.index].description}',
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.person,
                                    size: 14,
                                  ),
                                  widget.newslist!.articles![widget.index]
                                                  .author !=
                                              null &&
                                          widget
                                                  .newslist!
                                                  .articles![widget.index]
                                                  .author!
                                                  .length >
                                              7
                                      ? Text(
                                          '${widget.newslist!.articles![widget.index].author!.substring(0, 7)}...',
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        )
                                      : Text(
                                          widget
                                                  .newslist!
                                                  .articles![widget.index]
                                                  .author ??
                                              '',
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                ],
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.alarm,
                                      size: 14,
                                    ),
                                    Text(
                                      '${widget.newslist!.articles![widget.index].publishedAt!.substring(0, 10)}',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
