// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class CacheEncryptHelper {
//   static late FlutterSecureStorage  storage;
//   static init() async {
//    AndroidOptions _getAndroidOptions() => const AndroidOptions(
//         encryptedSharedPreferences: true,
//       );
//  storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
//     await Future.delayed(const Duration(seconds: 1));
//     print("Cached Encrypted Init"); 
//   }
// static Future<String> readData({required String key}) async{
// return  await storage.read(key: key)??'';
// }
// static Future<void> writeData({required String key, required String? value}) async{
//  return await storage.write(key: key, value: value);
// }

// static Future<void> deleteAllData() async{
//  return await storage.deleteAll();
// }

// static Future<void> deleteData({required String key}) async{
//  return await storage.delete(key: key);
// }


// }
