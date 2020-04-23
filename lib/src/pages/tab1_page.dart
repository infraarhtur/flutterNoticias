import 'package:flutter/material.dart';
import 'package:noticias/src/services/news_services.dart';
import 'package:noticias/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tap1Page extends StatefulWidget {
  @override
  _Tap1PageState createState() => _Tap1PageState();
}

class _Tap1PageState extends State<Tap1Page> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final headlines = Provider.of<NewsServices>(context).headlines;
    return Scaffold(
        body: (headlines.length == 0)
            ? Center( child: CircularProgressIndicator())
            : ListaNoticias(headlines));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
