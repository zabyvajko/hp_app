import 'package:flutter/material.dart';

class HpCharacterScreen extends StatefulWidget {
  const HpCharacterScreen({super.key});

  @override
  State<HpCharacterScreen> createState() => _HpCharacterScreenState();
}

class _HpCharacterScreenState extends State<HpCharacterScreen> {
  String? characterName;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is String, 'You must provide String args');
    characterName = args as String;
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(characterName ?? '...'),
      ),
    );
  }
}
