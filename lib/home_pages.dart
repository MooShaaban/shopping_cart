
import 'package:add_to_cart_with_provider/my_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePages extends StatefulWidget {


  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  @override
  Widget build(BuildContext context) {



    List<Widget> currentPage = [
      page1(context, Provider.of<MyProvider>(context,).x),
      page2(context, Provider.of<MyProvider>(context,).x),
    ];

    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
            itemCount: currentPage.length,
            itemBuilder: (_, index){
          return currentPage[index];
        })
      ),
    );
  }

  Widget page1 (context, x){
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        // color: Colors.white,
        height: double.infinity,
        width: double.infinity,

        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.shopping_cart_outlined,size: 35.0),
                Spacer(),
                Text(
                  'Shopping Cart',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                ),

              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: double.infinity,
                height: 3,
                color: Colors.grey,
              ),
            ),  //line
            SizedBox(height: 200.0,),
            Row(
              children: [
                Text(
                  x.toString(),
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Spacer(),
                Text(
                  'Total',
                  style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold
                  ),
                ),

              ],
            ),
            SizedBox(height: 50.0,),
            Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(7.0),
                border: Border.all(color: Colors.black),
              ),

              child: IconButton(
                  icon: Icon(Icons.add,)
                  ,onPressed: (){
                if(Provider.of<MyProvider>(context, listen: false).x==5){
                  final snackBar = SnackBar(
                      backgroundColor: Colors.black,
                      duration: Duration(milliseconds: 500),
                      padding: EdgeInsets.all(10.0),
                      content: Text(
                        textAlign: TextAlign.center,
                        "can\'t go more than 5",
                        style: TextStyle(
                          fontSize: 25.0,
                        ),

                      ));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
                else{
                  Provider.of<MyProvider>(context, listen: false).incrementX();
                  print(Provider.of<MyProvider>(context, listen: false).x.toString());
                }


              }
              ),
            ),
            SizedBox(height: 30.0,),
            Container(
              height: 50.0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadiusDirectional.circular(10.0),
              ),


              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Text(
                      'Slide For Next Page',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.skip_next,color: Colors.white,)
                  ],
                ),
              ),
            )
          ],

        ),

      ),
    );
  }

  Widget page2 (context, x){
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        // color: Colors.white,
        height: double.infinity,
        width: double.infinity,

        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.shopping_cart_outlined,size: 35.0),
                Spacer(),
                Text(
                  'Shopping Cart',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),
                ),

              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: double.infinity,
                height: 3,
                color: Colors.grey,
              ),
            ),  //line
            SizedBox(height: 200.0,),
            Row(
              children: [
                Text(
                  x.toString(),
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Spacer(),
                Text(
                  'Total',
                  style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold
                  ),
                ),

              ],
            ),
            SizedBox(height: 50.0,),
            Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(7.0),
                border: Border.all(color: Colors.black),
              ),

              child: IconButton(
                  icon: Icon(Icons.remove,)
                  ,onPressed: (){
                    if(Provider.of<MyProvider>(context, listen: false).x==0){
                      final snackBar = SnackBar(
                        backgroundColor: Colors.black,
                          duration: Duration(milliseconds: 500),
                          padding: EdgeInsets.all(10.0),
                          content: Text(
                            "can\'t be less than zero",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25.0,
                            ),

                          ));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                    else{
                      Provider.of<MyProvider>(context, listen: false).decrementX();
                      print(Provider.of<MyProvider>(context, listen: false).x.toString());
                    }


              }
              ),
            ),
            SizedBox(height: 30.0,),
            Container(
              height: 50.0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadiusDirectional.circular(10.0),
              ),

              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Icon(Icons.skip_previous,color: Colors.white,),
                    Spacer(),
                    Text(
                      'Slide For Previous Page',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],

        ),

      ),
    );
  }
}
