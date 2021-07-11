import 'package:flutter/material.dart';
import 'package:santaclothes/utils/constants.dart';
import 'package:santaclothes/utils/size_config.dart';

class CarouselSlider extends StatelessWidget {
  final List<String> imageUrls;

  CarouselSlider(this.imageUrls);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: getProportionateScreenWidth(250.0),
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: imageUrls.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return _buildImageItemWidget(index);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildImageItemWidget(int position) {
    return Container(
      margin: position == 0
          ? EdgeInsets.only(left: getProportionateScreenWidth(30.0))
          : EdgeInsets.only(
              left: getProportionateScreenWidth(14.0),
              right: getProportionateScreenWidth(14.0),
            ),
      width: getProportionateScreenWidth(250.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          imageUrls[position],
          fit: BoxFit.cover,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(primaryColor),
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
        ),
      ),
    );
  }
}
