part of 'all_articles_bloc.dart';

@immutable
abstract class AllArticlesState {}

class AllArticlesInitial extends AllArticlesState {}

class AllArticlesFetchingState extends AllArticlesState {}

class AllArticlesFetchedState extends AllArticlesState {
  final ArticleResponseModel articleResponseModel;

  AllArticlesFetchedState({
    @required this.articleResponseModel,
  });
}

class AllArticlesErrorState extends AllArticlesState {
  final String error;
  AllArticlesErrorState({@required this.error});
}
