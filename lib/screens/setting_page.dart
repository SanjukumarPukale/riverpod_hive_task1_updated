import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_hive_task1_updated/locator.dart';
import 'package:riverpod_hive_task1_updated/screens/colo_icon_list.dart';
import 'package:riverpod_hive_task1_updated/services/provider_services.dart';



class SettingPage extends ConsumerWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting page'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                heroTag: null,
                child: Icon(Icons.favorite),
                onPressed: () {
                locator.get<ProviderService>().selectIconIndex(locator.get<ColorIcon>().icons.indexOf(Icons.favorite), ref);
              },),
              FloatingActionButton(
                heroTag: null,
                child: Icon(Icons.call),
                onPressed: () {
                  locator.get<ProviderService>().selectIconIndex(locator.get<ColorIcon>().icons.indexOf(Icons.call), ref);
              },),
              FloatingActionButton(
                heroTag: null,
                child: Icon(Icons.cake),
                onPressed: () {
                locator.get<ProviderService>().selectIconIndex(locator.get<ColorIcon>().icons.indexOf(Icons.cake), ref);
              },),
              FloatingActionButton(
                heroTag: null,
                child: Icon(Icons.headset),
                onPressed: () {
                 locator.get<ProviderService>().selectIconIndex(locator.get<ColorIcon>().icons.indexOf(Icons.headset), ref);
              },),
            ],
          ),
        ),
      ),
    );
  }
}