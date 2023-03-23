import 'package:conversor_curso/app/controllers/home_controller.dart';
import 'package:conversor_curso/app/models/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

main(){
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();
  final homeController = HomeController(toText: toText, fromText: fromText);

  test('Deve converter de Real para Dolar com virgula',  (){
    toText.text = '2,0';
    homeController.convert();
    expect(fromText.text, '0.36');
  });

  test('Deve converter de Real para Dolar com ponto',  (){
    toText.text = '2.0';
    homeController.convert();
    expect(fromText.text, '0.36');
  });

  test('Deve converter de Dolar para Real',  (){
    toText.text = '1.0';
    homeController.toCurrency = CurrencyModel(
        name: 'Dolar',  real: 5.65, dolar: 1.0, euro: 0.85, bitcoin: 0.000088);

    homeController.fromCurrency = CurrencyModel(
        name: 'Real',  real: 1.0, dolar: 0.18, euro: 0.15, bitcoin: 0.000016);

    homeController.convert();
    expect(fromText.text, '5.65');

  });

  test('Deve converter de Real para Euro',  (){
    toText.text = '1.0';
    homeController.toCurrency = CurrencyModel(
        name: 'Real',  real: 1.0, dolar: 0.18, euro: 0.15, bitcoin: 0.000016);

    homeController.fromCurrency = CurrencyModel(
        name: 'Euro',  real: 6.62, dolar: 1.17, euro: 1.0, bitcoin: 0.000010);

    homeController.convert();
    expect(fromText.text, '0.15');

  });

  test('Deve converter de Euro para Real',  (){
    toText.text = '2.0';

    homeController.toCurrency = CurrencyModel(
        name: 'Euro',  real: 6.62, dolar: 1.17, euro: 1.0, bitcoin: 0.000010);

    homeController.fromCurrency = CurrencyModel(
        name: 'Real',  real: 1.0, dolar: 0.18, euro: 0.15, bitcoin: 0.000016);

    homeController.convert();
    expect(fromText.text, '13.24');

  });

  test('Deve converter de Bitcoin para Real',  (){
    toText.text = '3.0';

    homeController.toCurrency = CurrencyModel(
        name: 'Bitcoin',  real: 64116.51, dolar: 11351.30, euro: 9689.54, bitcoin: 1);

    homeController.fromCurrency = CurrencyModel(
        name: 'Real',  real: 1.0, dolar: 0.18, euro: 0.15, bitcoin: 0.000016);

    homeController.convert();
    expect(fromText.text, '192349.53');

  });

  test('Deve converter de Real para Bitcoin',  (){
    toText.text = '10000.0';

    homeController.toCurrency = CurrencyModel(
        name: 'Real',  real: 1.0, dolar: 0.18, euro: 0.15, bitcoin: 0.000016);

    homeController.fromCurrency = CurrencyModel(
        name: 'Bitcoin',  real: 64116.51, dolar: 11351.30, euro: 9689.54, bitcoin: 1);

    homeController.convert();
    expect(fromText.text, '0.16');

  });

}