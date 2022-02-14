import 'package:flutter/material.dart';
import 'package:flxtech/core/env/environment.dart';
import 'package:flxtech/core/helpers/double_to_as_fixed_decimals.dart';
import 'package:flxtech/data/local/dictionaries.dart';

class QuoteController extends ChangeNotifier {

  //* Quoter
  Map<String, Map<String, dynamic>> localLandlineMap = Map();
  Map<String, Map<String, dynamic>> nationalLandlineMap = Map();
  Map<String, Map<String, dynamic>> ruralLandlineMap = Map();
  Map<String, Map<String, dynamic>> mobileMap = Map();
  Map<String, Map<String, dynamic>> ldi1Map = Map();
  Map<String, Map<String, dynamic>> ldi2Map = Map();
  Map<String, Map<String, dynamic>> ldi3Map = Map();
  Map<String, Map<String, dynamic>> ldi4Map = Map();
  Map<String, Map<String, dynamic>> ldi5Map = Map();
  Map<String, Map<String, dynamic>> ldiSpecialMap = Map();

  //Bag of minutes quotes
  Map<String, Map<String, dynamic>> bagOfMinutesQuote = Map();

  void loadBagOfMinutesQuoteInitial() {
    bagOfMinutesQuote.addAll(nameWithFeedMap);
    for (var i = 0; i < bagOfMinutesQuote.length; i++) {
      final String key = bagOfMinutesQuote.keys.elementAt(i);
      bagOfMinutesQuote[key]!['quantity'] = 0;
    }
  }

  void loadBagOfMinutesQuote(String key, String value) {
    // final String key = 'local_landline';
    final int intValue = int.parse(value);
    for (var i = 0; i < ITERATIONS_RANGE_FEED; i++) {
      if (this.rangeFeedMap[i]!['min'] <= intValue && intValue <= this.rangeFeedMap[i]!['max']) {
        this.bagOfMinutesQuote[key]!['quantity'] = intValue;
        this.bagOfMinutesQuote[key]!['price'] = rangeFeedMap[i]!['value_percentage']*bagOfMinutesQuote[key]!['feed'];
      }  
        // bagOfMinutesQuote[key] = {
          // 'name': nameWithFeedMap[key]!['name'],
        //   'quantity': intValue,
        //   'price': rangeFeedMap[i]!['value_percentage']*nameWithFeedMap[key]!['feed']
    }
    print('bagOfMinutesQuote');
    print(bagOfMinutesQuote);
    notifyListeners();
  }

  
  //* Helpers
  Map<int, Map<String, dynamic>> rangeFeedMap = Map();
  Map<int, int> quantityFeedMap = Map();

  void loadRangeFeedMap() {
    // 300	700	1000	2000	3000	4000	5000 6000	7000 8000	9000 10000
    //discount and value in percentage %
    for (var i = 0; i < ITERATIONS_RANGE_FEED; i++) {
      this.rangeFeedMap[i] = {
        'max': i == 0 ? 300 : ( i == 1 ? 700 : (i-1)*1000),
        'min': i == 0 ? 0 : (rangeFeedMap[i-1]!['max']+1),
        'discount_percentage': percentageDiscountMap['$i']!,
        'value_percentage': doubleToAsFixedDecimals((1.00 - percentageDiscountMap['$i']!))
      };
    }
    // print(this.rangeFeedMap);
  }

  void loadQuantityFeedMap() {
    // 0 50 100	200	300 ... 10000	11000	12000	13000	14000 15000	... 50000
    // 1 + 1 + 100 + 40 = 142 iterations
    for (var i = 0; i < ITERATIONS_QUANITY_FEED; i++) {
      this.quantityFeedMap[i] = i == 0 ? 0 : (i == 1 ? 50 : (i <= 101 ? (i-1)*100 : ((i-101)*1000+10000)));
    }
    // print(this.quantityFeedMap);
  }

}