import 'package:auto_route/auto_route.dart';
import 'package:chicken_eggs/features/loading/loading_cubit/loading_cubit.dart';
import 'package:chicken_eggs/features/loading/loading_cubit/loading_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/router/router.dart';
import '../../../core/theme/app_images.dart';

import '../widgets/flame_progress_bar.dart';

@RoutePage()
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late final LoadingCubit _loadingCubit;
  bool _assetsPrecached = false;

  @override
  void initState() {
    super.initState();
    _loadingCubit = LoadingCubit();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _precacheImages();
  }

  Future<void> _precacheImages() async {
    await Future.wait([
      precacheImage(AssetImage(AppImages.backgroundLoading), context),
      precacheImage(AssetImage(AppImages.chickenMale), context),
    ]);
    setState(() {
      _assetsPrecached = true;
    });
    _loadingCubit.startLoading();
  }

  @override
  void dispose() {
    _loadingCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_assetsPrecached) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return BlocProvider.value(
      value: _loadingCubit,
      child: BlocListener<LoadingCubit, LoadingState>(
        listener: (context, state) {
          if (state is LoadingCompleted) {
            context.router.replace(const MenuRoute());
          }
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  AppImages.backgroundLoading,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: -20,
                left: 20,
                right: 0,
                child: Image.asset(
                  AppImages.chickenMale,
                  // width: 240,
                  height: 800,
                  fit: BoxFit.fill,
                  alignment: Alignment.bottomCenter,
                ),
              ),
              Positioned(
                bottom: 88,
                left: 36,
                right: 36,
                child: FlameProgressBar(progress: 0.85),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
