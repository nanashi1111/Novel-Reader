import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novel_reader/screens/discovery/cubit/recent_stories_cubit.dart';
import 'package:novel_reader/screens/discovery/cubit/recent_stories_state.dart';
import '../../models/discovery.dart';


class RecentScoriesScreen extends StatelessWidget {
  const RecentScoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RecentStoriesCubit(),
      child: RecentStories(),
    );
  }
}


class RecentStories extends StatelessWidget {
  late BuildContext context;

  RecentStories({super.key});

  List<Story> provideStories(StoriesState state) {
    if (state is! StoriesStateData) {
      return List.empty();
    }
    return (state).discoveryResponse.data?.story_new ?? List.empty();
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    context.read<RecentStoriesCubit>().getRecentStories();
    return BlocBuilder<RecentStoriesCubit, StoriesState>(
        builder: (context, state) {
      final double itemWidth = (MediaQuery.of(context).size.width - 20) / 3;
      const double itemHeight = 90;
      final double ratio = itemHeight / itemWidth;

      return Container(
        padding:  const EdgeInsets.only(left: 10, right: 10),
        width: MediaQuery.of(context).size.width,
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Visibility(
                  visible: state is StoriesStateLoading,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(
                        color: Colors.pink,
                      )
                    ],
                  ),
                ),
                Visibility(
                  visible: state is StoriesStateData,
                  child: GridView.builder(
                      gridDelegate:
                           SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 5,
                              childAspectRatio: ratio),
                      itemCount: provideStories(state).length,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (BuildContext context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    provideStories(state).elementAt(index).image ??
                                        "",
                                    fit: BoxFit.cover,
                                  ),
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 35,
                              child: Text(
                                "${provideStories(state).elementAt(index).title}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        );
                      }),
                )
              ],
            )),
      );
    });
  }
}
