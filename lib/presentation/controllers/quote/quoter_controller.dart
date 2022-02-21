import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import 'package:flxtech/generated/l10n.dart';
import 'package:flxtech/core/env/environment.dart';
import 'package:flxtech/data/local/dictionaries.dart';
import 'package:flxtech/data/models/quoter_model.dart';
import 'package:flxtech/core/helpers/pdf/pdf_service.dart';
import 'package:flxtech/core/helpers/pdf/generated_pdf.dart';
import 'package:flxtech/core/helpers/double_to_as_fixed_decimals.dart';

class QuoteController extends ChangeNotifier {

  S _l10n = S.current;
  ///* Quoter
  // clean Quoter All
  void handleCleanQuoter() {
    loadBagOfMinutesQuoteInitial();
    this.subTotalBagOfMinutesQuote = 0.00;
    loadServicesQuoteInitial();
    this.subTotalServicesQuote = 0.00;
    isIPPublic = false;
    loadUseIpPublic(false);
    equipmentToInstallMap = {
      'quantity' : 0,
      'price': 0.00,
      'name': 'Cantidad de equipos a instalar'
    };
    this.equipmentToInstallController = TextEditingController(
      text: '0'
    );
    this.totalPriceQuoter = 0.00;
    notifyListeners();
  }
  //share All
  bool pressedShare = true;
  Future handleShareAllPlatforms() async {
    pressedShare = false;
    notifyListeners();
    await _loadResumenToPdf();
    final pdfFile = await PdfQuoterApi.generate(quoterPdf!);
    await Share.shareFiles([pdfFile.path]);
    pressedShare = true;
    notifyListeners();
  }
  ///Pdf generated
  Quoter? quoterPdf;
  //ToDo: Refactor code
  List<List<dynamic>> tempPDF = [];
  Future _loadResumenToPdf() async {
    quoterPdf = Quoter(
      items: [
        QuoterItem(
          description: _l10n.numberOfTelephoneToBeInstalled,
          price: doubleToAsFixedDecimals(equipmentToInstallMap['price']),
        ),
        QuoterItem(
          description: _l10n.bagOfMinutes,
          price: doubleToAsFixedDecimals(subTotalBagOfMinutesQuote),
        ),
        QuoterItem(
          description: _l10n.server,
          price: doubleToAsFixedDecimals(subTotalServicesQuote),
        ),
        QuoterItem(
          description: _l10n.numberOfTelephoneToBeInstalled,
          price: doubleToAsFixedDecimals(additionalIPMap['price']),
        ),
        QuoterItem(
          description: _l10n.totalPerMonth,
          price: doubleToAsFixedDecimals(totalPriceQuoter - equipmentToInstallMap['price']),
        ),
      ]
    );
  }

  Future handleGeneratedPDF() async {
    await _loadResumenToPdf();
    final pdfFile = await PdfQuoterApi.generate(quoterPdf!);
    PdfService.openFile(pdfFile);
  } 

  ///Actions widgets
  double totalPriceQuoter = 0.00;

  //* Additional
  Map<String, dynamic> additionalIPMap = {
    'quantity' : 0,
    'price': 0.00,
    'name': 'IP pública'
  };
  bool isIPPublic = false;
  void loadUseIpPublic(bool value) {
    isIPPublic = value;
    isIPPublic 
      ? totalPriceQuoter += ADDITIONAL_IP_PUBLIC_PRICE
      : totalPriceQuoter -= ADDITIONAL_IP_PUBLIC_PRICE;
    additionalIPMap['price'] = isIPPublic ? ADDITIONAL_IP_PUBLIC_PRICE : 0.00;
    additionalIPMap['price'] = isIPPublic ? ADDITIONAL_IP_PUBLIC_PRICE : 0.00;
    notifyListeners();
  }

  //toDo: unused
  void loadAdditionalIPQuote(String value) {
    final int intValue = int.parse(value);
    this.additionalIPMap['quantity'] = intValue;
    this.additionalIPMap['price'] = intValue*ADDITIONAL_IP_PUBLIC_PRICE;
    notifyListeners();
  }

  //* Installations
  Map<String, dynamic> equipmentToInstallMap = {
    'quantity' : 0,
    'price': 0.00,
    'name': 'Cantidad de equipos a instalar'
  };
  TextEditingController equipmentToInstallController = TextEditingController(
    text: '0'
  );
  void loadInstallationsQuote(String value) {
    final int intValue = int.parse(value);
    this.equipmentToInstallMap['quantity'] = intValue;
    this.totalPriceQuoter -= this.equipmentToInstallMap['price'];
    this.equipmentToInstallMap['price'] = intValue*EQUIPMENT_TO_INSTALL_PRICE;
    this.totalPriceQuoter += this.equipmentToInstallMap['price'];
    notifyListeners();
  }

  //* Servers
  Map<String, Map<String, dynamic>> servicesQuote = Map();
  double subTotalServicesQuote = 0.00;

  void loadServicesQuoteInitial() {
    if(servicesQuote.isEmpty) servicesQuote.addAll(serverWithFeedMap);
    for (var i = 0; i < servicesQuote.length; i++) {
      final String key = servicesQuote.keys.elementAt(i);
      servicesQuote[key]!['quantity'] = 0;
      servicesQuote[key]!['price'] = 0.00;
    }
  }

  void loadServicesQuote(String key, String value) {
    final int intValue = int.parse(value);
    this.servicesQuote[key]!['quantity'] = intValue;
    this.servicesQuote[key]!['price'] = intValue*servicesQuote[key]!['feed'];
    //sum total
    this.totalPriceQuoter -= this.subTotalServicesQuote;
    this.subTotalServicesQuote = servicesQuote.entries
      .fold(
        0.0, (double previous, next) 
          => (previous + next.value['price'])
      );
    this.totalPriceQuoter += this.subTotalServicesQuote;
    notifyListeners();
  }

  //* Bag of minutes quotes
  Map<String, Map<String, dynamic>> bagOfMinutesQuote = Map();
  double subTotalBagOfMinutesQuote = 0.00;

  void loadBagOfMinutesQuoteInitial() {
    if(bagOfMinutesQuote.isEmpty) bagOfMinutesQuote.addAll(nameWithFeedMap);
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
    this.totalPriceQuoter -= this.subTotalBagOfMinutesQuote;
    //sum total
    this.subTotalBagOfMinutesQuote = bagOfMinutesQuote.entries
      .fold(
        0.0, (double previous, next) 
          => (previous + next.value['price'])
      );
    this.totalPriceQuoter += this.subTotalBagOfMinutesQuote;
    notifyListeners();
  }

  //ui
  bool isHideBagOfMinutes = false;
  void showOrHideBagOfMinutes() {
    isHideBagOfMinutes = !isHideBagOfMinutes;
    notifyListeners();
  }
  bool isHideServers = false;
  void showOrHideServices() {
    isHideServers = !isHideServers;
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
    for (var i = 0; i < ITERATIONS_QUANTITY_FEED; i++) {
      this.quantityFeedMap[i] = i == 0 ? 0 : (i == 1 ? 50 : (i <= 101 ? (i-1)*100 : ((i-101)*1000+10000)));
    }
    // print(this.quantityFeedMap);
  }

}