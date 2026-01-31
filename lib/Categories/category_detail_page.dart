import 'package:flutter/material.dart';

class CategoryDetailPage extends StatelessWidget {
  final String categoryName;
  final Color categoryColor;

  const CategoryDetailPage({
    super.key,
    required this.categoryName,
    required this.categoryColor,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> categoryEvents = [];

    switch (categoryName) {
      case "Music":
        categoryEvents = [
          {
            "title": "DJ Night Live",
            "date": "28 May, 2026",
            "location": "Nelum Pokuna, Colombo",
            "price": "LKR 5,000",
            "image": "assets/dj.jpg",
          },
          {
            "title": "Rock Fest 2026",
            "date": "15 June, 2026",
            "location": "Galle Face, Colombo",
            "price": "LKR 3,500",
            "image": "assets/rockfest.jpg",
          },
          {
            "title": "Carnival",
            "date": "22 September, 2026",
            "location": "Port City, Colombo",
            "price": "LKR 4,000",
            "image": "assets/carnival.jpg",
          },
        ];
        break;
      case "Food":
        categoryEvents = [
          {
            "title": "Street Food Carnival",
            "date": "05 June, 2026",
            "location": "Viharamahadevi Park",
            "price": "LKR 1,000",
            "image": "assets/food.jpg",
          },
          {
            "title": "Ceylon Tea Tasting",
            "date": "10 June, 2026",
            "location": "Hilton, Colombo",
            "price": "LKR 4,500",
            "image": "assets/tea.jpg",
          },
          {
            "title": "Colombo Bake-Off 2026",
            "date": "05 August, 2026",
            "location": "Cinnamon Grand, Colombo",
            "price": "LKR 2,800",
            "image": "assets/backoff.jpg",
          },
        ];
        break;
      case "Tech":
        categoryEvents = [
          {
            "title": "AI Summit 2026",
            "date": "28 June, 2026",
            "location": "BMICH, Colombo",
            "price": "LKR 2,500",
            "image": "assets/tech.png",
          },
          {
            "title": "Flutter Workshop",
            "date": "20 April, 2026",
            "location": "University of Colombo",
            "price": "Free",
            "image": "assets/workshop.jpg",
          },
          {
            "title": "Colombo Game Dev Expo",
            "date": "05 July, 2026",
            "location": "Lotus Tower, Colombo",
            "price": "LKR 3,000",
            "image": "assets/game.jpg",
          },
        ];
        break;
      case "Art":
        categoryEvents = [
          {
            "title": "Kala Pola 2026",
            "date": "15 August, 2026",
            "location": "Ananda Coomaraswamy Mawatha",
            "price": "Free",
            "image": "assets/kalapola.jpg",
          },
          {
            "title": "Canvas & Cocktails",
            "date": "10 September, 2026",
            "location": "Barefoot Gallery, Colombo",
            "price": "LKR 4,500",
            "image": "assets/canvas.jpg",
          },
          {
            "title": "Digital Art Exhibition",
            "date": "02 November, 2026",
            "location": "JDA Perera Gallery",
            "price": "LKR 1,500",
            "image": "assets/digitalart.webp",
          },
        ];
        break;
      case "Sports":
        categoryEvents = [
          {
            "title": "LPL T20 Finals 2026",
            "date": "15 August, 2026",
            "location": "R. Premadasa Stadium, Colombo",
            "price": "LKR 2,500",
            "image": "assets/lplfinal.webp",
          },
          {
            "title": "Colombo City Marathon",
            "date": "22 September, 2026",
            "location": "Independence Square",
            "price": "Free",
            "image": "assets/marathon.jpg",
          },
          {
            "title": "Island Surfing Open",
            "date": "05 December, 2026",
            "location": "Arugam Bay / Hikkaduwa",
            "price": "Free",
            "image": "assets/surfing.jpeg",
          },
          
        ];
        break;
      default:
        categoryEvents = [
          {
            "title": "$categoryName General Event",
            "date": "Coming Soon",
            "location": "Colombo, SL",
            "price": "TBA",
            "image": "assets/future_tech.jpg",
          },
        ];
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "$categoryName Events",
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          _buildFilters(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: categoryEvents.length,
              itemBuilder: (context, index) {
                final event = categoryEvents[index];
                return _buildEventListItem(event);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilters() {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 20),
        children: [
          _filterChip("All", true),
          _filterChip("This Week", false),
          _filterChip("Free", false),
          _filterChip("Premium", false),
        ],
      ),
    );
  }

  Widget _filterChip(String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? categoryColor : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: categoryColor.withOpacity(0.3)),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : categoryColor,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  // list item
  Widget _buildEventListItem(Map<String, String> event) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              image: DecorationImage(
                image: AssetImage(event["image"]!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event["title"]!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          size: 12,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          event["date"]!,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  event["price"]!,
                  style: TextStyle(
                    color: categoryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
