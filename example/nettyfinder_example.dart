import "../lib/nettyfinder.dart";

void main() {
  var netFinder = NetworkTypeDetect("+2347012345678 "); // Airtel

  // Return null if number is valid but not recognized
  print('Network Type: ${netFinder() ?? 'Not a recognized number'}');
}
