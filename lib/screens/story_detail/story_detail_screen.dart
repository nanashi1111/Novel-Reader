import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:novel_reader/models/discovery.dart';
import 'package:novel_reader/screens/story_detail/cubit/story_detail_cubit.dart';

class StoryDetailScreen extends StatelessWidget {
  final Story story;

  const StoryDetailScreen({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => StoryDetailCubit(),
      child: StoryDetailWidget(story: this.story),
    );
  }
}

class StoryDetailWidget extends StatelessWidget {
  final Story story;

  const StoryDetailWidget({super.key, required this.story});

  Widget _provideActionBar() {
    return Row(
      children: [
        SizedBox(
          height: 60,
          width: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  width: 30,
                  height: 30,
                  child: SvgPicture.asset(
                    "assets/icons/ic_story_action_download.svg",
                    colorFilter:
                        ColorFilter.mode(Colors.blue[600]!, BlendMode.srcIn),
                  )),
              Text(
                "Tải về",
                style: TextStyle(color: Colors.blue[600]),
              )
            ],
          ),
        ),
        Expanded(
            child: SizedBox(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.blue),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 30,
                        height: 30,
                        child: SvgPicture.asset(
                          "assets/icons/ic_story_action_read.svg",
                          colorFilter:
                              ColorFilter.mode(Colors.white, BlendMode.srcIn),
                        )),
                    const Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        "Đọc truyện",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                )),
          ),
        )),
        SizedBox(
          width: 100,
          height: 60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  width: 30,
                  height: 30,
                  child: SvgPicture.asset(
                    "assets/icons/ic_story_action_toc"
                    ".svg",
                    colorFilter:
                        ColorFilter.mode(Colors.blue[600]!, BlendMode.srcIn),
                  )),
              Text(
                "Mục lục",
                style: TextStyle(color: Colors.blue[600]),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _provideStoryDetail(StoryDetailState state) {
    if (state is StoryDetailData) {
      return Expanded(
          child: ListView(
            children:  [
              Padding(
                padding: const EdgeInsets.only(bottom: 50, top: 50),
                child: Text("${state.data.data?.title}"),
              ),
            ],
          ));
    } else {
      return const Expanded(child: Center(
        child: CircularProgressIndicator(
          color: Colors.pink,
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    context.read<StoryDetailCubit>().getStoryDetail(story);
    return BlocBuilder<StoryDetailCubit, StoryDetailState>(
        builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(child: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,

          ), onTap: () {
            Navigator.pop(context);
          },),
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [_provideStoryDetail(state), _provideActionBar()],
        ),
      );
    });
  }
}
