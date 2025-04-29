import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/Theme/theme.dart';
import 'package:graduation_project/home_screen/bloc/Home/home_bloc.dart';
import 'package:graduation_project/home_screen/bloc/Home/home_event.dart';
import 'package:graduation_project/home_screen/bloc/Home/home_state.dart';
import 'package:graduation_project/home_screen/data/model/offers_model_response/offers_model_response/offers_model_response.dart';

class OffersScreen extends StatelessWidget {
  static const routeName = '/offers';

  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(FetchOffersEvent());

    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              MyTheme.orangeColor.withOpacity(0.9),
              Colors.redAccent.withOpacity(0.7),
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // AppBar مخصص
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          color: MyTheme.whiteColor.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(12.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 6.r,
                              offset: Offset(0, 2.h),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_rounded,
                          color: MyTheme.orangeColor,
                          size: 20.w,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "Hot Deals 🔥",
                          style: textTheme.displayLarge?.copyWith(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            color: MyTheme.whiteColor,
                            shadows: [
                              Shadow(
                                color: Colors.black45,
                                blurRadius: 4.r,
                                offset: Offset(2.w, 2.h),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 40.w), // للتوزان
                  ],
                ),
              ),
              Expanded(
                child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state is FetchOffersLoadingState) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: MyTheme.whiteColor,
                          strokeWidth: 4.w,
                        ),
                      );
                    } else if (state is FetchOffersErrorState) {
                      return Center(
                        child: Text(
                          "Error loading offers: ${state.message}",
                          style: textTheme.bodyMedium?.copyWith(
                            color: MyTheme.whiteColor,
                            fontSize: 16.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      );
                    } else if (state is FetchOffersSuccessState) {
                      final offers = state.offers;
                      if (offers.isEmpty) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.local_offer_outlined,
                                size: 100.w,
                                color: MyTheme.whiteColor.withOpacity(0.7),
                              ),
                              SizedBox(height: 16.h),
                              Text(
                                'No Offers Available Right Now',
                                style: textTheme.titleLarge?.copyWith(
                                  color: MyTheme.whiteColor,
                                  fontSize: 18.sp,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                'Check back soon for exciting deals! 🎉',
                                style: textTheme.bodyMedium?.copyWith(
                                  color: MyTheme.whiteColor.withOpacity(0.8),
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      return ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                        itemCount: offers.length,
                        itemBuilder: (context, index) {
                          final offer = offers[index];
                          final displayTitle = offer.title == null || offer.title!.isEmpty
                              ? 'No Title'
                              : offer.title!.length > 25
                                  ? '${offer.title!.substring(0, 25)}...'
                                  : offer.title!;
                          return Container(
                            margin: EdgeInsets.only(bottom: 20.h),
                            decoration: BoxDecoration(
                              color: MyTheme.whiteColor,
                              borderRadius: BorderRadius.circular(20.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.redAccent.withOpacity(0.3),
                                  blurRadius: 12.r,
                                  spreadRadius: 3.r,
                                  offset: Offset(0, 4.h),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // الصورة مع badge
                                Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
                                      child: Image.network(
                                        offer.image ?? '',
                                        width: double.infinity,
                                        height: 220.h,
                                        fit: BoxFit.cover,
                                        loadingBuilder: (context, child, loadingProgress) {
                                          if (loadingProgress == null) return child;
                                          return Container(
                                            width: double.infinity,
                                            height: 220.h,
                                            color: Colors.grey[200],
                                            child: Center(
                                              child: CircularProgressIndicator(
                                                color: MyTheme.orangeColor,
                                                strokeWidth: 3.w,
                                              ),
                                            ),
                                          );
                                        },
                                        errorBuilder: (context, error, stackTrace) {
                                          return Container(
                                            width: double.infinity,
                                            height: 220.h,
                                            color: Colors.grey[200],
                                            child: Icon(
                                              Icons.broken_image,
                                              size: 50.w,
                                              color: Colors.grey[400],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    // Badge للخصم
                                    // Positioned(
                                    //   top: 16.h,
                                    //   left: 16.w,
                                    //   child: Container(
                                    //     padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                                    //     decoration: BoxDecoration(
                                    //       color: Colors.redAccent,
                                    //       borderRadius: BorderRadius.circular(20.r),
                                    //       boxShadow: [
                                    //         BoxShadow(
                                    //           color: Colors.black26,
                                    //           blurRadius: 4.r,
                                    //           offset: Offset(0, 2.h),
                                    //         ),
                                    //       ],
                                    //     ),
                                    //     child: Text(
                                    //       'Save ${index * 10 + 20}%!',
                                    //       style: textTheme.bodyMedium?.copyWith(
                                    //         color: MyTheme.whiteColor,
                                    //         fontSize: 12.sp,
                                    //         fontWeight: FontWeight.bold,
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                    // عداد تنازلي وهمي
                                    Positioned(
                                      top: 16.h,
                                      right: 16.w,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                                        decoration: BoxDecoration(
                                          color: MyTheme.yellowColor,
                                          borderRadius: BorderRadius.circular(20.r),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black26,
                                              blurRadius: 4.r,
                                              offset: Offset(0, 2.h),
                                            ),
                                          ],
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.timer,
                                              color: MyTheme.blackColor,
                                              size: 16.w,
                                            ),
                                            SizedBox(width: 4.w),
                                            Text(
                                              'Ends in 2h 15m',
                                              style: textTheme.bodyMedium?.copyWith(
                                                color: MyTheme.blackColor,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.all(16.w),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // تفاصيل العرض
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              displayTitle,
                                              style: textTheme.titleLarge?.copyWith(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.bold,
                                                color: MyTheme.blackColor,
                                              ),
                                            ),
                                            SizedBox(height: 8.h),
                                            if (offer.price != null)
                                              Row(
                                                children: [
                                                  Text(
                                                    "${offer.price} EGP",
                                                    style: textTheme.bodyLarge?.copyWith(
                                                      color: MyTheme.orangeColor,
                                                      fontSize: 18.sp,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                  SizedBox(width: 12.w),
                                                  Text(
                                                    "${(double.tryParse(offer.price.toString()) ?? 0.0) * 1.3}",
                                                    style: textTheme.bodyMedium?.copyWith(
                                                      color: MyTheme.grayColor2,
                                                      fontSize: 14.sp,
                                                      decoration: TextDecoration.lineThrough,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                          ],
                                        ),
                                      ),
                                      // زرار إضافة للكارت (معلّق حاليًا)
                                      /*
                                      InkWell(
                                        onTap: () {
                                          if (userId == null) {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              const SnackBar(
                                                content: Text('Please log in to add to cart'),
                                              ),
                                            );
                                          } else {
                                            context.read<CartBloc>().add(AddToCartEvent(
                                              productId: offer.id?.toString() ?? '0',
                                              quantity: 1,
                                            ));
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text('$displayTitle added to cart'),
                                                backgroundColor: MyTheme.orangeColor,
                                              ),
                                            );
                                          }
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(8.w),
                                          decoration: BoxDecoration(
                                            color: MyTheme.orangeColor.withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(12.r),
                                          ),
                                          child: Icon(
                                            Icons.add_shopping_cart,
                                            color: MyTheme.orangeColor,
                                            size: 28.w,
                                          ),
                                        ),
                                      ),
                                      */
                                    ],
                                  ),
                                ),
                              ],
                            ),
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
    );
  }
}