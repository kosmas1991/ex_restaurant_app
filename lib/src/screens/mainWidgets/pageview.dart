import 'package:flutter/material.dart';

class ThePageViewWidget extends StatelessWidget {
  final bannerItems = ["Burger","HotDog","Pasta","Pizza"];
  final bannerImages = ["assets/images/burger.jpeg","assets/images/hotdog.jpg","assets/images/pasta.jpg","assets/images/pizza.jpg"];

  @override
  Widget build(BuildContext context) {
    //var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    PageController pageController = PageController(initialPage: 1,viewportFraction: 0.8);
    List<Widget> banners = <Widget>[];
    for(int i=0;i<bannerImages.length;i++){
      var bannerView = Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(   /////// the shadow before the image
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      offset: Offset(2.0,2.0),
                      blurRadius: 5.0,
                      spreadRadius: 1.0
                    )
                  ],
                  )
                ),
              ClipRRect(borderRadius: BorderRadius.all(Radius.circular(20.0)),   ////////  the image
                  child: Image.asset(bannerImages[i], fit: BoxFit.cover,)),
              Container(    //////the black tint after the image
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0)),
                gradient: LinearGradient(colors: [Colors.transparent,Colors.black],begin: Alignment.topCenter,end: Alignment.bottomCenter)
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(mainAxisAlignment: MainAxisAlignment.end,               /////the text column
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 6.0,bottom: 3.0),
                      child: Text(bannerItems[i],style: TextStyle(fontSize: 25,color: Colors.white),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:8.0, bottom: 3.0),
                      child: Text('More than 40% off',style: TextStyle(fontSize: 12,color: Colors.white),),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
      banners.add(bannerView);
    }
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        //color: Colors.redAccent,
        height: width*9/16,
        width: width,
        child: PageView(
          controller: pageController,
          scrollDirection: Axis.horizontal,
          children: banners,
        ),
      ),
    );
  }
}
