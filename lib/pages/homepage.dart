import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _search = TextEditingController();
  // List<String> _sliderImages = [];

  // fetchSliderImages() async {
  //   FirebaseFirestore _firebaseInstance = FirebaseFirestore.instance;
  //   QuerySnapshot qn = await _firebaseInstance.collection('slider').get();

  //   for (int i = 0; i < qn.docs.length; i++) {
  //     setState(() {
  //       _sliderImages.add(qn.docs[i]['img-path']);
  //     });
  //     return qn.docs;
  //   }
  // }
  List<String> _carouselImages = [];
  List _products = [];

  var _dotPosition = 0;
  fetchProduct() async {
    var _firebaseInstance = FirebaseFirestore.instance;
    QuerySnapshot qn = await _firebaseInstance.collection("products").get();

    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        _products.add([
          {
            "name": qn.docs[i]['pname'],
            "pprice": qn.docs[i]['price'],
            "pdes": qn.docs[i]['des'],
            "pimg": qn.docs[i]['img'],
          }
        ]);
      }
    });

    return qn.docs;
  }

  fetchSlider() async {
    var _firebaseInstance = FirebaseFirestore.instance;
    QuerySnapshot qn = await _firebaseInstance.collection("slider").get();

    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        _carouselImages.add(qn.docs[i]['img-path']);
      }
    });

    return qn.docs;
  }

  void initState() {
    fetchProduct();
    fetchSlider();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("E-shop"),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 10, left: 10.0, right: 10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50.h,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintText: "Enter you mail",
                              hintStyle: TextStyle(fontSize: 15),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0)),
                                  borderSide: BorderSide(
                                    color: Colors.blue,
                                  )),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0)),
                                  borderSide: BorderSide(color: Colors.grey))),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.deepOrange,
                      height: 50.h,
                      width: 50.w,
                      child: const Icon(Icons.search, color: Colors.white),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              AspectRatio(
                aspectRatio: 3.5,
                child: CarouselSlider(
                  items: _carouselImages
                      .map((i) => Container(
                            padding: EdgeInsets.only(left: 3, right: 3),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(i), fit: BoxFit.cover)),
                          ))
                      .toList(),
                  options: CarouselOptions(
                      autoPlay: false,
                      enlargeCenterPage: true,
                      viewportFraction: 0.8,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      height: 300.0,
                      onPageChanged: (val, carouselPageChangeRReason) {
                        setState(() {
                          _dotPosition = val;
                        });
                      }),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              DotsIndicator(
                dotsCount:
                    _carouselImages.length == 0 ? 1 : _carouselImages.length,
                position: _dotPosition.toDouble(),
                decorator: const DotsDecorator(
                  color: Colors.red,
                  activeColor: Colors.deepOrange,
                  spacing: EdgeInsets.all(3.0),
                  activeSize: Size(12, 12),
                  size: Size(8, 8),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("All Products", style: TextStyle(fontSize: 16)),
                  Text("View All", style: TextStyle(fontSize: 16))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 160,
                child: Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: _products.length,
                        itemBuilder: (_, index) {
                          return Card(
                              elevation: 4,
                              child: Container(
                                height: 100,
                                width: 140,
                                child: Column(
                                  children: [
                                    Image.network(_products[index][0]["pimg"]),
                                  ],
                                ),
                              ));
                        })),
              )
            ],
          ),
        ));
  }
}
