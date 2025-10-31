import 'package:clone_travel_app/features/home/presentation/widgets/bottom_header_clipper.dart';
import 'package:clone_travel_app/features/home/presentation/widgets/top_header_clipper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          _homeSearchBar(),
          _menuBar(context),
          _buildSlider([
            Colors.red,
            Colors.green,
            Colors.blue,
            Colors.orange,
          ])

        ]
        )),
    );
  }

  Widget _homeSearchBar() {
    return Stack(
      children: [
        // Nền cong màu xanh
        ClipPath(
          clipper: TopHeaderClipper(),
          child: Container(
            height: 120,
            color: const Color(0xFF1E88E5), // xanh dương
          ),
        ),

        // Thanh tìm kiếm nổi trên nền
        Positioned(
          top: 60,
          left: 15,
          right: 15,
          child: Row(
            children: [
              Icon(Icons.account_box_rounded, size: 40, color: Colors.white),
              Expanded(
                child: Container(
                  height: 45,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Tìm kiếm ...',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Icon(Icons.notifications, size: 40, color: Colors.white),
              Icon(Icons.circle, size: 40, color: Colors.white),
            ],
          ),
        ),
      ],
    );
  }

  Widget _menuBar(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: BottomHeaderClipper(),
          child: Container(
            height: 120,
            color: const Color(0xFF1E88E5), // xanh dương
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: 160,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildMenuItem(Icons.airport_shuttle, "Tour trọn gói"),
                    _buildMenuItem(Icons.airline_seat_flat_angled, "Khách sạn"),
                    _buildMenuItem(Icons.flight, "Vé máy bay"),
                    _buildMenuItem(Icons.account_tree_outlined, "Combo"),
                    _buildMenuItem(Icons.more, "Dịch vụ khác")
                  ],
                ),
              ),
              SizedBox(height: 6,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildMenuItem(Icons.airport_shuttle, "Tour trọn gói"),
                    _buildMenuItem(Icons.airline_seat_flat_angled, "Khách sạn"),
                    _buildMenuItem(Icons.flight, "Vé máy bay"),
                    _buildMenuItem(Icons.account_tree_outlined, "Combo"),
                    _buildMenuItem(Icons.more, "Dịch vụ khác")
                  ],
                ),
              ),
            ]
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem(IconData icon, String label) {
    return Container(
      width: 80,
      child: Column(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: const Color(0xFF1E88E5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(height: 6),
          Text(label, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),),
        ],
      ),
    );
  }

  Widget _buildSlider(List<Color> colors) {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        controller: PageController(
          viewportFraction: 0.8, // mỗi item chiếm 80% width, hai bên lộ 20%
        ),
        itemBuilder: (context, index) {
          final color = colors[index % colors.length];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
          );
        },
      ),
    );
  }


}
