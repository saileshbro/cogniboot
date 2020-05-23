import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter/material.dart';
import 'package:state_management_intro/demobloc/models/articles_response_model.dart';

class ArticleBox extends StatefulWidget {
  final Article article;

  const ArticleBox({Key key, @required this.article}) : super(key: key);

  @override
  _ArticleBoxState createState() => _ArticleBoxState();
}

class _ArticleBoxState extends State<ArticleBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.37),
            blurRadius: 4,
          )
        ],
      ),
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.article.title.trim(),
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.article.description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                      maxLines: 7,
                    )
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                flex: 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    height: 100,
                    child: CachedNetworkImage(
                      imageUrl: widget.article.imageUrl,
                      fit: BoxFit.fitWidth,
                      placeholder: (BuildContext context, String s) =>
                          Image.network(
                              "http://cognifeed.herokuapp.com/public/images/imagenotfound.png"),
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    FontAwesome.globe,
                    size: 12,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.article.website,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    widget.article.viewCount.toString(),
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "views",
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
