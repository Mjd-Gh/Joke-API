import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:jokes_api/main.dart';

class JokeService {
  //Create a methid that will return a String "joke"
  Future<String> getJoke() async {
    //Joke API URL
    final url =
        //Here a choose a specific field of jokes "Programmer" that will return a single part joke
        Uri.parse('https://v2.jokeapi.dev/joke/Programming?type=single'); 
    final request = await http.get(url); //Send Get request to retrive the info
    final responseAsJson = json.decode(request.body); // Convert from json to String
    joke = responseAsJson['joke'];
    print("Result: ${request.statusCode}");
    return joke;
  }
}
