import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main() {
 runApp(MyApp());
}

class MyApp extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Malatya Weather App'),
        ),
        body: WeatherWidget(),
      ),
    );
 }
}

class WeatherWidget extends StatefulWidget {
 @override
 _WeatherWidgetState createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
 dynamic weatherData;

 @override
 void initState() {
    super.initState();
    getWeatherData();
 }

 Future<void> getWeatherData() async {
    final response = await http.get(
        Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=Malatya,tr&appid=b10637882b1e76b71357867e3e21bc31'));

    if (response.statusCode == 200) {
      setState(() {
        weatherData = jsonDecode(response.body);
      });
    } else {
      throw Exception('Failed to load weather data');
    }
 }

 @override
 Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Malatya Weather',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 10),
          weatherData == null
              ? CircularProgressIndicator()
              : Column(
                 children: [
                    Text(
                      '${weatherData['main']['temp']}°C',
                      style: TextStyle(fontSize: 36),
                    ),
                    SizedBox(height: 10),
                    Image.network(
                      'http://openweathermap.org/img/wn/${weatherData['weather'][0]['icon']}@2x.png',
                      width: 100,
                      height: 100,
                    ),
                    SizedBox(height: 10),
                    Text(
                      '${weatherData['name']}, ${weatherData['sys']['country']}',
                      style: TextStyle(fontSize: 18),
                    ),
                 ],
                ),
        ],
      ),
    );
 }
}