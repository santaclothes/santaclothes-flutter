Widget _profile() {
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: getProportionateScreenHeight(30),
    ),
    width: SizeConfig.screenWidth,
    height: getProportionateScreenHeight(126),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(color: shadowColor, offset: Offset(1, 2), blurRadius: 2)
        ]),
    child: Row(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Container()),
            Text(
              '${widget.user.nickName}님',
              maxLines: 1,
              style: TextStyle(
                  fontSize: getProportionateScreenHeight(20),
                  fontWeight: FontWeight.w800,
                  fontFamily: 'nanum_square'),
            ),
            SizedBox(height: getProportionateScreenHeight(12)),
            Text(
              '산클 옷장에 쌓인 옷',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: getProportionateScreenHeight(14),
                  fontWeight: FontWeight.w400,
                  fontFamily: 'nanum_square'),
            ),
            SizedBox(height: getProportionateScreenHeight(8)),
            Row(
              children: [
                Stack(children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: getProportionateScreenHeight(10)),
                    color: highlightColor,
                    height: getProportionateScreenHeight(4),
                    width: _width,
                  ),
                  Text(
                    '${_myPageBloc.myPageResponse.myLabelCount}',
                    key: clothNum,
                    style: TextStyle(
                        fontSize: getProportionateScreenHeight(14),
                        fontWeight: FontWeight.w700,
                        fontFamily: 'nanum_square'),
                  ),
                ]),
                Text(
                  '벌!',
                  style: TextStyle(
                      fontSize: getProportionateScreenHeight(14),
                      fontWeight: FontWeight.w400,
                      fontFamily: 'nanum_square'),
                )
              ],
            ),
            Expanded(child: Container()),
          ],
        ),
        Expanded(child: Container()),
        Image.asset(
          'assets/images/default_profile.png',
          height: getProportionateScreenHeight(78),
          width: getProportionateScreenWidth(78),
        )
      ],
    ),
  );
}