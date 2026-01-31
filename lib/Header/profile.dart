// import 'package:flutter/material.dart';

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});

//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF8FAFC), 
//       extendBodyBehindAppBar: true, 
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         iconTheme: const IconThemeData(color: Colors.white),
//         actions: [
//           IconButton(
//             onPressed: () {}, 
//             icon: const Icon(Icons.edit_note_rounded, color: Colors.white, size: 28),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             _buildHeader(),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   _buildSectionTitle("Account Settings"),
//                   const SizedBox(height: 15),
//                   _buildMenuCard([
//                     _buildMenuItem(Icons.person_outline_rounded, "Personal Information", "Name, Email, Phone"),
//                     _buildMenuItem(Icons.payment_rounded, "Payments & Refunds", "Manage your transactions"),
//                     _buildMenuItem(Icons.notifications_none_rounded, "Notification Settings", "Manage your alerts"),
//                   ]),
//                   const SizedBox(height: 30),
//                   _buildSectionTitle("Activity"),
//                   const SizedBox(height: 15),
//                   _buildMenuCard([
//                     _buildMenuItem(Icons.favorite_border_rounded, "Your Favorites", "Events you liked"),
//                     _buildMenuItem(Icons.share_outlined, "Invite Friends", "Get rewards for sharing"),
//                   ]),
//                   const SizedBox(height: 40),
//                   Center(
//                     child: TextButton.icon(
//                       onPressed: () {},
//                       icon: const Icon(Icons.logout_rounded, color: Colors.redAccent),
//                       label: const Text("Log Out", style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildHeader() {
//     return Container(
//       width: double.infinity,
//       decoration: const BoxDecoration(
//         // BACK TO PREVIOUS BLUE GRADIENT
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [Color(0xFF3B82F6), Color(0xFF1E40AF)], 
//         ),
//         borderRadius: BorderRadius.only(
//           bottomLeft: Radius.circular(40), 
//           bottomRight: Radius.circular(40),
//         ),
//       ),
//       padding: const EdgeInsets.fromLTRB(20, 100, 20, 40),
//       child: Column(
//         children: [
        
//           Container(
//             padding: const EdgeInsets.all(4),
//             decoration: const BoxDecoration(color: Colors.white24, shape: BoxShape.circle),
//             child: const CircleAvatar(
//               radius: 55,
//               backgroundImage: AssetImage('assets/profile.jpg'),
//             ),
//           ),
//           const SizedBox(height: 15),
//           const Text(
//             "MRM Musammil",
//             style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//           const Text(
//             "musammil@gmail.com",
//             style: TextStyle(color: Colors.white70, fontSize: 14),
//           ),
//           const SizedBox(height: 25),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               _buildStat("12", "Events"),
//               _buildVerticalDivider(),
//               _buildStat("5", "Tickets"),
//               _buildVerticalDivider(),
//               _buildStat("24", "Points"),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildStat(String value, String label) {
//     return Column(
//       children: [
//         Text(value, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
//         Text(label, style: const TextStyle(color: Colors.white60, fontSize: 12)),
//       ],
//     );
//   }

//   Widget _buildVerticalDivider() {
//     return Container(height: 30, width: 1, color: Colors.white24);
//   }

//   Widget _buildSectionTitle(String title) {
//     return Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blueGrey));
//   }

//   Widget _buildMenuCard(List<Widget> children) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 5))],
//       ),
//       child: Column(children: children),
//     );
//   }

//   Widget _buildMenuItem(IconData icon, String title, String subtitle) {
//     return ListTile(
//       contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//       leading: Container(
//         padding: const EdgeInsets.all(8),
//         decoration: BoxDecoration(color: const Color(0xFFF1F5F9), borderRadius: BorderRadius.circular(12)),
//         child: Icon(icon, color: const Color(0xFF3B82F6)),
//       ),
//       title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
//       subtitle: Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.grey)),
//       trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 14, color: Colors.grey),
//       onTap: () {},
//     );
//   }
// }