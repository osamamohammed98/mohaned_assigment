import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderPageView extends StatelessWidget {
  const SliderPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Slider"),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 60,),
         const Center(child: Text("Slider : 1")),
          const SizedBox(height: 60,),
          buildCarouselSlider(),
          const SizedBox(height: 60,),
          const Center(child: Text("Slider : 2")),
          const SizedBox(height: 60,),
          buildCarouselSlider(),
        ],
      ),

    );
  }

  CarouselSlider buildCarouselSlider() {
    return CarouselSlider(
          items: [

            //1st Image of Slider
            Container(
              margin: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/1920px-Image_created_with_a_mobile_phone.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            //2nd Image of Slider
            Container(
              margin: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: NetworkImage("https://image.shutterstock.com/image-vector/photo-graphic-editor-on-computer-600w-1432421069.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],

          //Slider Container properties
          options: CarouselOptions(
            height: 180.0,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            viewportFraction: 0.8,
          ),
        );
  }
}
