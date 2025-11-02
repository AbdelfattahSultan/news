import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/models/category_data.dart';
import 'package:news/modelus/home/view/source_articles_list.dart';
import 'package:news/modelus/home/view_model/sources_cubit/Source_cubit.dart';
import 'package:news/modelus/home/view_model/sources_cubit/Source_cubit_state.dart';

import 'package:shimmer_animation/shimmer_animation.dart';

class ArticlesListView extends StatefulWidget {
  final CategoryData selectedCategory;
  const ArticlesListView({super.key, required this.selectedCategory});
  @override
  State<ArticlesListView> createState() => _ArticlesListViewState();
}

class _ArticlesListViewState extends State<ArticlesListView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SourceCubit()..getAllSources(widget.selectedCategory.id),
      child: BlocBuilder<SourceCubit, SourceCubitState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return Shimmer(
              duration: Duration(seconds: 2),
              interval: Duration(seconds: 1),
              enabled: true,
              child: Container(
                height: 40,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey.shade300,
                ),
              ),
            );
          }
          if (state is SuccessState) {
            return DefaultTabController(
              length: state.sources.length,
              child: Column(
                children: [
                  SizedBox(height: 15),
                  TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    isScrollable: true,
                    labelColor: Colors.black,
                    labelStyle: TextStyle(fontSize: 18),
                    unselectedLabelStyle: TextStyle(fontSize: 14),
                    tabAlignment: TabAlignment.start,
                    indicatorColor: Colors.black,
                    tabs: state.sources
                        .map((source) => Tab(text: source.name))
                        .toList(),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: state.sources
                          .map(
                            (source) =>
                                SourceArticlesList(sourceId: source.id!),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
