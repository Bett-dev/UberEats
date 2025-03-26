import 'package:flutter/material.dart';
import 'package:urban_eats/constants/const.dart';
import 'package:urban_eats/models/category.dart';
import 'package:urban_eats/models/products.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String category = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Your Location',
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.keyboard_arrow_down,
                            size: 20,
                            color: kBlack,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_pin, size: 20, color: kOrange),
                          SizedBox(width: 5),
                          Text(
                            'Nairobi, Kenya',
                            style: TextStyle(
                              color: kBlack,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.search, color: Colors.black),
                      ),
                      SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 35),
                child: Text(
                  'Let\'s find the best food around you',
                  style: TextStyle(
                    color: kBlack,
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Find by Category',
                    style: TextStyle(
                      color: kBlack,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(
                      color: kYellow,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                      myCategories.length,
                      (int index) => SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                category = myCategories[index].name;
                              });
                            },
                            child: Container(
                              height: 120,
                              width: 85,

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border:
                                    category == myCategories[index].name
                                        ? Border.all(width: 2.5, color: kOrange)
                                        : Border.all(color: Colors.white),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: kBlack.withAlpha(70),
                                          offset: const Offset(0, 6),
                                          blurRadius: 12,
                                          spreadRadius: 3,
                                        ),
                                      ],
                                    ),
                                    height: 47,
                                    width: 50,
                                    child: Image.asset(
                                      myCategories[index].image,
                                      width: 50,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  SizedBox(height: 20.0),
                                  Text(
                                    myCategories[index].name,
                                    style: TextStyle(
                                      color: kBlack,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Results (20)',
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 270,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: myProductModel.length,
                  itemBuilder:
                      (context, index) => Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Container(
                          height: 170,
                          width: 160,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      myProductModel[index].image,
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),

                              SizedBox(height: 10),
                              Text(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                myProductModel[index].name,
                                style: TextStyle(
                                  color: kBlack,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: 20,
                                        color: kYellow,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        myProductModel[index].rate
                                            .toStringAsFixed(1)
                                            .toString(),
                                        style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_pin,
                                        size: 20,
                                        color: kOrange,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        '${myProductModel[index].distance.toInt().toString()} m',
                                        style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '\$${myProductModel[index].price}',
                                      style: TextStyle(
                                        color: kBlack,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.black,

                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Icon(
                                        Icons.shopping_cart_outlined,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
