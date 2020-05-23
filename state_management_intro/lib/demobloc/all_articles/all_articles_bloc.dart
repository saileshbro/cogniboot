import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:state_management_intro/demobloc/models/articles_response_model.dart';
import 'package:state_management_intro/demobloc/repositories/article_repository.dart';

part 'all_articles_event.dart';
part 'all_articles_state.dart';

class AllArticlesBloc extends Bloc<AllArticlesEvent, AllArticlesState> {
  @override
  AllArticlesState get initialState => AllArticlesInitial();

  @override
  Stream<AllArticlesState> mapEventToState(
    AllArticlesEvent event,
  ) async* {
    if (event is GetAllArticlesEvent) {
      yield AllArticlesFetchingState();
      try {
        final ArticleResponseModel articles =
            await ArticleRepository.getAllArticles(Random().nextInt(200));
        yield AllArticlesFetchedState(articleResponseModel: articles);
      } catch (e) {
        yield AllArticlesErrorState(error: e.toString());
      }
    }
  }
}
