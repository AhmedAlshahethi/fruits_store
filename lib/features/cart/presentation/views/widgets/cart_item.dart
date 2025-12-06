import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_store/core/utils/app_colors.dart';
import 'package:fruits_store/core/utils/app_images.dart';
import 'package:fruits_store/core/utils/text_styles.dart';
import 'package:fruits_store/core/widgets/custom_network_image.dart';
import 'package:fruits_store/features/cart/domain/entities/cart_item_entity.dart';
import 'package:fruits_store/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruits_store/features/cart/presentation/cubits/cart_item_cubit.dart/cubit/cart_item_cubit.dart';
import 'package:fruits_store/features/cart/presentation/views/widgets/cart_item_action_buttons.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      buildWhen: (previous, current) {
        if (current is CartItemUpdated) {
          if (current.cartItemEntity == cartItemEntity) {
            return true;
          }
        }
        return false;
      },
      builder: (context, state) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 73,
              height: 92,
              color: Color(0xffF3F5F7),
              child: CustomNetworkImage(
                imageUrl: cartItemEntity.productEntity.imageUrl!,
              ),
            ),
            SizedBox(width: 17),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        cartItemEntity.productEntity.name,
                        style: TextStyles.bold13.copyWith(
                          color: Color(0xff06161C),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.read<CartCubit>().deleteCartItem(
                            cartItemEntity,
                          );
                        },
                        child: SvgPicture.asset(Assets.imagesTrash),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    '${cartItemEntity.calculateTotalWeight()} كم',
                    style: TextStyles.regular13.copyWith(
                      color: Color(0xffF4A91F),
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CartItemActionButtons(cartItemEntity: cartItemEntity),
                      Text(
                        '${cartItemEntity.calculateTotalPrice()} ريال ',
                        style: TextStyles.bold13.copyWith(
                          color: AppColors.secondaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
