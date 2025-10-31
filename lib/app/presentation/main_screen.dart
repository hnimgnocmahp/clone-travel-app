import 'package:clone_travel_app/features/home/presentation/pages/home_screen.dart';
import 'package:clone_travel_app/app/provider/navigation_provider.dart';
import 'package:clone_travel_app/features/personal_management/personal_management_screen.dart';
import 'package:clone_travel_app/features/public_services/public_services_screen.dart';
import 'package:clone_travel_app/shared/utils/CustomOffsetFabLocation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentTabProvider);

    final screens = const [
      PersonalManagementScreen(),
      PublicServicesScreen(),
      HomeScreen(),
    ];

    final locations = [
      FloatingActionButtonLocation.startDocked,
      FloatingActionButtonLocation.centerDocked,
      FloatingActionButtonLocation.endDocked,
    ];

    final icons = [
      Icons.airplane_ticket,
      Icons.home,
      Icons.account_box_rounded,
    ];

    return Scaffold(
      body: IndexedStack(index: currentIndex, children: screens),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        onPressed: () {
          ref.read(currentTabProvider.notifier).state = currentIndex;
        },
        child: Icon(
          icons.elementAt(currentIndex), color: Colors.white
        ),
      ),
      floatingActionButtonLocation: CustomOffsetFabLocation(
        locations.elementAt(currentIndex),
        dxStart: 8,
        dxEnd: -8,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue.shade800,
        shape: const CircularNotchedRectangle(),
        notchMargin: 12,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: _buildNavItem(ref, icon: icons[0], label: 'Khuyến mãi', index: 0),
            ),
            Spacer(),
            Expanded(
              child: _buildNavItem(ref, icon: icons[1], label: 'Trang chủ', index: 1),
            ),
            Spacer(),
            Expanded(
              child: _buildNavItem(ref, icon: icons[2], label: 'Tài khoản', index: 2),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
    WidgetRef ref, {
    required IconData icon,
    required String label,
    required int index,
  }) {
    final currentIndex = ref.watch(currentTabProvider);
    final isSelected = currentIndex == index;

    return InkWell(
      onTap: () => ref.read(currentTabProvider.notifier).state = index,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: AnimatedSlide(
        offset: isSelected ? Offset(0, 0.5) : Offset(0, 0),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
        child: AnimatedOpacity(
          opacity: isSelected ? 0 : 1,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white),
              Text(label, style: TextStyle(color: Colors.white, fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }
}
