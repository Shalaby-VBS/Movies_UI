import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/widgets/custom_error_widget.dart';
import 'package:movies_app/features/home/presentation/manager/recommendations_cubit/recommendatins_cubit.dart';
import 'package:movies_app/features/home/presentation/views/widgets/gridview_item.dart';

class RecommendationGridview extends StatelessWidget {
  const RecommendationGridview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendatinsCubit, RecommendatinsState>(
      builder: (context, state) {
        if (state is RecommendatinsSuccess) {
          return SliverPadding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return GridViewItem(
                    movie: state.moviesList[index],
                  );
                },
                childCount: state.moviesList.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: 0.7,
                crossAxisCount: 3,
              ),
            ),
          );
        } else if (state is RecommendatinsFailure) {
          return SliverToBoxAdapter(
              child: CustomErrorWidget(errMassage: state.errMassage));
        } else {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
