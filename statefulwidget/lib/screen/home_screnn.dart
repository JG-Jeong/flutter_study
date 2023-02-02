import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final Color color;

  HomeScreen({required this.color, Key? key}) : super(key: key){
    print('Widget Constructor 실행!');
  }

  @override
  State<HomeScreen> createState() {
    print('createState 실행!');
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();

    print('initStae 실행!');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    print('didChangeDependencies 실행!');
  }

  @override
  void deactivate() {
    print('deactivate 실행!');
    super.deactivate();
  }

  @override
  void dispose() {
    print('dispose 실행!');
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    print('didUpdateWidget 실행!');
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    print('build 실행!');

    return Container(
      width: 50.0,
      height: 50.0,
      color: widget.color,
    );
  }
}
