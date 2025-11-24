import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/core/recources/assets_manager/assets_manager.dart';
import 'package:movie/core/recources/colors_manager/colors_manager.dart';
import 'package:movie/core/widgets/custom_text_button.dart';
import 'package:movie/features/main_layout/data/data_sources/remote/movies_api_remote_data_sources.dart';
import 'package:movie/features/main_layout/data/repositories_impl/movies_repositories_impl.dart';
import 'package:movie/features/main_layout/tabs/home_tab/home_cubit.dart';
import 'package:movie/model/moive_model.dart';
import 'package:movie/core/widgets/movie_item.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedIndex = 0;
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
                    // Movies Card CarouselSlider
                    CarouselSlider(
                      options: CarouselOptions(
                        disableCenter: true,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        viewportFraction: .55,
                        height: 320.h,
                        onPageChanged: (index, reason) {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                      ),
                      items: MovieModel.detalisMovie.map((movie) {
                        return Builder(
                          builder: (BuildContext context) {
                            return MovieItem(
                              image: movie.image,
                              rate: movie.rate,
                              widthImage: 243.w,
                            );
                          },
                        );
                      }).toList(),
                    ),

                    SizedBox(height: 21.h),
                    // WatchNow
                    Image.asset(ImageAssets.watchNow),
                    SizedBox(height: 16.h),
                    // TODO button SeeMore
                    Padding(
                      padding: REdgeInsets.only(left: 16, right: 12),
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
                          //See More
                          GestureDetector(
                            onTap: () {},
                            child: Row(
                              children: [
                                CustomTextButton(
                                  title: "See More",
                                  onTap: () {},
                                ),
                                SizedBox(width: 3.w),
                                Icon(
                                  Icons.arrow_forward,
                                  size: 17,
                                  color: ColorsManager.yellow,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    BlocProvider(
                      create: (context) => HomeCubit(
                        moviesRepositories: MoviesRepositoriesImpl(
                          moviesApiRemoteDataSources:
                              MoviesAPIRemoteDataSources(),
                        ),
                      )..getMovies(),
                      child: BlocBuilder<HomeCubit, HomeState>(
                        builder: (context, state) {
                          // var cubit = BlocProvider.of<HomeCubit>(context).getMovies();
                          if (state is MoviesLoading) {
                            return Center(child: CircularProgressIndicator());
                          } else if (state is MoviesError) {
                            return Text(
                              state.message,
                              style: GoogleFonts.aBeeZee(
                                fontSize: 20,
                                color: ColorsManager.yellow,
                              ),
                            );
                          } else if (state is MoviesSuccess) {
                            return SizedBox(
                              height: 220.h,
                              child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: state.movies.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  final movie = state.movies[index];
                                  return MovieItem(
                                    widthImage: 156.w,
                                    image: movie.backgroundImage,
                                    rate: movie.rating.toString(),
                                  );
                                },
                              ),
                            );
                          } else {
                            return Text('');
                          }
                        },
                      ),
                    ),

                    // Movies
                    SizedBox(height: 12.h),
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
