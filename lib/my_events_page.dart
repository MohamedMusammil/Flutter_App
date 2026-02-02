import 'package:flutter/material.dart';
import 'package:flutter_application_1/featured_events/event_details_page.dart';

class MyEventsPage extends StatelessWidget {
  const MyEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> bookedEvents = [
      {
        'name': 'International Music Festival',
        'date': '24th Oct 2026',
        'location': 'Sugathadasa Stadium',
        'image': 'assets/music.jpeg',
        'status': 'Confirmed',
        'price': 'LKR 5,000',
      },
      {
        'name': 'Tech Conference 2026',
        'date': '12th Nov 2026',
        'location': 'BMICH, Colombo',
        'image': 'assets/tech.png',
        'status': 'Upcoming',
        'price': 'Free',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF3F5F7),
      appBar: AppBar(
        title: const Text(
          "My Bookings",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: Colors.black,
            letterSpacing: 0.5,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemCount: bookedEvents.length,
        itemBuilder: (context, index) {
          return _buildPremiumTicket(context, bookedEvents[index]);
        },
      ),
    );
  }

  Widget _buildPremiumTicket(BuildContext context, Map<String, String> event) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventDetailsPage(event: event),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 25),
        child: Stack(
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Hero(
                    tag: 'event_image_${event['name']}',
                    child: Container(
                      width: 100,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(24),
                          bottomLeft: Radius.circular(24),
                        ),
                        image: DecorationImage(
                          image: AssetImage(event['image']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            event['name']!.toUpperCase(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 14,
                              letterSpacing: 0.2,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              const Icon(
                                Icons.calendar_today_outlined,
                                size: 12,
                                color: Colors.blue,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                event['date']!,
                                style: const TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                size: 12,
                                color: Colors.grey[400],
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  event['location']!,
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 12,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  Container(width: 1, height: 80, color: Colors.grey[200]),

                  Container(
                    width: 50,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.blue[50]!.withOpacity(0.5),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(24),
                        bottomRight: Radius.circular(24),
                      ),
                    ),
                    child: const RotatedBox(
                      quarterTurns: 3,
                      child: Center(
                        child: Text(
                          "TAP TO VIEW",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w800,
                            fontSize: 9,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
              left: 90,
              top: -10,
              child: CircleAvatar(
                radius: 10,
                backgroundColor: Color(0xFFF3F5F7),
              ),
            ),
            Positioned(
              left: 90,
              bottom: -10,
              child: CircleAvatar(
                radius: 10,
                backgroundColor: Color(0xFFF3F5F7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
