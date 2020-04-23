import 'package:flutter/material.dart';
import 'package:noticias/src/models/category_model.dart';
import 'package:noticias/src/services/news_services.dart';
import 'package:noticias/src/theme/tema.dart';
import 'package:noticias/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  @override
  
  Widget build(BuildContext context) {
     final newsServices   = Provider.of<NewsServices>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            _ListaCategorias(),
            Expanded(child: ListaNoticias(newsServices.getArticulosCategoriaSeleccionada)
            
            )
            ],
        ),
      ),
    );
  }
}

class _ListaCategorias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsServices>(context).categories;
    return Container(
      width: double.infinity,
      height: 80,
          child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
            final cName = categories[index].name;
            return Container(
              // width: 105,

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    _CategoryButtom(categories[index]),
                    SizedBox(
                      height: 5,
                    ),
                    Text('${cName[0].toUpperCase()}${cName.substring(1)}')
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class _CategoryButtom extends StatelessWidget {
  final Category category;

  const _CategoryButtom(this.category);
  @override
  Widget build(BuildContext context) {
     final newsServices = Provider.of<NewsServices>(context);
    return GestureDetector(
      onTap: () {
        final newsServices = Provider.of<NewsServices>(context, listen: false);
        newsServices.selectedCategory = category.name;
      },
      child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Icon (
          category.icon,
          
           color: (newsServices.selectedCategory == this.category.name)
           ? miTema.accentColor
           :Colors.black54
           
           ),
      ),
    );
  }
}
