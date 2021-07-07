import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pagination_view/pagination_view.dart';
import 'package:santaclothes/data/model/notification_item_response.dart';
import 'package:santaclothes/presentation/common/widget/dotted_line.dart';
import 'package:santaclothes/presentation/common/widget/horizontal_spacing.dart';
import 'package:santaclothes/presentation/common/widget/receipt_widget.dart';
import 'package:santaclothes/presentation/common/widget/vertical_spacing.dart';
import 'package:santaclothes/presentation/notification/notification_controller.dart';
import 'package:santaclothes/routes/app_routes.dart';
import 'package:santaclothes/utils/constants.dart';
import 'package:santaclothes/utils/size_config.dart';

class NotificationBody extends GetView<NotificationController> {
  @override
  Widget build(BuildContext context) {
    return ReceiptWidget(
      color: Colors.white,
      child: PaginationView<NotificationItemResponse>(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, value, position) {
          return _notificationItem(value, position);
        },
        pullToRefresh: true,
        pageFetch: (currentListSize) {
          return controller.fetchNotificationApi(currentListSize);
        },
        separatorBuilder: (context, position) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(30.0),
            ),
            child: DottedLine(
              dashColor: dottedLineColor,
              dashWidth: 3.5,
              dashHeight: 0.8,
            ),
          );
        },
        bottomLoader: Center(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(primaryColor)),
        ),
        initialLoader: Center(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(primaryColor)),
        ),
        onEmpty: Container(
          child: Center(
            child: Text(
              '알림 정보가 없습니다.',
              style: TextStyle(
                fontSize: getProportionateScreenHeight(16),
                fontFamily: 'nanum_square',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        onError: (dynamic error) => Center(
          child: Container(
            child: Center(
              child: Text(
                '알림 정보를 가져 올 수 없습니다\n잠시 후 다시 시도해주세요.',
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(16),
                  fontFamily: 'nanum_square',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _notificationItem(NotificationItemResponse item, int position) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.ERROR_REPORT,
            arguments: {'requestId': item.analysisRequestId});
      },
      child: Container(
        margin: EdgeInsets.only(
          top: position == 0
              ? getProportionateScreenHeight(56.0)
              : getProportionateScreenHeight(28.0),
          bottom: getProportionateScreenHeight(22.0),
        ),
        padding: EdgeInsets.only(
          left: getProportionateScreenWidth(36.0),
          right: getProportionateScreenWidth(30.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 36.0,
                  height: 36.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFF8D247),
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/ic_notification_36.svg',
                    height: 14.0,
                    width: 14.0,
                  ),
                ),
                HorizontalSpacing(of: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: item.clothName,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: sancleDark2Color,
                            fontFamily: 'nanum_square',
                            fontWeight: FontWeight.w800,
                          ),
                          children: [
                            TextSpan(
                              text: '결과가 완료 되었습니다.\n',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: '지금 바로 분석결과표를 확인해보세요.',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                height: 1.5,
                              ),
                            )
                          ],
                        ),
                      ),
                      VerticalSpacing(of: getProportionateScreenHeight(20.0)),
                      Text(
                        '2021/04/24  08:22AM',
                        style: TextStyle(
                          fontSize: getProportionateScreenHeight(14.0),
                          color: sancleDark2Color,
                          fontFamily: 'nanum_square',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
