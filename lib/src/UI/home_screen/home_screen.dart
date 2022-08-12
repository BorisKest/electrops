import 'package:electrops/src/UI/drawer/drawer_menu.dart';
import 'package:electrops/src/UI/home_screen/widgets/navigation_card.dart';
import 'package:electrops/src/UI/home_screen/widgets/product_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> images = [
    'assets/images/0.JPG',
    'assets/images/1.JPG',
    'assets/images/2.JPG',
    'assets/images/3.JPG',
    'assets/images/4.JPG',
    'assets/images/5.JPG',
    'assets/images/6.JPG',
    'assets/images/7.JPG',
    'assets/images/8.JPG',
    'assets/images/9.JPG',
    'assets/images/10.JPG'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          const Center(
            child: Padding(
              padding: EdgeInsets.only(left: 50.0),
              child: Text(
                'Electrops',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const Spacer(),
          IconButton(
              onPressed: () {
                // buc buc bucket
              },
              icon: const Icon(Icons.shopping_bag))
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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ProductCard(
                        image: images[0],
                        text:
                            "Some description for this This is a great photo that you can buy when I'm done making this app :)",
                        price: 'Free',
                      ),
                      ProductCard(
                        image: images[2],
                        text:
                            "Some description for this This is a great photo that you can buy when I'm done making this app :)",
                        price: 'Free',
                      ),
                      ProductCard(
                        image: images[3],
                        text:
                            "Some description for this This is a great photo that you can buy when I'm done making this app :)",
                        price: 'Free',
                      ),
                      ProductCard(
                        image: images[4],
                        text:
                            "Some description for this This is a great photo that you can buy when I'm done making this app :)",
                        price: 'Free',
                      ),
                      ProductCard(
                        image: images[5],
                        text:
                            "Some description for this This is a great photo that you can buy when I'm done making this app :)",
                        price: 'Free',
                      ),
                    ],
                  ),
                ),
              ],
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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ProductCard(
                        image: images[0],
                        text:
                            "Some description for this This is a great photo that you can buy when I'm done making this app :)",
                        price: 'Free',
                      ),
                      ProductCard(
                        image: images[2],
                        text:
                            "Some description for this This is a great photo that you can buy when I'm done making this app :)",
                        price: 'Free',
                      ),
                      ProductCard(
                        image: images[3],
                        text:
                            "Some description for this This is a great photo that you can buy when I'm done making this app :)",
                        price: 'Free',
                      ),
                      ProductCard(
                        image: images[4],
                        text:
                            "Some description for this This is a great photo that you can buy when I'm done making this app :)",
                        price: 'Free',
                      ),
                      ProductCard(
                        image: images[5],
                        text:
                            "Some description for this This is a great photo that you can buy when I'm done making this app :)",
                        price: 'Free',
                      ),
                    ],
                  ),
                ),
              ],
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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ProductCard(
                        image: images[0],
                        text:
                            "Some description for this This is a great photo that you can buy when I'm done making this app :)",
                        price: 'Free',
                      ),
                      ProductCard(
                        image: images[2],
                        text:
                            "Some description for this This is a great photo that you can buy when I'm done making this app :)",
                        price: 'Free',
                      ),
                      ProductCard(
                        image: images[3],
                        text:
                            "Some description for this This is a great photo that you can buy when I'm done making this app :)",
                        price: 'Free',
                      ),
                      ProductCard(
                        image: images[4],
                        text:
                            "Some description for this This is a great photo that you can buy when I'm done making this app :)",
                        price: 'Free',
                      ),
                      ProductCard(
                        image: images[5],
                        text:
                            "Some description for this This is a great photo that you can buy when I'm done making this app :)",
                        price: 'Free',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: const DrawerWidget(),
    );
  }
}
