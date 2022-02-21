import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:flxtech/data/models/quoter_model.dart';
import 'package:flxtech/core/env/environment.dart';
import 'package:flxtech/core/helpers/pdf/pdf_service.dart';

class PdfQuoterApi {

  static Future<File> generate(Quoter quoter) async {
    final pdf = Document();

    pdf.addPage(MultiPage(
      build: (context) => [
        SizedBox(height: 3 * PdfPageFormat.cm),
        buildTitle(quoter),
        buildQuoter(quoter, isMonthlyRent: false),
        buildQuoter(quoter),
        buildMonthlyRent(quoter.items.last),
      ],
    ));
    return PdfService.saveDocument(name: 'COTIZACION_FIBERLUX.pdf', pdf: pdf);
  }

  static Widget buildTitle(Quoter quoter) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cotización',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 0.8 * PdfPageFormat.cm),
        ],
      );

  static Widget buildQuoter(Quoter quoter, {bool isMonthlyRent = true}) {
    final headers = !isMonthlyRent
      ? [
          'Pago único de instalación',
          CURRENCY_TYPE
        ]
      : [
          'Pago recurrente / Renta Mensual',
          CURRENCY_TYPE
        ];
    List<List<dynamic>> dataQuoter = [];
    if (!isMonthlyRent)
      dataQuoter.add([
        quoter.items.first.description,
        quoter.items.first.price,
      ]);
    else 
      for (var i = 1; i < quoter.items.length-1; i++) {
        dataQuoter.add([
          quoter.items[i].description,
          quoter.items[i].price,
        ]);
      }
    return Table.fromTextArray(
      headers: headers,
      data: dataQuoter,
      headerCount: 1,
      border: const TableBorder(
        bottom: BorderSide(),
        horizontalInside: BorderSide(),
        top: BorderSide(),
        left: BorderSide(),
        right: BorderSide(),
      ),
      headerStyle: TextStyle(fontWeight: FontWeight.bold),
      headerDecoration: BoxDecoration(color: PdfColors.grey300),
      cellHeight: 30,
      headerAlignment: Alignment.center,
      headerAlignments: {
        0: Alignment.center
      },
      cellAlignments: {
        0: Alignment.centerLeft,
        1: Alignment.centerRight,
      },
    );
  }

  static Widget buildMonthlyRent(QuoterItem totalMonthlyRent) {
    return Table.fromTextArray(
      headers: [
        totalMonthlyRent.description,
        '$CURRENCY_TYPE ${totalMonthlyRent.price}',
      ],
      data: [],
      headerCount: 1,
      border: TableBorder.all(),
      headerStyle: TextStyle(fontWeight: FontWeight.bold),
      headerDecoration: BoxDecoration(color: PdfColors.grey300),
      cellHeight: 30,
      headerAlignment: Alignment.center,
      headerAlignments: {
        0: Alignment.center
      },
    );
  }

  static buildSimpleText({
    required String title,
    required String value,
  }) {
    final style = TextStyle(fontWeight: FontWeight.bold);

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: pw.CrossAxisAlignment.end,
      children: [
        Text(title, style: style),
        SizedBox(width: 2 * PdfPageFormat.mm),
        Text(value),
      ],
    );
  }

  static buildText({
    required String title,
    required String value,
    double width = double.infinity,
    TextStyle? titleStyle,
    bool unite = false,
  }) => Container(
      width: width,
      child: Row(
        children: [
          Expanded(child: Text(title, style: TextStyle(fontWeight: FontWeight.bold))),
          Text(value, style: unite ? TextStyle(fontWeight: FontWeight.bold) : null),
        ],
      ),
    );
}