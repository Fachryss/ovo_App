import 'package:flutter/material.dart';

class TopUpPage extends StatefulWidget {
  final Function(double) onTopUp;

  TopUpPage({required this.onTopUp});

  @override
  _TopUpPageState createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  final TextEditingController _amountController = TextEditingController();

  void _submitTopUp() {
    double? amount = double.tryParse(_amountController.text);
    if (amount != null && amount > 0) {
      widget.onTopUp(amount);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Top Up Successful!'),
        ),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invalid Amount!'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Top Up')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Jumlah Top Up',
                prefixText: 'Rp ',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitTopUp,
              child: Text('Top Up'),
            ),
          ],
        ),
      ),
    );
  }
}
