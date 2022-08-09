import 'package:electrops/src/UI/home_screen/widgets/navigation_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              // buc buc bucket
            },
            icon: const Icon(Icons.shopping_bag),
          ),
          const Center(
            child: Text(
              'Electrops',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          const Spacer(),
          IconButton(
              onPressed: () {
                // menu button
              },
              icon: const Icon(Icons.menu))
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.09,
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Theme.of(context).secondaryHeaderColor,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.91,
                    margin: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 15.0),
                          child: Icon(Icons.search),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: const TextField(
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  NavigationCard(icon: Icons.sell_outlined, text: 'Selling'),
                  NavigationCard(
                      icon: Icons.category_outlined, text: 'Categories'),
                  NavigationCard(
                      icon: Icons.favorite_border_outlined, text: 'Favorite'),
                  NavigationCard(
                      icon: Icons.trending_up_outlined, text: 'Trends'),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    // open recenly viewed items
                  },
                  child: const Text('Your recently viewed items'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
