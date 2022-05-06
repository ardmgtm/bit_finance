import 'package:flutter/material.dart';

class EmptyTransactionWidget extends StatelessWidget {
  const EmptyTransactionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Padding(
            padding: EdgeInsets.all(16),
            child: Icon(
              Icons.file_copy,
              color: Colors.grey,
              size: 30,
            ),
          ),
          Text(
            "Empty Transaction !",
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
