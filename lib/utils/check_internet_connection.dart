




import 'dart:io';

Future<bool> checkInternet() async {
  bool ActiveConnection = false;
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      ActiveConnection = true;
    } else {
      ActiveConnection = false;
    }
    // print("INTERNET STATUS:: $ActiveConnection");
    return ActiveConnection;
  } catch (err) {
    // print("Internet Error: $err");
  }
  // print("INTERNET STATUS:: $ActiveConnection");
  return ActiveConnection;
}