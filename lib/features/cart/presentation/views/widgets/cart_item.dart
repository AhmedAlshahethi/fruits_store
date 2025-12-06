import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_store/core/utils/app_images.dart';
import 'package:fruits_store/core/utils/text_styles.dart';
import 'package:fruits_store/core/widgets/custom_network_image.dart';
import 'package:fruits_store/features/cart/presentation/views/widgets/cart_item_action_buttons.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 73,
          height: 92,
          color: Color(0xffF3F5F7),
          child: CustomNetworkImage(
            imageUrl:
                'https://vehicle-images.dealerinspire.com/cdaf-110008689/thumbnails/large/1FA6P8CF8S5402512/a1acb198906e6daaa3fde62fc36d2bb0.jpg',
          ),
        ),
        SizedBox(width: 17),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'بطيخ',
                    style: TextStyles.bold13.copyWith(color: Color(0xff06161C)),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(Assets.imagesTrash),
                  ),
                ],
              ),
              Text(
                '3 كم',
                style: TextStyles.regular13.copyWith(color: Color(0xffF4A91F)),
              ),
              Row(children: [CartItemActionButtons()]),
            ],
          ),
        ),
      ],
    );
  }
}
