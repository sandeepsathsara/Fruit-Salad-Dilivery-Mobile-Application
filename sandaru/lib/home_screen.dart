import 'package:flutter/material.dart';
import 'package:sandaru/combo_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<IconData> _bottomIcons = [
    Icons.home_rounded,
    Icons.favorite_border_rounded,
    Icons.shopping_bag_outlined,
    Icons.person_outline_rounded,
  ];

  final List<String> _bottomLabels = ["Home", "Favorites", "Cart", "Profile"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(Icons.menu_rounded, size: 28, color: Colors.black),
                    Icon(
                      Icons.shopping_basket_outlined,
                      size: 28,
                      color: Colors.orange,
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                const Text(
                  'What fruit salad combo do you want today?',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 20),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.search, color: Colors.orange),
                      hintText: "Search for fruit salad combos",
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                const Text(
                  "Recommended Combo",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),

                SizedBox(
                  height: 190,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      buildComboCard(
                        context,
                        image: 'assets/honey.png',
                        title: 'Honey lime combo',
                        price: '₦ 1,000',
                      ),
                      buildComboCard(
                        context,
                        image: 'assets/bery.png',
                        title: 'Berry mango combo',
                        price: '₦ 800',
                      ),
                      buildComboCard(
                        context,
                        image: 'assets/salad.png',
                        title: 'Melon fruit mix',
                        price: '₦ 1,200',
                      ),
                      buildComboCard(
                        context,
                        image: 'assets/honey.png',
                        title: 'Pineapple passion combo',
                        price: '₦ 950',
                      ),
                      buildComboCard(
                        context,
                        image: 'assets/bery.png',
                        title: 'Strawberry delight',
                        price: '₦ 1,100',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                SizedBox(
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      CategoryTab(title: 'Hottest', selected: true),
                      CategoryTab(title: 'Popular'),
                      CategoryTab(title: 'New combo'),
                      CategoryTab(title: 'Top'),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                const Text(
                  "All Combos",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),

                SizedBox(
                  height: 190,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      buildComboCard(
                        context,
                        image: 'assets/salad.png',
                        title: 'Quinoa fruit salad',
                        price: '₦ 2,000',
                      ),
                      buildComboCard(
                        context,
                        image: 'assets/honey.png',
                        title: 'Tropical fruit salad',
                        price: '₦ 2,200',
                      ),
                      buildComboCard(
                        context,
                        image: 'assets/salad.png',
                        title: 'Melon combo',
                        price: '₦ 2,500',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 8,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: List.generate(_bottomIcons.length, (index) {
          return BottomNavigationBarItem(
            icon: Icon(_bottomIcons[index]),
            label: _bottomLabels[index],
          );
        }),
      ),
    );
  }

  Widget buildComboCard(
    BuildContext context, {
    required String image,
    required String title,
    required String price,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (_) => ComboDetailScreen(
                  image: image,
                  title: title,
                  price: price,
                  ingredients:
                      'Red Quinoa, Lime, Honey, Blueberries, Strawberries, Mango, Fresh mint',
                  description:
                      'If you are looking for a new fruit salad to eat today, quinoa is the perfect brunch for you.',
                ),
          ),
        );
      },
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
              child: Image.asset(
                image,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    price,
                    style: const TextStyle(
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryTab extends StatelessWidget {
  final String title;
  final bool selected;

  const CategoryTab({super.key, required this.title, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? Colors.orange.shade100 : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: selected ? Colors.orange : Colors.black54,
          fontWeight: selected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
