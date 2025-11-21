import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/modelus/home/widget/article_item.dart';
import 'package:news/modelus/search/search_cubit%20.dart/search_cubit.dart';
import 'package:news/modelus/search/search_cubit%20.dart/search_state.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: SearchViewContent(),
    );
  }
}

class SearchViewContent extends StatelessWidget {
  const SearchViewContent({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<SearchCubit>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: cubit.controller,
                onSubmitted: (value) => cubit.searchArticles(),
                decoration: InputDecoration(
                  hintText: "Search",
                  suffixIcon: IconButton(
                    onPressed: () {
                      cubit.clear();
                    },
                    icon: Icon(Icons.close),
                  ),
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide(color: Colors.black, strokeAlign: 2),
                  ),
                ),
              ),
              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is LoadingState) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is ErrorState) {
                    return Center(child: Text(state.message));
                  } else if (state is EmptyState) {
                    return Center(child: Text(state.message));
                  } else if (state is SuccessState) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: state.articles.length,
                        itemBuilder: (context, index) {
                          return ArticleItem(article: state.articles[index]);
                        },
                      ),
                    );
                  }
                  return SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
