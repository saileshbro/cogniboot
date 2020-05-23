import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_intro/demobloc/all_articles/all_articles_bloc.dart';
import 'package:state_management_intro/demobloc/models/articles_response_model.dart';
import 'package:state_management_intro/demobloc/widgets/article_box.dart';

class AllArticlesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All articles'),
        centerTitle: true,
      ),
      body: BlocBuilder<AllArticlesBloc, AllArticlesState>(
        bloc: context.bloc<AllArticlesBloc>(),
        builder: (BuildContext context, AllArticlesState state) {
          if (state is AllArticlesFetchingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AllArticlesErrorState) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(state.error),
                  const SizedBox(height: 10),
                  RaisedButton(
                    onPressed: () => context
                        .bloc<AllArticlesBloc>()
                        .add(GetAllArticlesEvent()),
                    child: const Text('Try again'),
                  )
                ],
              ),
            );
          } else if (state is AllArticlesFetchedState) {
            return RefreshIndicator(
              onRefresh: () async {
                context.bloc<AllArticlesBloc>().add(GetAllArticlesEvent());
              },
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  final Article article =
                      state.articleResponseModel.articles[index];
                  return ArticleBox(article: article);
                },
                itemCount: state.articleResponseModel.articles.length,
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
