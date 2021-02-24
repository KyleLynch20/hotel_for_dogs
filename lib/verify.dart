import 'package:google_place/google_place.dart';

class Verify {

  static void verifyStateAndCity(String state, String city) async {
    var googlePlace = GooglePlace(city + " " + state);
    var result = await googlePlace.autocomplete.get("1600 Amphitheatre");

  }
}