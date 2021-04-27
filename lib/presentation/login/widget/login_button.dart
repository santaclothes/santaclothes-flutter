import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:santaclothes/utils/size_config.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class LoginButton extends StatelessWidget {
  final String iconAssetsName;
  final VoidCallback onTab;
  final Color backgroundColor;
  final Color textColor;

  LoginButton({
    @required this.iconAssetsName,
    @required this.backgroundColor,
    @required this.textColor,
    @required this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      activeOpacity: 0.6,
      onTap: () {
        onTab();
      },
      child: Container(
        width: double.infinity,
        height: getProportionateScreenHeight(52),
        margin:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(38)),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(left: 20.0),
              alignment: Alignment.centerLeft,
              child: SvgPicture.asset(iconAssetsName),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                '카카오톡으로 로그인',
                style: TextStyle(
                    color: textColor,
                    fontSize: 14.0,
                    fontFamily: 'nanum_square',
                    fontWeight: FontWeight.w700),
              ),
            )
          ],
        ),
      ),
    );
  }
}
