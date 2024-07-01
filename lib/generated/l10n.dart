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

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Night`
  String get day {
    return Intl.message(
      'Night',
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

  /// `Request`
  String get Request {
    return Intl.message(
      'Request',
      name: 'Request',
      desc: '',
      args: [],
    );
  }

  /// `Powered By `
  String get Powered_By {
    return Intl.message(
      'Powered By ',
      name: 'Powered_By',
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

  /// `View profile`
  String get viewPofile {
    return Intl.message(
      'View profile',
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

  /// `Favorites`
  String get favorites {
    return Intl.message(
      'Favorites',
      name: 'favorites',
      desc: '',
      args: [],
    );
  }

  /// `Support`
  String get support {
    return Intl.message(
      'Support',
      name: 'support',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get termsconditions {
    return Intl.message(
      'Terms & Conditions',
      name: 'termsconditions',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
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

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirmPassword {
    return Intl.message(
      'Confirm password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `This Site is protected by reCAPTCHA and the Google `
  String get profile1 {
    return Intl.message(
      'This Site is protected by reCAPTCHA and the Google ',
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

  /// `If you want To Delete Your Account `
  String get profile4 {
    return Intl.message(
      'If you want To Delete Your Account ',
      name: 'profile4',
      desc: '',
      args: [],
    );
  }

  /// `Click Here`
  String get profile5 {
    return Intl.message(
      'Click Here',
      name: 'profile5',
      desc: '',
      args: [],
    );
  }

  /// `Password not match`
  String get passwordErorr {
    return Intl.message(
      'Password not match',
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

  /// `Schedule`
  String get schedule {
    return Intl.message(
      'Schedule',
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

  /// `Call us`
  String get callus {
    return Intl.message(
      'Call us',
      name: 'callus',
      desc: '',
      args: [],
    );
  }

  /// `Email us`
  String get emailus {
    return Intl.message(
      'Email us',
      name: 'emailus',
      desc: '',
      args: [],
    );
  }

  /// `Write us`
  String get writeus {
    return Intl.message(
      'Write us',
      name: 'writeus',
      desc: '',
      args: [],
    );
  }

  /// `Enter your message`
  String get enteryourmessage {
    return Intl.message(
      'Enter your message',
      name: 'enteryourmessage',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
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

  /// `Please accept terms and conditions`
  String get pleaseaccepttermsandconditions {
    return Intl.message(
      'Please accept terms and conditions',
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

  /// `Sign In here`
  String get signInhere {
    return Intl.message(
      'Sign In here',
      name: 'signInhere',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account ? `
  String get Donthaveanaccount {
    return Intl.message(
      'Don\'t have an account ? ',
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

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Services`
  String get Servecs {
    return Intl.message(
      'Services',
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

  /// `Filter`
  String get filter {
    return Intl.message(
      'Filter',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Price Duration`
  String get priceduration {
    return Intl.message(
      'Price Duration',
      name: 'priceduration',
      desc: '',
      args: [],
    );
  }

  /// `Bed Rooms`
  String get bedRooms {
    return Intl.message(
      'Bed Rooms',
      name: 'bedRooms',
      desc: '',
      args: [],
    );
  }

  /// `Bath Rooms`
  String get bathRooms {
    return Intl.message(
      'Bath Rooms',
      name: 'bathRooms',
      desc: '',
      args: [],
    );
  }

  /// `Floor`
  String get floor {
    return Intl.message(
      'Floor',
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

  /// `Edit service`
  String get edit_service {
    return Intl.message(
      'Edit service',
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

  /// `Services`
  String get services {
    return Intl.message(
      'Services',
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

  /// `Accepted`
  String get open {
    return Intl.message(
      'Accepted',
      name: 'open',
      desc: '',
      args: [],
    );
  }

  /// `Rejected`
  String get colse {
    return Intl.message(
      'Rejected',
      name: 'colse',
      desc: '',
      args: [],
    );
  }

  /// `Unpaid`
  String get unpaid {
    return Intl.message(
      'Unpaid',
      name: 'unpaid',
      desc: '',
      args: [],
    );
  }

  /// `Pending`
  String get pending {
    return Intl.message(
      'Pending',
      name: 'pending',
      desc: '',
      args: [],
    );
  }

  /// `Paid`
  String get paid {
    return Intl.message(
      'Paid',
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

  /// `Change Location`
  String get changeLocation {
    return Intl.message(
      'Change Location',
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

  /// `Add Rating`
  String get AddRating {
    return Intl.message(
      'Add Rating',
      name: 'AddRating',
      desc: '',
      args: [],
    );
  }

  /// `Rating Dialog`
  String get RatingDialog {
    return Intl.message(
      'Rating Dialog',
      name: 'RatingDialog',
      desc: '',
      args: [],
    );
  }

  /// `Tap a star to set your rating. Add more description here if you want.`
  String get rateText {
    return Intl.message(
      'Tap a star to set your rating. Add more description here if you want.',
      name: 'rateText',
      desc: '',
      args: [],
    );
  }

  /// `Set your custom comment hint`
  String get ratehint {
    return Intl.message(
      'Set your custom comment hint',
      name: 'ratehint',
      desc: '',
      args: [],
    );
  }

  /// `Daily`
  String get Daily {
    return Intl.message(
      'Daily',
      name: 'Daily',
      desc: '',
      args: [],
    );
  }

  /// `Weekly`
  String get weekly {
    return Intl.message(
      'Weekly',
      name: 'weekly',
      desc: '',
      args: [],
    );
  }

  /// `Monthly`
  String get Monthly {
    return Intl.message(
      'Monthly',
      name: 'Monthly',
      desc: '',
      args: [],
    );
  }

  /// `Request`
  String get request {
    return Intl.message(
      'Request',
      name: 'request',
      desc: '',
      args: [],
    );
  }

  /// `Yearly`
  String get Yearly {
    return Intl.message(
      'Yearly',
      name: 'Yearly',
      desc: '',
      args: [],
    );
  }

  /// `Set Location`
  String get setlocation {
    return Intl.message(
      'Set Location',
      name: 'setlocation',
      desc: '',
      args: [],
    );
  }

  /// `Change Location`
  String get changelocation {
    return Intl.message(
      'Change Location',
      name: 'changelocation',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get Payment {
    return Intl.message(
      'Payment',
      name: 'Payment',
      desc: '',
      args: [],
    );
  }

  /// `Choose The Payment Method`
  String get Choose_The_Payment_Method {
    return Intl.message(
      'Choose The Payment Method',
      name: 'Choose_The_Payment_Method',
      desc: '',
      args: [],
    );
  }

  /// `Upload your payment screen here`
  String get Upload_your_payment_screen_here {
    return Intl.message(
      'Upload your payment screen here',
      name: 'Upload_your_payment_screen_here',
      desc: '',
      args: [],
    );
  }

  /// `Please select payment method and upload payment screen`
  String get Please_select_payment_method_and_upload_payment_screen {
    return Intl.message(
      'Please select payment method and upload payment screen',
      name: 'Please_select_payment_method_and_upload_payment_screen',
      desc: '',
      args: [],
    );
  }

  /// `Drop your files here, or`
  String get Drop_your_files_here_or {
    return Intl.message(
      'Drop your files here, or',
      name: 'Drop_your_files_here_or',
      desc: '',
      args: [],
    );
  }

  /// `JPG, PNG, PDF (Max 800x400px - 2Mo)`
  String get imageSize {
    return Intl.message(
      'JPG, PNG, PDF (Max 800x400px - 2Mo)',
      name: 'imageSize',
      desc: '',
      args: [],
    );
  }

  /// `Browse`
  String get browse {
    return Intl.message(
      'Browse',
      name: 'browse',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the correct number`
  String get phone_eroor {
    return Intl.message(
      'Please enter the correct number',
      name: 'phone_eroor',
      desc: '',
      args: [],
    );
  }

  /// `Skip for now`
  String get SkipForNow {
    return Intl.message(
      'Skip for now',
      name: 'SkipForNow',
      desc: '',
      args: [],
    );
  }

  /// `Allow Access`
  String get AllowAccess {
    return Intl.message(
      'Allow Access',
      name: 'AllowAccess',
      desc: '',
      args: [],
    );
  }

  /// `Enable Location`
  String get EnableLocation {
    return Intl.message(
      'Enable Location',
      name: 'EnableLocation',
      desc: '',
      args: [],
    );
  }

  /// `Choose your location to start find the request`
  String get chooseLocation {
    return Intl.message(
      'Choose your location to start find the request',
      name: 'chooseLocation',
      desc: '',
      args: [],
    );
  }

  /// `Around you.`
  String get aroundyou {
    return Intl.message(
      'Around you.',
      name: 'aroundyou',
      desc: '',
      args: [],
    );
  }

  /// `Set Location Manually`
  String get SetLocationManually {
    return Intl.message(
      'Set Location Manually',
      name: 'SetLocationManually',
      desc: '',
      args: [],
    );
  }

  /// `Loading ...`
  String get Loading {
    return Intl.message(
      'Loading ...',
      name: 'Loading',
      desc: '',
      args: [],
    );
  }

  /// `Add Service`
  String get Addservice {
    return Intl.message(
      'Add Service',
      name: 'Addservice',
      desc: '',
      args: [],
    );
  }

  /// `Add your service now!`
  String get add_your_service_now {
    return Intl.message(
      'Add your service now!',
      name: 'add_your_service_now',
      desc: '',
      args: [],
    );
  }

  /// `Property Name`
  String get Property_Name {
    return Intl.message(
      'Property Name',
      name: 'Property_Name',
      desc: '',
      args: [],
    );
  }

  /// `Property Name With Arabic`
  String get Property_Name_With_Arabic {
    return Intl.message(
      'Property Name With Arabic',
      name: 'Property_Name_With_Arabic',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get Category {
    return Intl.message(
      'Category',
      name: 'Category',
      desc: '',
      args: [],
    );
  }

  /// `Place`
  String get Place {
    return Intl.message(
      'Place',
      name: 'Place',
      desc: '',
      args: [],
    );
  }

  /// `Place With Arabic`
  String get Place_With_Arabic {
    return Intl.message(
      'Place With Arabic',
      name: 'Place_With_Arabic',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get Description {
    return Intl.message(
      'Description',
      name: 'Description',
      desc: '',
      args: [],
    );
  }

  /// `Description Arabic`
  String get Description_Arabic {
    return Intl.message(
      'Description Arabic',
      name: 'Description_Arabic',
      desc: '',
      args: [],
    );
  }

  /// `Please fill all the fields`
  String get error_Msq_add_service {
    return Intl.message(
      'Please fill all the fields',
      name: 'error_Msq_add_service',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get selectsubject {
    return Intl.message(
      'Title',
      name: 'selectsubject',
      desc: '',
      args: [],
    );
  }

  /// `Add Event Nights`
  String get AddEventDays {
    return Intl.message(
      'Add Event Nights',
      name: 'AddEventDays',
      desc: '',
      args: [],
    );
  }

  /// `Add Feature`
  String get addFeature {
    return Intl.message(
      'Add Feature',
      name: 'addFeature',
      desc: '',
      args: [],
    );
  }

  /// `Select Event Nights`
  String get SelectEventDays {
    return Intl.message(
      'Select Event Nights',
      name: 'SelectEventDays',
      desc: '',
      args: [],
    );
  }

  /// `Add Event Day`
  String get AddEventDay {
    return Intl.message(
      'Add Event Day',
      name: 'AddEventDay',
      desc: '',
      args: [],
    );
  }

  /// `Last Payment`
  String get lastPayment {
    return Intl.message(
      'Last Payment',
      name: 'lastPayment',
      desc: '',
      args: [],
    );
  }

  /// `Event Nights`
  String get eventdays {
    return Intl.message(
      'Event Nights',
      name: 'eventdays',
      desc: '',
      args: [],
    );
  }

  /// `Successfull`
  String get Successfull {
    return Intl.message(
      'Successfull',
      name: 'Successfull',
      desc: '',
      args: [],
    );
  }

  /// `Opps! Something went wrong`
  String get oppsMessage {
    return Intl.message(
      'Opps! Something went wrong',
      name: 'oppsMessage',
      desc: '',
      args: [],
    );
  }

  /// `The password field must be at least 8 characters`
  String get eroor507 {
    return Intl.message(
      'The password field must be at least 8 characters',
      name: 'eroor507',
      desc: '',
      args: [],
    );
  }

  /// `Inprogress`
  String get inprogress {
    return Intl.message(
      'Inprogress',
      name: 'inprogress',
      desc: '',
      args: [],
    );
  }

  /// `Approved`
  String get Approved {
    return Intl.message(
      'Approved',
      name: 'Approved',
      desc: '',
      args: [],
    );
  }

  /// `Rejected`
  String get Rejected {
    return Intl.message(
      'Rejected',
      name: 'Rejected',
      desc: '',
      args: [],
    );
  }

  /// `close`
  String get close {
    return Intl.message(
      'close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Available Nights`
  String get AvailableDays {
    return Intl.message(
      'Available Nights',
      name: 'AvailableDays',
      desc: '',
      args: [],
    );
  }

  /// `Add Images`
  String get AddImages {
    return Intl.message(
      'Add Images',
      name: 'AddImages',
      desc: '',
      args: [],
    );
  }

  /// `Privacy policy`
  String get Privacypolicy {
    return Intl.message(
      'Privacy policy',
      name: 'Privacypolicy',
      desc: '',
      args: [],
    );
  }

  /// `Refunds`
  String get Refunds {
    return Intl.message(
      'Refunds',
      name: 'Refunds',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get Delete {
    return Intl.message(
      'Delete',
      name: 'Delete',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get Cancel {
    return Intl.message(
      'Cancel',
      name: 'Cancel',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete the account?`
  String get DeleteMsg {
    return Intl.message(
      'Are you sure you want to delete the account?',
      name: 'DeleteMsg',
      desc: '',
      args: [],
    );
  }

  /// `Warning!`
  String get warning {
    return Intl.message(
      'Warning!',
      name: 'warning',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Nights`
  String get InvalidDays {
    return Intl.message(
      'Invalid Nights',
      name: 'InvalidDays',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get Location {
    return Intl.message(
      'Location',
      name: 'Location',
      desc: '',
      args: [],
    );
  }

  /// `Go To This Location`
  String get GoToThisLocation {
    return Intl.message(
      'Go To This Location',
      name: 'GoToThisLocation',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get amount {
    return Intl.message(
      'Amount',
      name: 'amount',
      desc: '',
      args: [],
    );
  }

  /// `Please select payment method and upload payment screen`
  String get eroor500 {
    return Intl.message(
      'Please select payment method and upload payment screen',
      name: 'eroor500',
      desc: '',
      args: [],
    );
  }

  /// `Normal Nights`
  String get normaldays {
    return Intl.message(
      'Normal Nights',
      name: 'normaldays',
      desc: '',
      args: [],
    );
  }

  /// `change Image`
  String get changeImage {
    return Intl.message(
      'change Image',
      name: 'changeImage',
      desc: '',
      args: [],
    );
  }

  /// `Booking Details`
  String get BookingDetails {
    return Intl.message(
      'Booking Details',
      name: 'BookingDetails',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get All {
    return Intl.message(
      'All',
      name: 'All',
      desc: '',
      args: [],
    );
  }

  /// `coupon`
  String get coupon {
    return Intl.message(
      'coupon',
      name: 'coupon',
      desc: '',
      args: [],
    );
  }

  /// `Total After coupon`
  String get TotalAfterCopon {
    return Intl.message(
      'Total After coupon',
      name: 'TotalAfterCopon',
      desc: '',
      args: [],
    );
  }

  /// `Send To This Number :`
  String get sendto {
    return Intl.message(
      'Send To This Number :',
      name: 'sendto',
      desc: '',
      args: [],
    );
  }

  /// `Max Area`
  String get MaxArea {
    return Intl.message(
      'Max Area',
      name: 'MaxArea',
      desc: '',
      args: [],
    );
  }

  /// `Reserve Now`
  String get BookingNow {
    return Intl.message(
      'Reserve Now',
      name: 'BookingNow',
      desc: '',
      args: [],
    );
  }

  /// `Canceled`
  String get Canceled {
    return Intl.message(
      'Canceled',
      name: 'Canceled',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get ChangePassword {
    return Intl.message(
      'Change Password',
      name: 'ChangePassword',
      desc: '',
      args: [],
    );
  }

  /// `Current Password`
  String get Currentpassword {
    return Intl.message(
      'Current Password',
      name: 'Currentpassword',
      desc: '',
      args: [],
    );
  }

  /// `Add WIthdraw`
  String get Add_wIthdraw {
    return Intl.message(
      'Add WIthdraw',
      name: 'Add_wIthdraw',
      desc: '',
      args: [],
    );
  }

  /// `Account Number`
  String get AccountNumber {
    return Intl.message(
      'Account Number',
      name: 'AccountNumber',
      desc: '',
      args: [],
    );
  }

  /// `provider`
  String get provider {
    return Intl.message(
      'provider',
      name: 'provider',
      desc: '',
      args: [],
    );
  }

  /// `request Time`
  String get requestTime {
    return Intl.message(
      'request Time',
      name: 'requestTime',
      desc: '',
      args: [],
    );
  }

  /// `status`
  String get status {
    return Intl.message(
      'status',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `admin name`
  String get adminname {
    return Intl.message(
      'admin name',
      name: 'adminname',
      desc: '',
      args: [],
    );
  }

  /// `action`
  String get action {
    return Intl.message(
      'action',
      name: 'action',
      desc: '',
      args: [],
    );
  }

  /// `Your Balance`
  String get YourBalance {
    return Intl.message(
      'Your Balance',
      name: 'YourBalance',
      desc: '',
      args: [],
    );
  }

  /// `wIthdraw`
  String get wIthdraw {
    return Intl.message(
      'wIthdraw',
      name: 'wIthdraw',
      desc: '',
      args: [],
    );
  }

  /// `Don’t worry, take it easy!`
  String get Dont_worry_take_iteasy {
    return Intl.message(
      'Don’t worry, take it easy!',
      name: 'Dont_worry_take_iteasy',
      desc: '',
      args: [],
    );
  }

  /// `Write your OTP code`
  String get WriteyourOTPcode {
    return Intl.message(
      'Write your OTP code',
      name: 'WriteyourOTPcode',
      desc: '',
      args: [],
    );
  }

  /// `Enter The 6-Digit Code Sent To You At`
  String get Enter_The_Code_Sent_To_You_At {
    return Intl.message(
      'Enter The 6-Digit Code Sent To You At',
      name: 'Enter_The_Code_Sent_To_You_At',
      desc: '',
      args: [],
    );
  }

  /// `I Haven’t receved a code `
  String get IHaventrecevedacode {
    return Intl.message(
      'I Haven’t receved a code ',
      name: 'IHaventrecevedacode',
      desc: '',
      args: [],
    );
  }

  /// `Reset password`
  String get Resetpassword {
    return Intl.message(
      'Reset password',
      name: 'Resetpassword',
      desc: '',
      args: [],
    );
  }

  /// `Send OTP`
  String get SendOTP {
    return Intl.message(
      'Send OTP',
      name: 'SendOTP',
      desc: '',
      args: [],
    );
  }

  /// `OTP eroor`
  String get OTP_eroor {
    return Intl.message(
      'OTP eroor',
      name: 'OTP_eroor',
      desc: '',
      args: [],
    );
  }

  /// `Request Day`
  String get requestDay {
    return Intl.message(
      'Request Day',
      name: 'requestDay',
      desc: '',
      args: [],
    );
  }

  /// `Set New Password`
  String get SetNewPassword {
    return Intl.message(
      'Set New Password',
      name: 'SetNewPassword',
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
