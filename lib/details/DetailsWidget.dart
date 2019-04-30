import 'package:flutter/material.dart';
import 'package:github_search/models/SearchItem.dart';

class DetailsWidget extends StatefulWidget {
  final SearchItem item;

  const DetailsWidget({Key key, this.item}) : super(key: key);

  @override
  _DetailsWidgetState createState() => _DetailsWidgetState();
}

class _DetailsWidgetState extends State<DetailsWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 20,
              ),
              Hero(
                tag: widget.item.url,
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(widget.item?.avatarUrl ??
                      "https://d2v9y0dukr6mq2.cloudfront.net/video/thumbnail/VCHXZQKsxil3lhgr4/animation-loading-circle-icon-on-white-background-with-alpha-channel-4k-video_sjujffkcde_thumbnail-full01.png"),
                ),
              ),
              Container(
                height: 10,
              ),
              Text(
                widget.item.fullName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.grey[700],
                ),
              ),

              Container(
                height: 10,
              ),

              Text(
                widget.item.url,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}