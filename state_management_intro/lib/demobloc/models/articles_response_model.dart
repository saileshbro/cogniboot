class ArticleResponseModel {
  List<Article> articles;

  ArticleResponseModel({this.articles});

  ArticleResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['articles'] != null) {
      articles = <Article>[];
      json['articles'].forEach((v) {
        articles.add(Article.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (articles != null) {
      data['articles'] = articles.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Article {
  int userId;
  int articleId;
  int tagId;
  String tagName;
  String title;
  String website;
  String description;
  String imageUrl;
  String linkUrl;
  int viewCount;
  bool isFav;
  bool all;

  Article(
      {this.userId,
      this.articleId,
      this.tagId,
      this.tagName,
      this.title,
      this.website,
      this.description,
      this.imageUrl,
      this.linkUrl,
      this.viewCount,
      this.isFav,
      this.all});

  Article.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'] as int;
    articleId = json['article_id'] as int;
    tagId = json['tag_id'] as int;
    tagName = json['tag_name'] as String;
    title = json['title'] as String;
    website = json['website'] as String;
    description = json['description'] as String;
    imageUrl = json['image_url'] as String;
    linkUrl = json['link_url'] as String;
    viewCount = json['view_count'] as int;
    isFav = json['is_fav'] as bool;
    all = json['all'] as bool;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['article_id'] = articleId;
    data['tag_id'] = tagId;
    data['tag_name'] = tagName;
    data['title'] = title;
    data['website'] = website;
    data['description'] = description;
    data['image_url'] = imageUrl;
    data['link_url'] = linkUrl;
    data['view_count'] = viewCount;
    data['is_fav'] = isFav;
    data['all'] = all;
    return data;
  }
}
