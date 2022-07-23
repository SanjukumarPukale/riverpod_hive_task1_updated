import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_hive_task1_updated/locator.dart';
import 'package:riverpod_hive_task1_updated/provider/providers.dart';
import 'package:riverpod_hive_task1_updated/view/colo_icon_list.dart';




class SettingPage extends ConsumerWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final readIconState = ref.read(iconProvider.notifier);
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
                // locator.get<ProviderService>().selectIconIndex(locator.get<ColorIcon>().icons.indexOf(Icons.favorite), ref);
                readIconState.iconSelected(locator.get<ColorIcon>().icons.indexOf(Icons.favorite));
              },),
              FloatingActionButton(
                heroTag: null,
                child: Icon(Icons.call),
                onPressed: () {
                  // locator.get<ProviderService>().selectIconIndex(locator.get<ColorIcon>().icons.indexOf(Icons.call), ref);
                  readIconState.iconSelected(locator.get<ColorIcon>().icons.indexOf(Icons.call));
              },),
              FloatingActionButton(
                heroTag: null,
                child: Icon(Icons.cake),
                onPressed: () {
                // locator.get<ProviderService>().selectIconIndex(locator.get<ColorIcon>().icons.indexOf(Icons.cake), ref);
                readIconState.iconSelected(locator.get<ColorIcon>().icons.indexOf(Icons.cake));
              },),
              FloatingActionButton(
                heroTag: null,
                child: Icon(Icons.headset),
                onPressed: () {
                //  locator.get<ProviderService>().selectIconIndex(locator.get<ColorIcon>().icons.indexOf(Icons.headset), ref);
                readIconState.iconSelected(locator.get<ColorIcon>().icons.indexOf(Icons.headset));
              },),
            ],
          ),
        ),
      ),
    );
  }
}