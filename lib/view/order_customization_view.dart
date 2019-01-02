import 'package:flutter/material.dart';

import 'package:makerthon2018/app_navigator.dart';
import 'package:makerthon2018/model/menu.dart';
import 'package:makerthon2018/model/order.dart';
import 'package:makerthon2018/view/customization_menu_widget.dart';

class OrderCustomizationView extends StatefulWidget {

  final Order _order;
  
  OrderCustomizationView(this._order);

  @override
  State<StatefulWidget> createState() => _OrderCustomizationViewState(_order);

}

class _OrderCustomizationViewState extends State<OrderCustomizationView> {

  final Order _order;

  CustomizationMenuWidget temperatureWidget = CustomizationMenuWidget(TEMP);
  CustomizationMenuWidget sweetnessWidget = CustomizationMenuWidget(SWEETNESS);
  CustomizationMenuWidget thicknessWidget = CustomizationMenuWidget(THICKNESS);

  _OrderCustomizationViewState(this._order);

  Order get assembledOrder => _order
    .withModifiers(
      [
        temperatureWidget.modifier, 
        sweetnessWidget.modifier, 
        thicknessWidget.modifier
      ]
    );

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double screenWidth = mediaQuery.size.width;
    double screenHeight = mediaQuery.size.height;

    var mainImage = Image.asset(
      _order.image,
      height: screenHeight,
      fit: BoxFit.fitHeight,
    );

    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.black87,
        title: new Text('Drinks Menu'),
        centerTitle: true,
      ),

      body: Center(
        child: Container(
          color: Color.fromRGBO(20, 20, 20, 1),
          height: screenHeight,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: ListView(
                  children: <Widget>[
                    Container(color: Color.fromRGBO(120, 120, 120, 1), height: 5),

                    Container(
                      height: 100,
                      alignment: Alignment.center,
                      child: Text("Options",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                        ),
                      )
                    ),

                    Container(color: Color.fromRGBO(120, 120, 120, 1), height: 5),

                    Container(
                      padding: EdgeInsets.all(20),
                      child: Container(child: temperatureWidget, height: 200)
                    ),

                    Container(color: Color.fromRGBO(120, 120, 120, 1), height: 5),

                    Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 80,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                            child: Text("Sugar Level",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                              ),
                            )
                          ),
                          Container(child: sweetnessWidget, height: 400),
                        ],
                      ),
                    ),

                    Container(color: Color.fromRGBO(120, 120, 120, 1), height: 5),

                    Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 80,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                            child: Text("Intensity",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                              ),
                            )
                          ),
                          Container(child: thicknessWidget, height: 300),
                        ],
                      ),
                    ),

                    Container(color: Color.fromRGBO(120, 120, 120, 1), height: 5),

                    Container(
                      color: Colors.orange,
                      height: 100,
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () => AppNavigator.of(context).submitOrder(assembledOrder),
                        child: Text("Convert to Sign Language",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                          ),
                        )
                      ),
                    )
                  ]
                ),
                width: screenWidth/2 - 4,
              ),
              Container(
                width: screenWidth/2 - 4,
                child: mainImage
              ),
            ]
          )
        ),
      ),
    );
  }
}