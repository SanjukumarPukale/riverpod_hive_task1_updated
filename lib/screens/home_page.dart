import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_hive_task1_updated/locator.dart';
import 'package:riverpod_hive_task1_updated/providers/iconProvider.dart';
import 'package:riverpod_hive_task1_updated/screens/colo_icon_list.dart';
import 'package:riverpod_hive_task1_updated/services/provider_services.dart';

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final iconColor = ref.watch(colorStateProvider); 
    final sliderValue = ref.watch(sizeStateProvider); 
    final iconSelect = ref.watch(iconSelectProvider); 

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
              locator.get<ColorIcon>().icons[iconSelect],   // v
              color: locator.get<ColorIcon>().colors[iconColor],
              size: sliderValue,
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
                      locator.get<ProviderService>().selectColorIndex(index, ref);
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
              value: sliderValue,    
              min: 100.0,
              max: 200.0,
              divisions: 100,
              label: sliderValue.toString(),
              onChanged: (value) {
                locator.get<ProviderService>().changeSlider(value, ref); 
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