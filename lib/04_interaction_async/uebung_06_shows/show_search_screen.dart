import 'dart:convert';

import 'package:advanced_mobile_app_development/04_interaction_async/uebung_06_shows/show_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'show_model.dart';

class ShowSearchScreen extends StatefulWidget {
  const ShowSearchScreen({super.key});

  @override
  State<ShowSearchScreen> createState() => _ShowSearchScreenState();
}

class _ShowSearchScreenState extends State<ShowSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  Future<List<Show>>? _showFuture;
  
  Future<List<Show>> _searchForShows() async {
    final response = await get(Uri.parse(
        'https://api.tvmaze.com/search/shows?q=${_searchController.text}'));
    final json = jsonDecode(response.body);
    return List.of(json).map((e) => Show.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Show-Suche')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: TextField(
              controller: _searchController,
            ),
          ),
          const SizedBox(height: 10.0),
          ElevatedButton(
            onPressed: () => setState(() {
              _showFuture = _searchForShows();
            }),
            child: const Text('Suchen'),
          ),

          const SizedBox(height: 20.0),
          if (_showFuture != null) Expanded(
            child: FutureBuilder(
              future: _showFuture,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.stackTrace);
                  print(snapshot.error);
                  return const Text('Beim Laden ist ein Fehler aufgetreten.');
                }

                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                }

                return SingleChildScrollView(
                  child: Column(
                    children: snapshot.requireData.map(_buildShowListWidget).toList(),
                  ),
                );
              }
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShowListWidget(Show show) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ShowDetailPage(show: show))),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(show.name),
                  Row(children: List.generate(
                    show.averageRating?.toInt() ?? 0,
                        (i) => const Icon(Icons.star, color: Colors.yellow),
                  )),
                ],
              ),
            ),
            if (show.imageUrl != null) Image.network(
                show.imageUrl!,
                height: 50.0,
            )
          ],
        ),
      ),
    );
  }
}
