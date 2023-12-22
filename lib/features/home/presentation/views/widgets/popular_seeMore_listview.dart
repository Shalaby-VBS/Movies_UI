import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/widgets/custom_error_widget.dart';
import 'package:movies_app/features/home/presentation/manager/popular_cubit/popular_cubit.dart';
import 'package:movies_app/features/home/presentation/views/widgets/seeMore_item.dart';

class PopularSeeMoreListView extends StatelessWidget {
  const PopularSeeMoreListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Popular Movies',
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.black.withOpacity(0.7),
      ),
      body: BlocBuilder<PopularCubitCubit, PopularCubitState>(
        builder: (context, state) {
          if (state is PopularSuccess) {
            return ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 90, bottom: 10),
                itemBuilder: (context, indext) {
                  return SeeMoreItem(
                    movie: state.moviesList[indext],
                  );
                },
                separatorBuilder: (context, indext) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemCount: state.moviesList.length);
          } else if (state is PopularFailure) {
            return CustomErrorWidget(errMassage: state.errMassage);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
