import 'package:flutter/material.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  // 5 PREMIUM SAMPLE ITEMS USING ASSET IMAGES
  final List<Map<String, String>> favouriteEvents = [
    {
      'name': 'Coldplay: Music of Spheres',
      'date': 'Feb 24, 2026',
      'image': 'assets/dj.jpg',
      'status': 'Selling Fast',
      'price': 'LKR 15,000',
    },
    {
      'name': 'SL vs IND: T20 Final',
      'date': 'Mar 05, 2026',
      'image': 'assets/cricket.avif',
      'status': 'Limited Seats',
      'price': 'LKR 5,000',
    },
    {
      'name': 'Lankan Food Festival',
      'date': 'Mar 12, 2026',
      'image': 'assets/food.jpg',
      'status': 'Trending',
      'price': 'LKR 2,500',
    },
    {
      'name': 'Tech Conference 2026',
      'date': 'Apr 02, 2026',
      'image': 'assets/tech.png',
      'status': 'Early Bird',
      'price': 'LKR 8,500',
    },
    {
      'name': 'Ocean Rave Party',
      'date': 'Apr 18, 2026',
      'image': 'assets/surfing.jpeg',
      'status': '18+ Only',
      'price': 'LKR 10,000',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC), 
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "My Favourites",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: false,
      ),
      body: favouriteEvents.isEmpty
          ? _buildEmptyState()
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              itemCount: favouriteEvents.length,
              itemBuilder: (context, index) {
                return _buildFavouriteCard(favouriteEvents[index], index);
              },
            ),
    );
  }

  
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite_border, size: 80, color: Colors.grey[300]),
          const SizedBox(height: 20),
          const Text("No favourites yet", 
            style: TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  
  Widget _buildFavouriteCard(Map<String, String> event, int index) {
    return Dismissible(
      key: Key(event['name']! + index.toString()), 
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        String removedItemName = event['name']!;
        setState(() {
          favouriteEvents.removeAt(index);
        });
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("$removedItemName removed from favourites"),
            duration: const Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
          ),
        );
      },
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 25),
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Colors.redAccent.withOpacity(0.9),
          borderRadius: BorderRadius.circular(25),
        ),
        child: const Icon(Icons.delete_outline, color: Colors.white, size: 30),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          children: [
            
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                event['image']!,
                width: 95,
                height: 95,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 95,
                  height: 95,
                  color: Colors.grey[200],
                  child: const Icon(Icons.image_not_supported, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(width: 15),
            
            
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E40AF).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      event['status']!,
                      style: const TextStyle(
                        color: Color(0xFF1E40AF), 
                        fontSize: 10, 
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    event['name']!,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.access_time, size: 14, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(event['date']!, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    event['price']!,
                    style: const TextStyle(
                      color: Color(0xFF1E40AF), 
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                    ),
                  ),
                ],
              ),
            ),
            
          
            IconButton(
              onPressed: () {
                setState(() {
                  favouriteEvents.removeAt(index);
                });
              },
              icon: const Icon(Icons.favorite, color: Colors.redAccent, size: 28),
            ),
          ],
        ),
      ),
    );
  }
}