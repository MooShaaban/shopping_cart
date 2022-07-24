import 'package:flutter/cupertino.dart';

class MyProvider extends ChangeNotifier{
   int x = 0;

  void incrementX(){
    x++;
    print(x.toString());
    notifyListeners();
  }

  void decrementX(){
    x--;
    print(x.toString());
    notifyListeners();
  }

}