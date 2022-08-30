import 'package:electrops/src/UI/categories_screen.dart';
import 'package:electrops/src/UI/drawer/drawer_menu.dart';
import 'package:electrops/src/UI/home_screen/widgets/navigation_card.dart';
import 'package:electrops/src/UI/home_screen/widgets/product_card.dart';
import 'package:electrops/src/models/firebase_file.dart';
import 'package:electrops/src/services/database.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<FirebaseFile>> futureFiles;

  @override
  void initState() {
    super.initState();

    futureFiles = FierStore().listAll('images/');
  }

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
                Navigator.of(context).pushReplacementNamed('/bucket');
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
                children: [
                  const NavigationCard(
                      icon: Icons.sell_outlined, text: 'Selling'),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CategoriesScreen()),
                      );
                    },
                    child: const NavigationCard(
                        icon: Icons.category_outlined, text: 'Categories'),
                  ),
                  GestureDetector(
                    onTap: (() {
                      Navigator.of(context).pushReplacementNamed('/favorit');
                    }),
                    child: const NavigationCard(
                        icon: Icons.favorite_border_outlined, text: 'Favorite'),
                  ),
                  const NavigationCard(
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
                FutureBuilder<List<FirebaseFile>>(
                  future: futureFiles,
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      default:
                        if (snapshot.hasError) {
                          return const Center(
                              child: Text('Somthing go wrong! :('));
                        } else {
                          final files = snapshot.data!;
                          return SizedBox(
                            height: 400,
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 12,
                                  height: 12,
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: files.length,
                                    itemBuilder: ((context, index) {
                                      final file = files[index];
                                      return ProductCard(
                                          image: file.url,
                                          text: file.name,
                                          price: 'Free');
                                    }),
                                  ),
                                )
                              ],
                            ),
                          );
                        }
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: DrawerWidget(),
    );
  }
}
