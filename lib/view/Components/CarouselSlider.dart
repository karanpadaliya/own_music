import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:own_music/controller/SliderController.dart';
import 'package:own_music/view/Pages/SongPlayPages/SongPage.dart';

class CarouselSliderPage extends StatefulWidget {
  CarouselSliderPage({super.key});

  @override
  State<CarouselSliderPage> createState() => _CarouselSliderPageState();
}

class _CarouselSliderPageState extends State<CarouselSliderPage> {
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SongPage(
                            imageUrl: sliderList[currentIndex]["image"],
                            name: sliderList[currentIndex]["name"],
                          ),
                        ),
                      );
                    },
                    child: CarouselSlider(
                      items: sliderList
                          .map((item) => Image.network(
                        item["image"],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ))
                          .toList(),
                      carouselController: carouselController,
                      options: CarouselOptions(
                        scrollPhysics: BouncingScrollPhysics(),
                        aspectRatio: 2,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        viewportFraction: 0.8,
                        enableInfiniteScroll: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    top: 180,
                    left: 150,
                    child: Row(
                      children: List.generate(
                        sliderList.length,
                            (index) {
                          bool isSelect = currentIndex == index;
                          return Container(
                            height: isSelect ? 13 : 10,
                            width: isSelect ? 30 : 10,
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: isSelect ? Color(0xff004aad) : Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}