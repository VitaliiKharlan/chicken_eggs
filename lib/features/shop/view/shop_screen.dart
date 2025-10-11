import 'package:auto_route/auto_route.dart';
import 'package:chicken_eggs/core/theme/app_svg_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_images.dart';
import '../../../core/widgets/system_button_widget.dart';
import '../bloc/shop_bloc.dart';
import '../models/egg_item.dart';
import '../services/shop_service.dart';
import '../widgets/coin_display_widget.dart';
import '../widgets/egg_item_widget.dart';

@RoutePage()
class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopBloc(shopService: ShopService())
        ..add(ShopInitialized()),
      child: const _ShopScreenContent(),
    );
  }
}

class _ShopScreenContent extends StatelessWidget {
  const _ShopScreenContent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.backgroundShop),
                fit: BoxFit.fill,
              ),
            ),
          ),


          Positioned(
            top: 40,
            left: 12,
            right: 12,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: SystemButtonWidget(
                      iconAsset: AppSvgImages.iconBack,
                    ),
                    onTap: () {
                      context.router.maybePop();
                    },
                  ),

                  BlocBuilder<ShopBloc, ShopState>(
                    builder: (context, state) {
                      if (state is ShopLoaded) {
                        return CoinDisplayWidget(coins: state.coins);
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ],
              ),
            ),
          ),


          Positioned(
            top: 120,
            left: 16,
            right: 16,
            bottom: 20,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xCC7A025A),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFFF6CD8), width: 3),
              ),
              child: Column(
                children: [

                  Text(
                    'EGGS SHOP',
                    style: GoogleFonts.rubikMonoOne(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      color: Colors.white,
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  

                  Expanded(
                    child: BlocBuilder<ShopBloc, ShopState>(
                      builder: (context, state) {
                        if (state is ShopLoading) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Color(0xFFFF6CD8),
                            ),
                          );
                        }
                        
                        if (state is ShopError) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Error: ${state.message}',
                                  style: GoogleFonts.rubikMonoOne(
                                    fontSize: 16,
                                    color: Colors.red,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 16),
                                ElevatedButton(
                                  onPressed: () {
                                    context.read<ShopBloc>().add(ShopInitialized());
                                  },
                                  child: const Text('Return'),
                                ),
                              ],
                            ),
                          );
                        }
                        
                        if (state is ShopLoaded) {
                          return GridView.builder(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.8,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                            ),
                            itemCount: state.eggs.length,
                            itemBuilder: (context, index) {
                              final egg = state.eggs[index];
                              return EggItemWidget(
                                egg: egg,
                                isSelected: egg.id == state.selectedEggId,
                                onTap: () => _handleEggTap(context, egg, state),
                              );
                            },
                          );
                        }
                        
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleEggTap(BuildContext context, EggItem egg, ShopLoaded state) {
    if (egg.isUnlocked) {

      if (egg.id != state.selectedEggId) {
        context.read<ShopBloc>().add(EggSelected(egg.id));
        _showSnackBar(context, 'Egg "${egg.name}" selected!');
      }
    } else {

      if (state.coins >= egg.price) {
        _showPurchaseDialog(context, egg);
      } else {
        _showSnackBar(context, 'Not enough money!');
      }
    }
  }

  void _showPurchaseDialog(BuildContext context, EggItem egg) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xCC7A025A),
        title: Text(
          'Buying',
          style: GoogleFonts.rubikMonoOne(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        content: Text(
          'Buy "${egg.name}" за ${egg.price} coins?',
          style: GoogleFonts.rubikMonoOne(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Cancel',
              style: GoogleFonts.rubikMonoOne(
                color: Colors.grey,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.read<ShopBloc>().add(EggPurchased(egg.id));
              _showSnackBar(context, 'Egg "${egg.name}" purchased!');
            },
            child: Text(
              'Buy',
              style: GoogleFonts.rubikMonoOne(
                color: const Color(0xFFFF6CD8),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: GoogleFonts.rubikMonoOne(
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xCC7A025A),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
