import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:noticias/src/models/category_model.dart';
import 'package:noticias/src/models/news_models.dart';
import 'package:http/http.dart' as http;

final _URL_NEWS = 'https://newsapi.org/v2';
final _APIKEY = 'dc61b05f825f47caab1508531daae9fe';

class NewsServices with ChangeNotifier {
  List<Article> headlines = [];
  String _selectedCategory = 'business';
  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyballBall, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology')
  ];

  Map<String, List<Article>> categoryArticules = {};

  NewsServices() {
    this.getTopHeadLines();
    categories.forEach((item) {
      this.categoryArticules[item.name] = new List();
    });
  }

  get selectedCategory => this._selectedCategory;
  set selectedCategory(String valor) {
    this._selectedCategory = valor;
    getArticulesByCategory(valor);
    notifyListeners();
  }

List<Article> get getArticulosCategoriaSeleccionada =>   this.categoryArticules[this.selectedCategory];

  getTopHeadLines() async {
    final url = '$_URL_NEWS/top-headlines?country=us&apiKey=$_APIKEY';
    final resp = await http.get(url);

    final newsResponse = newResponseFromJson(resp.body);

    this.headlines.addAll(newsResponse.articles);
    notifyListeners();
  }

  getArticulesByCategory(String category) async {
    
    if(this.categoryArticules[category].length > 0){
      return this.categoryArticules[category];
    }

    final url ='$_URL_NEWS/top-headlines?country=us&apiKey=$_APIKEY&category=$category';
    final resp = await http.get(url);

    final newsResponse = newResponseFromJson(resp.body);

this.categoryArticules[category].addAll(newsResponse.articles);
    notifyListeners();
  }
}
