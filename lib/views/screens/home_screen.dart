import 'package:flutter/material.dart';
import 'package:notesapp/utils/app_fonts.dart';
import 'package:notesapp/views/widgets/custom_app_bar.dart';
import 'package:notesapp/views/widgets/home_screen_body.dart';
import '../widgets/custom_float_action_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(),
            Expanded(child: HomeScreenBody()),
          ],
        ),
      ),
      floatingActionButton: CustomFloatActionButton(),
    );
  }
}
