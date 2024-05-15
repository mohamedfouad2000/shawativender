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

  /// `search`
  String get search {
    return Intl.message(
      'search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `day`
  String get day {
    return Intl.message(
      'day',
      name: 'day',
      desc: '',
      args: [],
    );
  }

  /// `EGP`
  String get SAR {
    return Intl.message(
      'EGP',
      name: 'SAR',
      desc: '',
      args: [],
    );
  }

  /// `All Properties`
  String get allProperties {
    return Intl.message(
      'All Properties',
      name: 'allProperties',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get seeAll {
    return Intl.message(
      'See All',
      name: 'seeAll',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get Home {
    return Intl.message(
      'Home',
      name: 'Home',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get Search {
    return Intl.message(
      'Search',
      name: 'Search',
      desc: '',
      args: [],
    );
  }

  /// `Booking`
  String get Booking {
    return Intl.message(
      'Booking',
      name: 'Booking',
      desc: '',
      args: [],
    );
  }

  /// `Menu`
  String get Menu {
    return Intl.message(
      'Menu',
      name: 'Menu',
      desc: '',
      args: [],
    );
  }

  /// `Recently search`
  String get Recentlysearch {
    return Intl.message(
      'Recently search',
      name: 'Recentlysearch',
      desc: '',
      args: [],
    );
  }

  /// `For You`
  String get ForYou {
    return Intl.message(
      'For You',
      name: 'ForYou',
      desc: '',
      args: [],
    );
  }

  /// `About Apartment`
  String get AboutApartment {
    return Intl.message(
      'About Apartment',
      name: 'AboutApartment',
      desc: '',
      args: [],
    );
  }

  /// `Lesting Agent`
  String get LestingAgent {
    return Intl.message(
      'Lesting Agent',
      name: 'LestingAgent',
      desc: '',
      args: [],
    );
  }

  /// `Apply filters`
  String get Applyfilters {
    return Intl.message(
      'Apply filters',
      name: 'Applyfilters',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming booking`
  String get UpcomingBooking {
    return Intl.message(
      'Upcoming booking',
      name: 'UpcomingBooking',
      desc: '',
      args: [],
    );
  }

  /// `Rental history`
  String get RentalHistory {
    return Intl.message(
      'Rental history',
      name: 'RentalHistory',
      desc: '',
      args: [],
    );
  }

  /// `My booking`
  String get MyBooking {
    return Intl.message(
      'My booking',
      name: 'MyBooking',
      desc: '',
      args: [],
    );
  }

  /// `No Data`
  String get NoData {
    return Intl.message(
      'No Data',
      name: 'NoData',
      desc: '',
      args: [],
    );
  }

  /// `view profile`
  String get viewPofile {
    return Intl.message(
      'view profile',
      name: 'viewPofile',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get Language {
    return Intl.message(
      'Language',
      name: 'Language',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get Notifications {
    return Intl.message(
      'Notifications',
      name: 'Notifications',
      desc: '',
      args: [],
    );
  }

  /// `favorites`
  String get favorites {
    return Intl.message(
      'favorites',
      name: 'favorites',
      desc: '',
      args: [],
    );
  }

  /// `support`
  String get support {
    return Intl.message(
      'support',
      name: 'support',
      desc: '',
      args: [],
    );
  }

  /// `terms & conditions`
  String get termsconditions {
    return Intl.message(
      'terms & conditions',
      name: 'termsconditions',
      desc: '',
      args: [],
    );
  }

  /// `logout`
  String get logout {
    return Intl.message(
      'logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Profile Information`
  String get ProfileInfo {
    return Intl.message(
      'Profile Information',
      name: 'ProfileInfo',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get FullName {
    return Intl.message(
      'Full Name',
      name: 'FullName',
      desc: '',
      args: [],
    );
  }

  /// `phone`
  String get phone {
    return Intl.message(
      'phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `password`
  String get password {
    return Intl.message(
      'password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `confirm password`
  String get confirmPassword {
    return Intl.message(
      'confirm password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `This site is protected by reCAPTCHA and the Google `
  String get profile1 {
    return Intl.message(
      'This site is protected by reCAPTCHA and the Google ',
      name: 'profile1',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get profile2 {
    return Intl.message(
      'Privacy Policy',
      name: 'profile2',
      desc: '',
      args: [],
    );
  }

  /// ` and `
  String get profile3 {
    return Intl.message(
      ' and ',
      name: 'profile3',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Service`
  String get profile4 {
    return Intl.message(
      'Terms of Service',
      name: 'profile4',
      desc: '',
      args: [],
    );
  }

  /// ` apply `
  String get profile5 {
    return Intl.message(
      ' apply ',
      name: 'profile5',
      desc: '',
      args: [],
    );
  }

  /// `password not match`
  String get passwordErorr {
    return Intl.message(
      'password not match',
      name: 'passwordErorr',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get Update {
    return Intl.message(
      'Update',
      name: 'Update',
      desc: '',
      args: [],
    );
  }

  /// `schedule`
  String get schedule {
    return Intl.message(
      'schedule',
      name: 'schedule',
      desc: '',
      args: [],
    );
  }

  /// `Languages`
  String get Languages {
    return Intl.message(
      'Languages',
      name: 'Languages',
      desc: '',
      args: [],
    );
  }

  /// `Make all read`
  String get MakeAllRead {
    return Intl.message(
      'Make all read',
      name: 'MakeAllRead',
      desc: '',
      args: [],
    );
  }

  /// `This text is extracted from a tqnia company its a text generator and is an example of an unreal virtual text that can be replaced in the same space. This text was generated from a tqnia text generator, where you can generate such text or many other texts in addition to increasing the number of characters it generates application./n  Where the designer has to put temporary, virtual and unreal texts on the design to show the client the full form, and here comes the role of the default text, which saves the designer the trouble of searching for an alternative text that has nothing to do with the topic that the design is talking about, so it appears in an inappropriate way or with incorrect content that distracts the mind Client ./n    This text can be installed on any design without a problem, the design will appear organized, coordinated, and clear because it is still an alternative and temporary text and not a real text./n    Also, this text will be modified later by the customer after receiving his site and starting to add his real contents through it or through his data entry or through his participation in the content management services that a tqnia company gladly provides to its valued customers.          `
  String get TandC {
    return Intl.message(
      'This text is extracted from a tqnia company its a text generator and is an example of an unreal virtual text that can be replaced in the same space. This text was generated from a tqnia text generator, where you can generate such text or many other texts in addition to increasing the number of characters it generates application./n  Where the designer has to put temporary, virtual and unreal texts on the design to show the client the full form, and here comes the role of the default text, which saves the designer the trouble of searching for an alternative text that has nothing to do with the topic that the design is talking about, so it appears in an inappropriate way or with incorrect content that distracts the mind Client ./n    This text can be installed on any design without a problem, the design will appear organized, coordinated, and clear because it is still an alternative and temporary text and not a real text./n    Also, this text will be modified later by the customer after receiving his site and starting to add his real contents through it or through his data entry or through his participation in the content management services that a tqnia company gladly provides to its valued customers.          ',
      name: 'TandC',
      desc: '',
      args: [],
    );
  }

  /// `This text is extracted from a tqnia company its a text generator and is an example of an unreal virtual text that can be replaced in the same space. This text was generated from a tqnia text generator, where you can generate such text or many other texts in addition to increasing the number of characters it generates application.`
  String get TandC2 {
    return Intl.message(
      'This text is extracted from a tqnia company its a text generator and is an example of an unreal virtual text that can be replaced in the same space. This text was generated from a tqnia text generator, where you can generate such text or many other texts in addition to increasing the number of characters it generates application.',
      name: 'TandC2',
      desc: '',
      args: [],
    );
  }

  /// `let us know our queries & feedback`
  String get supportSubTitle {
    return Intl.message(
      'let us know our queries & feedback',
      name: 'supportSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `call us`
  String get callus {
    return Intl.message(
      'call us',
      name: 'callus',
      desc: '',
      args: [],
    );
  }

  /// `email us`
  String get emailus {
    return Intl.message(
      'email us',
      name: 'emailus',
      desc: '',
      args: [],
    );
  }

  /// `write us`
  String get writeus {
    return Intl.message(
      'write us',
      name: 'writeus',
      desc: '',
      args: [],
    );
  }

  /// `enter your message`
  String get enteryourmessage {
    return Intl.message(
      'enter your message',
      name: 'enteryourmessage',
      desc: '',
      args: [],
    );
  }

  /// `submit`
  String get submit {
    return Intl.message(
      'submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Login To Your`
  String get LoginToYour {
    return Intl.message(
      'Login To Your',
      name: 'LoginToYour',
      desc: '',
      args: [],
    );
  }

  /// `Account!`
  String get Account {
    return Intl.message(
      'Account!',
      name: 'Account',
      desc: '',
      args: [],
    );
  }

  /// `Please, provide your information`
  String get Pleaseprovideyourinformation {
    return Intl.message(
      'Please, provide your information',
      name: 'Pleaseprovideyourinformation',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get Login {
    return Intl.message(
      'Log in',
      name: 'Login',
      desc: '',
      args: [],
    );
  }

  /// `Remember me`
  String get Rememberme {
    return Intl.message(
      'Remember me',
      name: 'Rememberme',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Your Password?`
  String get ForgotYourPassword {
    return Intl.message(
      'Forgot Your Password?',
      name: 'ForgotYourPassword',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'OrSignInwith ' key

  /// `Create new`
  String get Createnew {
    return Intl.message(
      'Create new',
      name: 'Createnew',
      desc: '',
      args: [],
    );
  }

  /// `Are you ready to make a new account, Let’s go`
  String get Areyouready {
    return Intl.message(
      'Are you ready to make a new account, Let’s go',
      name: 'Areyouready',
      desc: '',
      args: [],
    );
  }

  /// `I accept all the`
  String get Iacceptallthe {
    return Intl.message(
      'I accept all the',
      name: 'Iacceptallthe',
      desc: '',
      args: [],
    );
  }

  /// `please accept terms and conditions`
  String get pleaseaccepttermsandconditions {
    return Intl.message(
      'please accept terms and conditions',
      name: 'pleaseaccepttermsandconditions',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get SignUp {
    return Intl.message(
      'Sign Up',
      name: 'SignUp',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? `
  String get Alreadyhaveanaccount {
    return Intl.message(
      'Already have an account? ',
      name: 'Alreadyhaveanaccount',
      desc: '',
      args: [],
    );
  }

  /// `sign In here`
  String get signInhere {
    return Intl.message(
      'sign In here',
      name: 'signInhere',
      desc: '',
      args: [],
    );
  }

  /// `Don't have anaccount ? `
  String get Donthaveanaccount {
    return Intl.message(
      'Don\'t have anaccount ? ',
      name: 'Donthaveanaccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up Here`
  String get SignuPHere {
    return Intl.message(
      'Sign Up Here',
      name: 'SignuPHere',
      desc: '',
      args: [],
    );
  }

  /// `CHECK IN`
  String get CHECKIN {
    return Intl.message(
      'CHECK IN',
      name: 'CHECKIN',
      desc: '',
      args: [],
    );
  }

  /// `CHECK OUT`
  String get CHECKOUT {
    return Intl.message(
      'CHECK OUT',
      name: 'CHECKOUT',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get Confirm {
    return Intl.message(
      'Confirm',
      name: 'Confirm',
      desc: '',
      args: [],
    );
  }

  /// `Please enter Your Phone`
  String get PhoneError {
    return Intl.message(
      'Please enter Your Phone',
      name: 'PhoneError',
      desc: '',
      args: [],
    );
  }

  /// `My Services`
  String get MyServecs {
    return Intl.message(
      'My Services',
      name: 'MyServecs',
      desc: '',
      args: [],
    );
  }

  /// `Reviews`
  String get Reviews {
    return Intl.message(
      'Reviews',
      name: 'Reviews',
      desc: '',
      args: [],
    );
  }

  /// `Choose Your Photo`
  String get ChooseYourPhoto {
    return Intl.message(
      'Choose Your Photo',
      name: 'ChooseYourPhoto',
      desc: '',
      args: [],
    );
  }

  /// `Gallary`
  String get Gallary {
    return Intl.message(
      'Gallary',
      name: 'Gallary',
      desc: '',
      args: [],
    );
  }

  /// `camera`
  String get camera {
    return Intl.message(
      'camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Servecs`
  String get Servecs {
    return Intl.message(
      'Servecs',
      name: 'Servecs',
      desc: '',
      args: [],
    );
  }

  /// `Type`
  String get Type {
    return Intl.message(
      'Type',
      name: 'Type',
      desc: '',
      args: [],
    );
  }

  /// `filter`
  String get filter {
    return Intl.message(
      'filter',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `price`
  String get price {
    return Intl.message(
      'price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `price duration`
  String get priceduration {
    return Intl.message(
      'price duration',
      name: 'priceduration',
      desc: '',
      args: [],
    );
  }

  /// `bed Rooms`
  String get bedRooms {
    return Intl.message(
      'bed Rooms',
      name: 'bedRooms',
      desc: '',
      args: [],
    );
  }

  /// `bath Rooms`
  String get bathRooms {
    return Intl.message(
      'bath Rooms',
      name: 'bathRooms',
      desc: '',
      args: [],
    );
  }

  /// `floor`
  String get floor {
    return Intl.message(
      'floor',
      name: 'floor',
      desc: '',
      args: [],
    );
  }

  /// `Accept`
  String get Accept {
    return Intl.message(
      'Accept',
      name: 'Accept',
      desc: '',
      args: [],
    );
  }

  /// `Decline`
  String get Decline {
    return Intl.message(
      'Decline',
      name: 'Decline',
      desc: '',
      args: [],
    );
  }

  /// `Add Service`
  String get ApplayFilter {
    return Intl.message(
      'Add Service',
      name: 'ApplayFilter',
      desc: '',
      args: [],
    );
  }

  /// `Area`
  String get Area {
    return Intl.message(
      'Area',
      name: 'Area',
      desc: '',
      args: [],
    );
  }

  /// `min`
  String get min {
    return Intl.message(
      'min',
      name: 'min',
      desc: '',
      args: [],
    );
  }

  /// `max`
  String get max {
    return Intl.message(
      'max',
      name: 'max',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get Total {
    return Intl.message(
      'Total',
      name: 'Total',
      desc: '',
      args: [],
    );
  }

  /// `Clock In`
  String get ClockIn {
    return Intl.message(
      'Clock In',
      name: 'ClockIn',
      desc: '',
      args: [],
    );
  }

  /// `Clock out`
  String get ClockOut {
    return Intl.message(
      'Clock out',
      name: 'ClockOut',
      desc: '',
      args: [],
    );
  }

  /// `edit service`
  String get edit_service {
    return Intl.message(
      'edit service',
      name: 'edit_service',
      desc: '',
      args: [],
    );
  }

  /// `Requests`
  String get requests {
    return Intl.message(
      'Requests',
      name: 'requests',
      desc: '',
      args: [],
    );
  }

  /// ` Show Requests `
  String get ShowRequests {
    return Intl.message(
      ' Show Requests ',
      name: 'ShowRequests',
      desc: '',
      args: [],
    );
  }

  /// `Earnings`
  String get Earnings {
    return Intl.message(
      'Earnings',
      name: 'Earnings',
      desc: '',
      args: [],
    );
  }

  /// `Bookings`
  String get Bookings {
    return Intl.message(
      'Bookings',
      name: 'Bookings',
      desc: '',
      args: [],
    );
  }

  /// `services`
  String get services {
    return Intl.message(
      'services',
      name: 'services',
      desc: '',
      args: [],
    );
  }

  /// `Total Review`
  String get TotalReview {
    return Intl.message(
      'Total Review',
      name: 'TotalReview',
      desc: '',
      args: [],
    );
  }

  /// `Owner`
  String get Owner {
    return Intl.message(
      'Owner',
      name: 'Owner',
      desc: '',
      args: [],
    );
  }

  /// `open`
  String get open {
    return Intl.message(
      'open',
      name: 'open',
      desc: '',
      args: [],
    );
  }

  /// `close`
  String get colse {
    return Intl.message(
      'close',
      name: 'colse',
      desc: '',
      args: [],
    );
  }

  /// `unpaid`
  String get unpaid {
    return Intl.message(
      'unpaid',
      name: 'unpaid',
      desc: '',
      args: [],
    );
  }

  /// `pending`
  String get pending {
    return Intl.message(
      'pending',
      name: 'pending',
      desc: '',
      args: [],
    );
  }

  /// `paid`
  String get paid {
    return Intl.message(
      'paid',
      name: 'paid',
      desc: '',
      args: [],
    );
  }

  /// `Reject`
  String get Reject {
    return Intl.message(
      'Reject',
      name: 'Reject',
      desc: '',
      args: [],
    );
  }

  /// `change Location`
  String get changeLocation {
    return Intl.message(
      'change Location',
      name: 'changeLocation',
      desc: '',
      args: [],
    );
  }

  /// `Set Location`
  String get SetLocation {
    return Intl.message(
      'Set Location',
      name: 'SetLocation',
      desc: '',
      args: [],
    );
  }

  /// `Edit Service`
  String get EditService {
    return Intl.message(
      'Edit Service',
      name: 'EditService',
      desc: '',
      args: [],
    );
  }

  /// `Set Current Location`
  String get SetCurrentLocation {
    return Intl.message(
      'Set Current Location',
      name: 'SetCurrentLocation',
      desc: '',
      args: [],
    );
  }

  /// `Accepted`
  String get AlreadyAccept {
    return Intl.message(
      'Accepted',
      name: 'AlreadyAccept',
      desc: '',
      args: [],
    );
  }

  /// `Rejected`
  String get AlreadyReject {
    return Intl.message(
      'Rejected',
      name: 'AlreadyReject',
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
      Locale.fromSubtags(languageCode: 'ar'),
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
