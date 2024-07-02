import 'package:flutter/material.dart';
import 'package:news_app/features/controllers/screens/home/widgets/article_screen.dart';
import 'package:news_app/features/controllers/screens/home/widgets/image_container.dart';
import '../../../../../models/article.dart';

class Items extends StatelessWidget {
  const Items({
    super.key, required this.articles,
  });

  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Highlights",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 20,),
          GridView.builder(
            padding: const EdgeInsets.all(6),
            shrinkWrap: true,
            itemCount: articles.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1 ,
            ),
            itemBuilder: (context, index) {
              return Container(
                  width: MediaQuery.of(context).size.width * 0.42,
                  margin: const EdgeInsets.all(0),
                  child: GestureDetector(
                    onTap: () {
                      Route route = MaterialPageRoute(
                        builder: (context) => const ArticleScreen(),
                        settings: RouteSettings(
                          arguments: articles[index],
                        ),
                      );
                      Navigator.push(context, route);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ImageContainer(
                            width: MediaQuery.of(context).size.width * 0.42,
                            imageUrl: articles[index].imageUrl),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          articles[index].title,
                          maxLines: 2,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  fontWeight: FontWeight.bold, height: 1.5),
                        ),
                      ],
                    ),
                  ),
                );
            },
          ),
        ],
      ),
    );
  }
}