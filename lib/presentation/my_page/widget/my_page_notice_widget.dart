// Widget _notice() {
//   return Stack(
//     children: [
//       Container(
//         alignment: Alignment.center,
//         height: getProportionateScreenHeight(128),
//         child: PageView.builder(
//             controller: BlocProvider.of<MyPageBloc>(context).pageController,
//             itemCount: _prompt.length,
//             onPageChanged: (page) {
//               BlocProvider.of<MyPageBloc>(context).add(MyPageSlide(page));
//             },
//             itemBuilder: (context, index) {
//               return Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   SizedBox(
//                     width: getProportionateScreenWidth(30),
//                   ),
//                   Container(
//                     alignment: Alignment.center,
//                     child: Image.asset('assets/images/mypage_illust.png',
//                         height: getProportionateScreenHeight(94)),
//                   ),
//                   Expanded(child: Container()),
//                   Container(
//                     width: getProportionateScreenWidth(220),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         SizedBox(height: getProportionateScreenHeight(36.0)),
//                         Text(
//                           _myPageBloc.myPageResponse.noticeViewList[index].title == null
//                               ? ''
//                               : _myPageBloc.myPageResponse.noticeViewList[index].title,
//                           overflow: TextOverflow.ellipsis,
//                           textAlign: TextAlign.end,
//                           maxLines: 2,
//                           style: TextStyle(
//                               fontSize: getProportionateScreenHeight(22),
//                               fontWeight: FontWeight.w800,
//                               fontFamily: 'nanum_square'),
//                         ),
//
//                         SizedBox(height: getProportionateScreenHeight(10.0)),
//                         Text(
//                           _myPageBloc.myPageResponse.noticeViewList[index].content ==
//                               null
//                               ? ''
//                               : _myPageBloc.myPageResponse.noticeViewList[index].content,
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                               fontSize: getProportionateScreenHeight(12.0),
//                               fontWeight: FontWeight.w400,
//                               fontFamily: 'nanum_square'),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(width: getProportionateScreenWidth(30))
//                 ],
//               );
//             }),
//       ),
//       StreamBuilder<int>(
//           stream: BlocProvider.of<MyPageBloc>(context).currentPage,
//           initialData: 0,
//           builder: (context, snapshot) {
//             return Container(
//               padding: EdgeInsets.only(
//                   right: getProportionateScreenWidth(30.0),
//                   top: getProportionateScreenHeight(16)),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: <Widget>[
//                   for (int i = 0;
//                   i < _myPageBloc.myPageResponse.noticeViewList.length;
//                   i++)
//                     if (i == snapshot.data) ...[_circleBar(true)] else
//                       _circleBar(false),
//                 ],
//               ),
//             );
//           }),
//     ],
//   );
// }
