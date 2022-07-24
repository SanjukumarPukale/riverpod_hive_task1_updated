import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_hive_task1_updated/locator.dart';
import 'package:riverpod_hive_task1_updated/provider/providers.dart';
import 'package:riverpod_hive_task1_updated/view/colo_icon_list.dart';

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final iconColor = ref.watch(colorStateProvider);
    // final sliderValue = ref.watch(sizeStateProvider);
    // final iconSelect = ref.watch(iconSelectProvider);

    final watchIconState = ref.watch(iconProvider);
    final readIconState = ref.read(iconProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text('Riverpod Hive Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              locator.get<ColorIcon>().icons[watchIconState.iconVal], // v
              color: locator.get<ColorIcon>().colors[watchIconState.colorVal],
              size: watchIconState.sliderVal,
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.all(60),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FloatingActionButton(
                        heroTag: null,
                        onPressed: () {
                          readIconState.colorSelected(locator.get<ColorIcon>().colors.indexOf(Colors.purple));
                        },
                        backgroundColor: Colors.purple,
                      ),
                      FloatingActionButton(
                        heroTag: null,
                        onPressed: () {
                          readIconState.colorSelected(locator.get<ColorIcon>().colors.indexOf(Colors.indigo));
                        },
                        backgroundColor: Colors.indigo,
                      ),
                      FloatingActionButton(
                        heroTag: null,
                        onPressed: () {
                          readIconState.colorSelected(locator.get<ColorIcon>().colors.indexOf(Colors.blue));
                        },
                        backgroundColor: Colors.blue,
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FloatingActionButton(
                        heroTag: null,
                        onPressed: () {
                          readIconState.colorSelected(locator.get<ColorIcon>().colors.indexOf(Colors.green));
                        },
                        backgroundColor: Colors.green,
                      ),
                      FloatingActionButton(
                        heroTag: null,
                        onPressed: () {
                          readIconState.colorSelected(locator.get<ColorIcon>().colors.indexOf(Colors.yellow));
                        },
                        backgroundColor: Colors.yellow,
                      ),
                      FloatingActionButton(
                        heroTag: null,
                        onPressed: () {
                          readIconState.colorSelected(locator.get<ColorIcon>().colors.indexOf(Colors.orange));
                        },
                        backgroundColor: Colors.orange,
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Slider(
              activeColor: Colors.indigoAccent,
              value: watchIconState.sliderVal,
              min: 100.0,
              max: 200.0,
              divisions: 100,
              label: watchIconState.sliderVal.toString(),
              onChanged: (value) {
                // locator.get<ProviderService>().changeSlider(value, ref);
                readIconState.sliderChanged(value);
              },
            ),
            FloatingActionButton(
              child: Icon(Icons.settings),
              onPressed: () {
                context.push('/setting');
              },
            )
          ],
        ),
      ),
    );
  }
}
