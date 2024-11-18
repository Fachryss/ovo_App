import 'package:flutter/material.dart';
import 'transfer_page.dart';
import 'pay_page.dart';
import 'topup_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double ovoBalance = 1000000; // Saldo awal OVO
  final TextEditingController _amountController = TextEditingController();
  bool _bannerSwiped =
      false; // Flag untuk melacak apakah banner sudah ditampilkan

  void _topUp(double amount) {
    setState(() {
      ovoBalance += amount;
    });
  }

  void _navigateTo(String page) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          switch (page) {
            case 'Transfer':
              return TransferPage();
            case 'Pay':
              return PayPage();
            case 'Top Up':
              return TopUpPage(onTopUp: _topUp);
            default:
              return HomePage();
          }
        },
      ),
    );
  }

  void _onBannerSwipe() {
    if (!_bannerSwiped) {
      setState(() {
        _bannerSwiped = true; // Menandakan banner sudah ditampilkan
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Banner Swiped!'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(right: 10, left: 10, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Kotak dengan OVO Balance di atas dan Transfer, Pay, Top Up di bawah
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage('assets/images/bg.jpg'),
                          fit: BoxFit.cover)),
                  padding: EdgeInsets.all(15),
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                  width: double.infinity,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Ovo Cash',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Rp 500.000.000,00',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildActionButton(
                              Icons.send, 'Transfer', 'Transfer'),
                          _buildActionButton(Icons.payment, 'Pay', 'Pay'),
                          _buildActionButton(Icons.add, 'Top Up', 'Top Up'),
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)),
                            child: Text(
                              '64 Pin',
                              style: TextStyle(color: Colors.purple.shade600),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 2, color: Colors.purple.shade600))),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          'Judul',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.purple.shade600,
                              fontWeight: FontWeight.w100),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                //SCROLLBAR HORIZONTAL
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildImageCard('assets/images/download.png', "Text"),
                      _buildImageCard('assets/images/download.png', "Text"),
                      _buildImageCard('assets/images/download.png', "Text"),
                      _buildImageCard('assets/images/download.png', "Text"),
                      _buildImageCard('assets/images/download.png', "Text"),
                      _buildImageCard('assets/images/download.png', "Text"),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 2, color: Colors.purple.shade600))),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          'Judul',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.purple.shade600,
                              fontWeight: FontWeight.w100),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                // Baris 4 (FOOTER)
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black87),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/download.png',
                            width: 50,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/download.png',
                            width: 50,
                            height: 50,
                          ),
                          Text("Text of the download"),
                        ],
                      ),
                      SizedBox(
                          height:
                              20), // Tambahkan jarak agar elemen bisa terlihat penuh
                      Text(
                        'Special Promo',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      // Promo Banner with Swipe Gesture
                      GestureDetector(
                        onHorizontalDragUpdate:
                            _bannerSwiped ? null : (_) => _onBannerSwipe(),
                        child: Container(
                          height: 150,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.purple[300],
                          ),
                          child: Center(
                            child: Text(
                              'Discount 50% on your first ride!',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label, String action) {
    return GestureDetector(
      onTap: () => _navigateTo(action),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon,
              size: 30, color: Colors.white), // Warna ikon diubah menjadi putih
          SizedBox(height: 8),
          Text(label,
              style: TextStyle(color: Colors.white)), // Warna teks putih
        ],
      ),
    );
  }

  Widget _buildImageCard(String imagePath, String text) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Image.asset(
            imagePath,
            width: 100,
            height: 100,
          ),
          Text(text),
        ],
      ),
    );
  }
}
