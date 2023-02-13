import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:novel_reader/screens/story_detail/story_detail_screen.dart';
import '../../models/discovery.dart';

class RecentStoriesScreen extends StatelessWidget {
  final String title;
  final List<Story> stories;

  const RecentStoriesScreen(
      {super.key, required this.stories, required this.title});

  _navigateToStoryDetailScreen(BuildContext context, Story story) {
    print("${story.title}");
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return StoryDetailScreen(
        story: story,
      );
    }));
  }

  Widget recentStoriesCell(BuildContext context, Story story) {
    return GestureDetector(
      onTap: () {
        print("Selected: ${story.title}");
        _navigateToStoryDetailScreen(context, story);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            // child: Container(
            //   color: Colors.grey,
            // ),
            child: Image.network(
              story.image ?? "",
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          )),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 35,
            child: Text(
              "${story.title}",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
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
          // child: Container(
          //   color: Colors.grey,
          // ),
          child: Image.network(
            story.image ?? "",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        )),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 35,
          child: Text(
            "${story.title}",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final double itemWidth = (MediaQuery.of(context).size.width - 20) / 3;
    const double itemHeight = 90;
    //final double ratio = itemHeight / itemWidth;
    final double ratio = 0.5;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          width: MediaQuery.of(context).size.width,
          child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5,
                          childAspectRatio: ratio),
                      itemCount: stories.length,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (BuildContext context, index) {
                        return recentStoriesCell(
                            context, stories.elementAt(index));
                      }),
                ],
              )),
        )
      ],
    );
  }
}
