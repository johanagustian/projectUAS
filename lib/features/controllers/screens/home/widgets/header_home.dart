import 'package:flutter/material.dart';
import 'package:news_app/features/controllers/screens/home/widgets/search_result.dart';
import '../../../../../models/article.dart';

import '../../../../../common/widgets/costum_shape/circular_container.dart';

class HeaderHome extends StatefulWidget {
  const HeaderHome({
    super.key,
    required this.articles,
  });

  final List<Article> articles;

  @override
  State<HeaderHome> createState() => _HeaderHomeState();
}

class _HeaderHomeState extends State<HeaderHome> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    void updateSearchQuery(String query) {
      setState(() {
        searchQuery = query;
      });
    }

    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
      padding: const EdgeInsets.all(0),
      child: SizedBox(
        height: 350,
        child: Stack(
          children: [
            Positioned(
                top: -150,
                right: -250,
                child: CircularContainer(
                  backgroundColor: Colors.white.withOpacity(0.1), width: 400, height: 400,
                )),
            Positioned(
                top: 100,
                right: -300,
                child: CircularContainer(
                  backgroundColor: Colors.white.withOpacity(0.1), width: 400, height: 400,
                )),
            Container(
              margin: const EdgeInsets.fromLTRB(15, 100, 15, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "BuzzNews",
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "News from all over the world",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(15, 210, 15, 0),
                  child: TextFormField(
                    onChanged: updateSearchQuery,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    onFieldSubmitted: (value) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchResultPage(
                            articles: widget.articles,
                            searchQuery: searchQuery,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
