import 'package:conversor_curso/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import '../components/currency_box.dart';

class HomeView extends StatefulWidget {

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();
  
  late HomeController homeController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController = HomeController(toText: toText, fromText: fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      resizeToAvoidBottomInset: false,
      body:SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: EdgeInsets.only(top: 100, left: 30, right: 30, bottom: 20),
          child: Column(
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 150,
                height: 150,
              ),
              SizedBox(height: 50),
              CurrencyBox(
                selectedItem: homeController.toCurrency,
                items: homeController.currencies,
                onChanged: (model){
                  setState(() {
                    homeController.toCurrency = model!;
                  });
                },
                controller: toText,
              ),
              SizedBox(height: 10),
              CurrencyBox(
                selectedItem: homeController.fromCurrency,
                items: homeController.currencies,
                onChanged: (model){
                  setState(() {
                    homeController.fromCurrency = model!;
                  });
                },
                controller: fromText,
              ),
              SizedBox(height: 50),
              ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.amber)),
                onPressed: (){
                  homeController.convert();
                },
                  child: Text('CONVERTER'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
