import 'package:dream_helper/dream_helper.dart';
import 'package:example/router/example_router.dart';
import 'package:example/router/example_router_configeration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ProviderHelper<ThemeMode>(
            value: ThemeMode.system,
          ),
        )
      ],
      child: Consumer<ProviderHelper<ThemeMode>>(
        builder: (context, viewModel, child) => MaterialApp(
          themeMode: Provider.of<ProviderHelper<ThemeMode>>(context).value,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          title: 'Flutter Demo',
          onGenerateRoute: (settings) {

          },
          routes: ExampleRouterConfiguration.routes(),
        ),
      ),
    );
  }
}
