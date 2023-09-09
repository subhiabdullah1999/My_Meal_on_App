import 'package:My_Meal_on/controller/home/homecontroller.dart';
import 'package:My_Meal_on/core/constans/appimage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CustomBannerContainer extends StatelessWidget {
  const CustomBannerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return Container(
      clipBehavior: Clip.hardEdge,
      height: 170,
      width: Get.width - 10,
      margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: CarouselSlider.builder(
        itemCount: controller.listSliderOffers.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            Stack(children: [
          controller.listSliderOffers.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Image.network(
                  controller.listSliderOffers[itemIndex].image!,
                  fit: BoxFit.cover,
                  height: 170,
                  width: double.infinity,
                )
        ]),
        options: CarouselOptions(
          height: 170,
          aspectRatio: 16 / 9,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          onPageChanged: (index, resason) {},
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
