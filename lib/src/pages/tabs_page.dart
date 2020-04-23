import 'package:flutter/material.dart';
import 'package:noticias/src/pages/tab1_page.dart';
import 'package:noticias/src/pages/tab2_page.dart';

import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
// final newsServices = Provider.of<NewsServices>(context);

    return ChangeNotifierProvider(
      create: (_) => new _NavegacionModel(),
      child: Scaffold(
        body: _paginas(),
        bottomNavigationBar: _navegacion(),
      ),
    );
  }
}

class _navegacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return BottomNavigationBar(
      currentIndex: navegacionModel.paginaActual,
      onTap: (i) => navegacionModel.paginaActual = i,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), title: Text('para mi')),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), title: Text('Encabezados')),
      ],
    );
  }
}

class _paginas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);
    return PageView(
      controller: navegacionModel.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[Tap1Page(), Tab2Page()],
    );
  }
}

class _NavegacionModel with ChangeNotifier {
  int _paginaActual = 0;

  PageController _pageController = new PageController();

  int get paginaActual => this._paginaActual;

  set paginaActual(int valor) {
    this._paginaActual = valor;
    _pageController.animateToPage(valor,
        duration: Duration(milliseconds: 250), curve: Curves.easeInOut);
    notifyListeners();
  }

  PageController get pageController => this._pageController;
}
