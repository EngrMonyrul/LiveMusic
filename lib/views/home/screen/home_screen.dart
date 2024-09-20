import 'package:flutter/material.dart';
import 'package:live_score/common/widgets/custom_snackbar.dart';
import 'package:live_score/common/widgets/lading_page.dart';
import 'package:live_score/utils/extensions/context_ext.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  /*<<----------->> builder methods <<----------->>*/
  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return LadingPage(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              /*<<----------->> input section <<----------->>*/
              TextFormField(
                style: theme.textTheme.bodyMedium,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
