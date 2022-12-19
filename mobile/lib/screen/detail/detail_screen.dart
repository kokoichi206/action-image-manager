import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final String userName;

  const DetailScreen({Key? key, required this.userName}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(widget.userName),
    );
  }
}
