import 'package:flutter/material.dart';
import 'components/coffee_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedItem = 'All products';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(
                  20.0,
                ),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25, right: 10),
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.green[900]),
                      child: Icon(
                        Icons.shopping_basket,
                        color: Colors.white,
                        size: 23,
                      ),
                    ),
                    Positioned(
                      top: 25,
                      right: 40,
                      child: Container(
                        height: 20,
                        width: 20.0,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            '8',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: 50,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Starbucks Coffee',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  _buildItem('All products', 59),
                  _buildItem('Espresso', 17),
                  _buildItem('Iced Tea', 20),
                  _buildItem(' Frappuccino', 8),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              height: 420,
              child: Container(
                height: MediaQuery.of(context).size.height - 300.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    BuildCoffeeItem(
                        imgPath: 'assets/images/600.jpg',
                        productName: 'Caramel Macchiato',
                        productType: 'Espresso',
                        price: '2.99'),
                    BuildCoffeeItem(
                        imgPath: 'assets/images/602.png',
                        productName: 'Honey Turmeric Latte',
                        productType: 'Latte',
                        price: '2.99'),
                    BuildCoffeeItem(
                        imgPath: 'assets/images/605.jpg',
                        productName: 'Caramel Frappuccino®',
                        productType: 'Coffee Frappuccino',
                        price: '2.99'),
                    BuildCoffeeItem(
                        imgPath: 'assets/images/606.jpg',
                        productName: 'Iced Shaken Black Tea',
                        productType: 'Iced Tea',
                        price: '2.99'),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildItem(String productName, int count) {
    return Padding(
      padding: EdgeInsets.only(bottom: 18, left: 15, top: 5),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
        height: 50,
        width: 125,
        decoration: BoxDecoration(
            color: switchHighlight(productName),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  blurRadius: 10,
                  color: switchShadow(productName),
                  offset: Offset(0, 8)),
            ]),
        child: InkWell(
          onTap: () {
            selectedProduct(productName);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  count.toString(),
                  style: TextStyle(
                      color: switchHighlightColor(productName),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 5),
                child: Text(
                  productName,
                  style: TextStyle(
                    color: switchHighlightColor(productName),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  selectedProduct(prodName) {
    setState(() {
      selectedItem = prodName;
    });
  }

  switchHighlight(prodName) {
    if (prodName == selectedItem) {
      return Color(0xFF116D15);
    } else {
      return Colors.grey.withOpacity(0.3);
    }
  }

  switchHighlightColor(prodName) {
    if (prodName == selectedItem) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  switchShadow(prodName) {
    if (prodName == selectedItem) {
      return Color(0xFF116D15).withOpacity(.5);
    } else {
      return Colors.transparent;
    }
  }
}
