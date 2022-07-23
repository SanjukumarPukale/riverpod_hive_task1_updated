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
              locator.get<ColorIcon>().icons[watchIconState.iconIndex],   // v
              color: locator.get<ColorIcon>().colors[watchIconState.colorIndex],
              size: watchIconState.sliderVal,
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 30,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: locator.get<ColorIcon>().colors.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    // GestureDetector is also do same as InkWell
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: locator.get<ColorIcon>().colors[index]),
                    ),
                    onTap: () {
                      // locator.get<ProviderService>().selectColorIndex(index, ref);
                      readIconState.colorSelected(index);
                    },
                  );
                },
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
            },)
            
          ],
        ),
      ),
    );
  }
}