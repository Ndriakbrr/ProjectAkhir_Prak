import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'game_detail.dart';

class StationList extends StatefulWidget {
  const StationList({Key? key}) : super(key: key);

  @override
  _StationListState createState() => _StationListState();
}

class _StationListState extends State<StationList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/logo.jpg', // Ganti dengan path foto background Anda
              fit: BoxFit.cover,
            ),
          ),
          FutureBuilder(
            future: fetchGames(),
            builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error'),
                );
              }
              if (snapshot.hasData) {
                List<dynamic> games = snapshot.data!;
                return ListView.builder(
                  itemCount: games.length,
                  itemBuilder: (BuildContext context, int index) {
                    var game = games[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: Colors.white, // Set the color to blue
                        child: ListTile(
                          leading: Image.network(game['thumbnail'] ?? ''),
                          title: Text(
                            game['title'] ?? '',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(game['genre'] ?? ''),
                          trailing: Text(game['platform'] ?? ''),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return GameDetail(gameData: game);
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ],
      ),
    );
  }

  Future<List<dynamic>> fetchGames() async {
    final response =
    await http.get(Uri.parse('https://www.freetogame.com/api/games'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load stations');
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: StationList(),
  ));
}
