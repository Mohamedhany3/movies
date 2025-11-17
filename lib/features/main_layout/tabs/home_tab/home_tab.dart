import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/core/recources/assets_manager/assets_manager.dart';
import 'package:movie/core/recources/colors_manager/colors_manager.dart';
import 'package:movie/model/moive_model.dart';
import 'package:movie/model/movie_item.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late PageController _pageController;
  int currentPage = 0;

  @override
  void initState() {
    _pageController = PageController(viewportFraction: 0.6);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset(ImageAssets.background),
              //Gradient
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        ColorsManager.black.withOpacity(.3),
                        ColorsManager.black.withOpacity(.8),
                        ColorsManager.black,
                        ColorsManager.black,
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: REdgeInsets.only(bottom: 40),
                child: Column(
                  children: [
                    SizedBox(height: 10.h),
                    // AvailableNow
                    Center(child: Image.asset(ImageAssets.availableNow)),
                    SizedBox(height: 21.h),

                    // Movies Card
                    SizedBox(
                      height: 351.h,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: MovieModel.detalisMovie.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => MovieItem(
                          widthImage: 234.w,
                          image: MovieModel.detalisMovie[index].image,
                          rate: MovieModel.detalisMovie[index].rate,
                        ),
                      ),
                    ),
                    // Center(
                    //   child: SizedBox(
                    //     height: 351.h,
                    //     child: PageView.builder(
                    //       controller: _pageController,
                    //       itemCount: MovieModel.detalisMovie.length,
                    //       onPageChanged: (index) {
                    //         setState(() {
                    //           currentPage = index;
                    //         });
                    //       },
                    //       itemBuilder: (context, index) {
                    //         double scale = index == currentPage ? 1.0 : 0.8;
                    //         return TweenAnimationBuilder(
                    //           tween: Tween<double>(begin: scale, end: scale),
                    //           duration: Duration(milliseconds: 300),
                    //           builder: (context, value, child) {
                    //             return Transform.scale(
                    //               scale: value,
                    //               child: Stack(
                    //                 children: [
                    //                   // Movie Card
                    //                   Container(
                    //                     margin: EdgeInsets.symmetric(
                    //                       horizontal: 10,
                    //                     ),
                    //                     child: ClipRRect(
                    //                       borderRadius: BorderRadius.circular(
                    //                         20,
                    //                       ),
                    //                       child: Image.asset(
                    //                         MovieModel
                    //                             .detalisMovie[index]
                    //                             .image,
                    //                         fit: BoxFit.fill,
                    //                       ),
                    //                     ),
                    //                   ),
                    //                   // Rate
                    //                   Container(
                    //                     margin: EdgeInsets.only(
                    //                       left: 30,
                    //                       top: 9,
                    //                     ),
                    //                     height: 28,
                    //                     width: 58,
                    //                     decoration: BoxDecoration(
                    //                       color: ColorsManager.black
                    //                           .withOpacity(0.71),
                    //                       borderRadius: BorderRadius.circular(
                    //                         10,
                    //                       ),
                    //                     ),
                    //                     child: Row(
                    //                       mainAxisAlignment:
                    //                           MainAxisAlignment.center,
                    //                       children: [
                    //                         Text(
                    //                           MovieModel
                    //                               .detalisMovie[index]
                    //                               .rate,
                    //                           style: GoogleFonts.roboto(
                    //                             fontSize: 16.sp,
                    //                             fontWeight: FontWeight.w400,
                    //                             color: ColorsManager.white,
                    //                           ),
                    //                         ),
                    //                         SizedBox(width: 4.w),
                    //                         Image.asset(
                    //                           ImageAssets.star,
                    //                           width: 15.w,
                    //                           height: 15.h,
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   ),
                    //                 ],
                    //               ),
                    //             );
                    //           },
                    //         );
                    //       },
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: 21.h),
                    // WatchNow
                    Image.asset(ImageAssets.watchNow),
                    SizedBox(height: 16.h),
                    // TODO button SeeMore
                    Padding(
                      padding: REdgeInsets.only(left: 16, right: 19),
                      child: Row(
                        children: [
                          Text(
                            'Action',
                            style: GoogleFonts.roboto(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,
                              color: ColorsManager.white,
                            ),
                          ),
                          Spacer(),
                          Text(
                            'Action',
                            style: GoogleFonts.roboto(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,
                              color: ColorsManager.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12.h),
                    // Movies
                    SizedBox(
                      height: 220.h,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: MovieModel.detalisMovie.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => MovieItem(
                          widthImage: 156.w,
                          image: MovieModel.detalisMovie[index].image,
                          rate: MovieModel.detalisMovie[index].rate,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
