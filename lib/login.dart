// import 'package:flutter/material.dart';
// import 'register.dart';
// import 'homepage.dart';

// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF8FAFC), 
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [

//             Container(
//               height: 300,
//               width: double.infinity,
//               decoration: const BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage('assets/login.jpg'),
//                   fit: BoxFit.cover,
//                 ),
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(50),
//                 ),
//               ),
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(50)),
//                   gradient: LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
//                   ),
//                 ),
//                 padding: const EdgeInsets.all(30),
//                 child: const Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text("Welcome Back!", 
//                       style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
//                     Text("Login to book your seat", 
//                       style: TextStyle(color: Colors.white70, fontSize: 16)),
//                   ],
//                 ),
//               ),
//             ),

//             Padding(
//               padding: const EdgeInsets.all(30.0),
//               child: Column(
//                 children: [
                  
//                   TextField(
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.white,
//                       prefixIcon: const Icon(Icons.email_outlined, color: Colors.blue),
//                       labelText: "Email Address",
//                       labelStyle: const TextStyle(color: Colors.grey),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20),
//                         borderSide: const BorderSide(color: Colors.white),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20),
//                         borderSide: const BorderSide(color: Colors.blue, width: 2),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),

                  
//                   TextField(
//                     obscureText: true,
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.white,
//                       prefixIcon: const Icon(Icons.lock_outline, color: Colors.blue),
//                       labelText: "Password",
//                       labelStyle: const TextStyle(color: Colors.grey),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20),
//                         borderSide: const BorderSide(color: Colors.white),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20),
//                         borderSide: const BorderSide(color: Colors.blue, width: 2),
//                       ),
//                     ),
//                   ),

//                   Align(
//                     alignment: Alignment.centerRight,
//                     child: TextButton(
//                       onPressed: () {},
//                       child: const Text("Forgot Password?", style: TextStyle(color: Colors.blue)),
//                     ),
//                   ),
//                   const SizedBox(height: 20),

            
//                   Container(
//                     decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.blue.withOpacity(0.3),
//                           blurRadius: 20,
//                           offset: const Offset(0, 10),
//                         ),
//                       ],
//                     ),
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color(0xFF1E40AF), 
//                         minimumSize: const Size(double.infinity, 60),
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//                         elevation: 0,
//                       ),
//                       onPressed: () {
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(builder: (context) => const EventoHomePage()),
//                         );
//                       },
//                       child: const Text("Login", 
//                         style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
//                     ),
//                   ),

//                   const SizedBox(height: 30),

                
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text("Don't have an account?", style: TextStyle(color: Colors.grey)),
//                       TextButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => const RegisterPage()),
//                           );
//                         },
//                         child: const Text("Register Now", 
//                           style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }