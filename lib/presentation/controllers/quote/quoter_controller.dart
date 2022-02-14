import 'package:flutter/material.dart';

import 'package:flxtech/core/env/environment.dart';
import 'package:flxtech/core/helpers/double_to_as_fixed_decimals.dart';
import 'package:flxtech/data/local/dictionaries.dart';

class QuoteController extends ChangeNotifier {

  //* Quoter

  //Bag of minutes quotes
  Map<String, Map<String, dynamic>> bagOfMinutesQuote = Map();

  void loadBagOfMinutesQuoteInitial() {
    bagOfMinutesQuote.addAll(nameWithFeedMap);
    for (var i = 0; i < bagOfMinutesQuote.length; i++) {
      final String key = bagOfMinutesQuote.keys.elementAt(i);
      bagOfMinutesQuote[key]!['quantity'] = 0;
      bagOfMinutesQuote[key]!['price'] = 0.00;
    }
  }

  void loadBagOfMinutesQuote(String key, String value) {
    final int intValue = int.parse(value);
    this.bagOfMinutesQuote[key]!['quantity'] = intValue;
    for (var i = 0; i < ITERATIONS_RANGE_FEED; i++) {
      if (this.rangeFeedMap[i]!['min'] <= intValue && intValue <= this.rangeFeedMap[i]!['max']) {
        this.bagOfMinutesQuote[key]!['feed_price'] = rangeFeedMap[i]!['value_percentage']*bagOfMinutesQuote[key]!['feed'];
        this.bagOfMinutesQuote[key]!['price'] = intValue*bagOfMinutesQuote[key]!['feed_price'];
      } else if (intValue > this.rangeFeedMap[this.rangeFeedMap.keys.last]!['max']) {
        this.bagOfMinutesQuote[key]!['feed_price'] = MAX_DISCOUNT_RANGE_VALUE*bagOfMinutesQuote[key]!['feed'];
        this.bagOfMinutesQuote[key]!['price'] = intValue*bagOfMinutesQuote[key]!['feed_price'];
      }
    }
    notifyListeners();
  }

  //ui
  bool isHideBagOfMinutes = false;
  void showOrHideBagOfMinutes() {
    isHideBagOfMinutes = !isHideBagOfMinutes;
    notifyListeners();
  }

  
  //* Helpers
  Map<int, Map<String, dynamic>> rangeFeedMap = Map();
  Map<int, int> quantityFeedMap = Map();

  void loadRangeFeedMap() {
    // 300	700	1000	2000	3000	4000	5000 6000	7000 8000	9000 10000
    // 10000 to 50000 use 20% discount
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