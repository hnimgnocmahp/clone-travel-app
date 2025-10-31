import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonalManagementScreen extends StatelessWidget {
  const PersonalManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                // Thông tin cá nhân
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xFFF0F0F0), // Màu bắt đầu
                        Color(0xFFE2ECF5), // Màu kết thúc
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 28,
                            backgroundColor: Colors.grey,
                            child: Icon(
                              Icons.person,
                              size: 32,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Phạm Công Minh',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text('Mã BHXH: 7524801231'),
                            ],
                          ),
                        ],
                      ),
                      Divider(height: 5, thickness: 1),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Ngày sinh',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              '14/04/2004',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),

                      ),
                      Divider(height: 5, thickness: 1, color: Colors.grey),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'CCCD',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              '075204006222',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      Divider(height: 5, thickness: 1, color: Colors.grey),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'SĐT',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              '0896634215',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      Divider(height: 5, thickness: 1, color: Colors.grey),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Địa chỉ',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(width: 8), // khoảng cách nhỏ giữa label và nội dung
                            Expanded(
                              child: Text(
                                '538/3 An Chu, Xã Bắc Sơn, Huyện Trảng Bom, Tỉnh Đồng Nai',
                                style: TextStyle(fontSize: 16),
                                softWrap: true,
                                textAlign: TextAlign.right,
                                overflow: TextOverflow.visible,
                              ),
                            ),
                          ],
                        ),
                      )

                    ],
                  ),
                ),

                // Danh sách chức năng
                _buildMenuItem(context, Icons.credit_card, 'THẺ BHYT'),
                _buildMenuItem(context, Icons.history, 'QUÁ TRÌNH THAM GIA'),
                _buildMenuItem(context, Icons.info_outline, 'THÔNG TIN HƯỞNG'),
                _buildMenuItem(
                  context,
                  Icons.local_hospital,
                  'SỔ KHÁM CHỮA BỆNH',
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String title) {
    double screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          // Icon bên trái
          Column(
            children: [
              Icon(icon, color: Colors.blue),
              const SizedBox(height: 15), // đẩy icon lên cao để bằng text
            ],
          ),
          const SizedBox(width: 16),

          // Phần nội dung giữa
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 10),
                  const Divider(height: 5, thickness: 2),
                ],
              ),
            ),
          ),

          // Icon mũi tên bên phải
          Column(
            children: [
              const Icon(Icons.chevron_right, color: Colors.grey),
              const SizedBox(height: 15),
            ],
          ),
        ],
      ),
    );
  }
}
