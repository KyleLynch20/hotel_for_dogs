import "package:google_maps_webservice/places.dart";

class Verify {

  static Future<bool> verifyStateAndCity(String state, String city) async {
    final places = new GoogleMapsPlaces(apiKey: "AIzaSyAJqVt4H-UhTqH9Ist5oMyKk0EJFPu4HGw");
    PlacesSearchResponse result = await places.searchByText(city + " " + state);
    print(city + " " + state);
    //print(result.results.single.name); // will throw an error if no results are found!

    if (result.isOkay) {
      return true;
    } else {
      return false;
    }

  }
}