// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Campo requerido`
  String get required {
    return Intl.message(
      'Campo requerido',
      name: 'required',
      desc: '',
      args: [],
    );
  }

  /// `Correo`
  String get email {
    return Intl.message(
      'Correo',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Contraseña`
  String get password {
    return Intl.message(
      'Contraseña',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get signIn {
    return Intl.message(
      'Login',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Necesita una cuenta?`
  String get needAnAccount {
    return Intl.message(
      'Necesita una cuenta?',
      name: 'needAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUp {
    return Intl.message(
      'Sign up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Mi Cotizador`
  String get myQuoter {
    return Intl.message(
      'Mi Cotizador',
      name: 'myQuoter',
      desc: '',
      args: [],
    );
  }

  /// `Cotizar`
  String get quote {
    return Intl.message(
      'Cotizar',
      name: 'quote',
      desc: '',
      args: [],
    );
  }

  /// `Servicios`
  String get services {
    return Intl.message(
      'Servicios',
      name: 'services',
      desc: '',
      args: [],
    );
  }

  /// `Adicionales`
  String get additional {
    return Intl.message(
      'Adicionales',
      name: 'additional',
      desc: '',
      args: [],
    );
  }

  /// `Servidor`
  String get server {
    return Intl.message(
      'Servidor',
      name: 'server',
      desc: '',
      args: [],
    );
  }

  /// `Internet`
  String get internet {
    return Intl.message(
      'Internet',
      name: 'internet',
      desc: '',
      args: [],
    );
  }

  /// `Consumo`
  String get consumption {
    return Intl.message(
      'Consumo',
      name: 'consumption',
      desc: '',
      args: [],
    );
  }

  /// `Tarifas`
  String get rates {
    return Intl.message(
      'Tarifas',
      name: 'rates',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Precio`
  String get price {
    return Intl.message(
      'Precio',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Sub Total`
  String get subTotal {
    return Intl.message(
      'Sub Total',
      name: 'subTotal',
      desc: '',
      args: [],
    );
  }

  /// `Instalaciones`
  String get installations {
    return Intl.message(
      'Instalaciones',
      name: 'installations',
      desc: '',
      args: [],
    );
  }

  /// `Bolsa de Minutos`
  String get bagOfMinutes {
    return Intl.message(
      'Bolsa de Minutos',
      name: 'bagOfMinutes',
      desc: '',
      args: [],
    );
  }

  /// `Fijo Local`
  String get localLandline {
    return Intl.message(
      'Fijo Local',
      name: 'localLandline',
      desc: '',
      args: [],
    );
  }

  /// `Fijo Nacional`
  String get nationalLandline {
    return Intl.message(
      'Fijo Nacional',
      name: 'nationalLandline',
      desc: '',
      args: [],
    );
  }

  /// `Fijo Rural`
  String get ruralLandline {
    return Intl.message(
      'Fijo Rural',
      name: 'ruralLandline',
      desc: '',
      args: [],
    );
  }

  /// `Móviles`
  String get mobiles {
    return Intl.message(
      'Móviles',
      name: 'mobiles',
      desc: '',
      args: [],
    );
  }

  /// `LDi1`
  String get ldi1 {
    return Intl.message(
      'LDi1',
      name: 'ldi1',
      desc: '',
      args: [],
    );
  }

  /// `LDi2`
  String get ldi2 {
    return Intl.message(
      'LDi2',
      name: 'ldi2',
      desc: '',
      args: [],
    );
  }

  /// `LDi3`
  String get ldi3 {
    return Intl.message(
      'LDi3',
      name: 'ldi3',
      desc: '',
      args: [],
    );
  }

  /// `LDi4`
  String get ldi4 {
    return Intl.message(
      'LDi4',
      name: 'ldi4',
      desc: '',
      args: [],
    );
  }

  /// `LDi5`
  String get ldi5 {
    return Intl.message(
      'LDi5',
      name: 'ldi5',
      desc: '',
      args: [],
    );
  }

  /// `LDi Especial`
  String get ldiSpecial {
    return Intl.message(
      'LDi Especial',
      name: 'ldiSpecial',
      desc: '',
      args: [],
    );
  }

  /// `Destino`
  String get destination {
    return Intl.message(
      'Destino',
      name: 'destination',
      desc: '',
      args: [],
    );
  }

  /// `Cantidad`
  String get quantity {
    return Intl.message(
      'Cantidad',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `Pago único de instalación`
  String get oneTimeInstallationPayment {
    return Intl.message(
      'Pago único de instalación',
      name: 'oneTimeInstallationPayment',
      desc: '',
      args: [],
    );
  }

  /// `Cantidad de equipos telefónicos a instalar:`
  String get numberOfTelephoneToBeInstalled {
    return Intl.message(
      'Cantidad de equipos telefónicos a instalar:',
      name: 'numberOfTelephoneToBeInstalled',
      desc: '',
      args: [],
    );
  }

  /// `Pago Recurrente / Renta Mensual`
  String get recurringPaymentOrMonthlyRent {
    return Intl.message(
      'Pago Recurrente / Renta Mensual',
      name: 'recurringPaymentOrMonthlyRent',
      desc: '',
      args: [],
    );
  }

  /// `Precio por servidor`
  String get pricePerServer {
    return Intl.message(
      'Precio por servidor',
      name: 'pricePerServer',
      desc: '',
      args: [],
    );
  }

  /// `Cantidad de números para portabilidad`
  String get quantityOfNumbersForPortability {
    return Intl.message(
      'Cantidad de números para portabilidad',
      name: 'quantityOfNumbersForPortability',
      desc: '',
      args: [],
    );
  }

  /// `Cantidad de números nuevos`
  String get quantityOfNewNumbers {
    return Intl.message(
      'Cantidad de números nuevos',
      name: 'quantityOfNewNumbers',
      desc: '',
      args: [],
    );
  }

  /// `Cantidad de anexos`
  String get numberOfAnnexes {
    return Intl.message(
      'Cantidad de anexos',
      name: 'numberOfAnnexes',
      desc: '',
      args: [],
    );
  }

  /// `Cantidad de canales adicionales`
  String get numberOfAdditionalChannels {
    return Intl.message(
      'Cantidad de canales adicionales',
      name: 'numberOfAdditionalChannels',
      desc: '',
      args: [],
    );
  }

  /// `Cantidad de equipos a instalar`
  String get numberOfEquipmentToInstall {
    return Intl.message(
      'Cantidad de equipos a instalar',
      name: 'numberOfEquipmentToInstall',
      desc: '',
      args: [],
    );
  }

  /// `IP pública`
  String get ipPublic {
    return Intl.message(
      'IP pública',
      name: 'ipPublic',
      desc: '',
      args: [],
    );
  }

  /// `Anexos`
  String get annexes {
    return Intl.message(
      'Anexos',
      name: 'annexes',
      desc: '',
      args: [],
    );
  }

  /// `Canales Extras (Por defecto incluye 10 sin costo)`
  String get extraChannels {
    return Intl.message(
      'Canales Extras (Por defecto incluye 10 sin costo)',
      name: 'extraChannels',
      desc: '',
      args: [],
    );
  }

  /// `Teléfonos IP a instalar (No incluye cableado)`
  String get phoneIPToInstall {
    return Intl.message(
      'Teléfonos IP a instalar (No incluye cableado)',
      name: 'phoneIPToInstall',
      desc: '',
      args: [],
    );
  }

  /// `Si`
  String get yes {
    return Intl.message(
      'Si',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
