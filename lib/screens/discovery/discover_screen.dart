import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';
import 'package:novel_reader/models/discovery.dart';
import 'package:novel_reader/screens/discovery/cubit/recent_stories_cubit.dart';
import 'package:novel_reader/screens/discovery/cubit/recent_stories_state.dart';
import 'package:novel_reader/screens/discovery/recent_stories.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => RecentStoriesCubit(), child: DiscoverWidget());
  }
}

class DiscoverWidget extends StatelessWidget {
  const DiscoverWidget({Key? key}) : super(key: key);

  Widget provideActionsButton(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              child: GestureDetector(
            child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                shadowColor: Color.fromRGBO(0, 0, 0, 0.7),
                color: Colors.blue[200],
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: SizedBox(
                    height: 60,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/ic_most_review.svg",
                          color: Colors.blue[800],
                        ),
                        Text("Đánh giá",
                            style: TextStyle(color: Colors.blue[800]))
                      ],
                    ),
                  ),
                )),
            onTap: () {},
          )),
          Expanded(
              child: GestureDetector(
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                elevation: 5,
                shadowColor: Color.fromRGBO(0, 0, 0, 0.7),
                color: Colors.pink[200],
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: SizedBox(
                    height: 60,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/ic_most_favorite.svg",
                          color: Colors.pink[800],
                        ),
                        Text("Yêu thích",
                            style: TextStyle(color: Colors.pink[800]))
                      ],
                    ),
                  ),
                )),
            onTap: () {
              print("OnTap Yêu thích");
            },
          )),
          Expanded(
              child: GestureDetector(
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                elevation: 5,
                shadowColor: Color.fromRGBO(0, 0, 0, 0.7),
                color: Colors.deepOrangeAccent[200],
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: SizedBox(
                    height: 60,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/ic_most_rated.svg",
                          color: Colors.deepOrangeAccent[800],
                        ),
                        Text(
                          "Xem nhiều",
                          style: TextStyle(color: Colors.deepOrangeAccent[800]),
                        )
                      ],
                    ),
                  ),
                )),
            onTap: () {
              print("OnTap Xem nhiều");
            },
          )),
        ],
      ),
    );
  }

  Widget provideRecentStoriesWidget(StoriesState state) {
    if (state is! StoriesStateData) {
      return Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(
              color: Colors.pink,
            )
          ],
        ),
        const Padding(padding: EdgeInsets.all(20))
      ]);
    } else {
      return RecentStoriesScreen(
        stories: state.discoveryResponse.data?.story_new ?? List.empty(),
        title: "Mới đăng",
      );
    }
  }

  Widget provideUpdatedStoriesWidget(StoriesState state) {
    if (state is! StoriesStateData) {
      return Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(
              color: Colors.pink,
            )
          ],
        ),
        Padding(padding: EdgeInsets.all(20))
      ]);
    } else {
      return RecentStoriesScreen(
        stories: state.discoveryResponse.data?.story_update ?? List.empty(),
        title: "Mới cập nhật",
      );
    }
  }

  Widget provideHomeScreenContent(BuildContext context, StoriesState state) {
    print("State = $state");
    Container container = Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (ctx, index) {
                    if (index == 0) {
                      return const SizedBox(
                        width: 10,
                        height: 10,
                      );
                    } else if (index == 1) {
                      return provideActionsButton(context);
                    } else if (index == 2) {
                      return provideRecentStoriesWidget(state);
                    } else {
                      return provideUpdatedStoriesWidget(state);
                    }
                  },
                  itemCount: 4,
                ))));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Khám phá",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: container,
    );
  }

  @override
  Widget build(BuildContext context) {
    context.read<RecentStoriesCubit>().getRecentStories();
    var bb = BlocBuilder<RecentStoriesCubit, StoriesState>(
        builder: (context, state) {
      return provideHomeScreenContent(context, state);
    });
    return bb;
  }
}
