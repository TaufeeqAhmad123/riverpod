import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sliderProvider = StateProvider<AppState>((ref) {
  return AppState(slider: .5, showPassword: false);
});

class AppState {
  final double slider;
  final bool showPassword;

  AppState({required this.slider, required this.showPassword});

  AppState copyWith({double? slider, bool? showPassword}) {
    return AppState(
      slider: slider ?? this.slider,
      showPassword: showPassword ?? this.showPassword,
    );
  }
}

class MultiStateScreen extends ConsumerWidget {
  const MultiStateScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          Consumer(
            builder: (context, ref, child) {
                  print("Build slider");
              final slider = ref.watch(sliderProvider.select((state) => state.slider));
              return Container(
                height: 200,
                width: 200,
                color: Colors.red.withOpacity(slider),
              );
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              final slider = ref.watch(sliderProvider);
              return Slider(
                value: slider.slider,
                onChanged: (value) {
                  final stateProvider = ref.read(sliderProvider.notifier);
                  stateProvider.state = stateProvider.state.copyWith(
                    slider: value,
                  );
                },
              );
            },
          ),
          Consumer(

            builder: (context, ref, child) {
              print("Build Eye");
              final show = ref.watch(sliderProvider.select((state) => state.showPassword));
              return InkWell(
                onTap: () {
                  final stateProvider = ref.read(sliderProvider.notifier);
                  stateProvider.state = stateProvider.state.copyWith(
                    showPassword: !show,
                  );
                },
                child: Container(
                  height: 200,
                  width: 200,
                  child: show
                      ? Icon(Icons.remove_red_eye)
                      : Icon(Icons.remove_red_eye_outlined),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
