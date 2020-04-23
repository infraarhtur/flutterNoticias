
import 'package:flutter/material.dart';
import 'package:noticias/src/models/news_models.dart';
import 'package:noticias/src/theme/tema.dart';
class ListaNoticias extends StatelessWidget {
 
final List<Article> noticias;

  const ListaNoticias( this.noticias) ;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      
      itemCount: this.noticias.length,
      itemBuilder: (BuildContext context , int index){
        return _Noticia(noticia: this.noticias[index], index: index);
      }
      );
  }
}

class _Noticia extends StatelessWidget {
  
final Article noticia;
final index;

  const _Noticia({
    @required this.noticia, 
    @required this.index
    } 
    ) ;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _TarjetaTopBar(this.noticia, this.index),
        _TarjetaTitulo(this.noticia),
        _TrajetaImagen(this.noticia),
        _TarjetaBody( this.noticia),
        _TarjetasBotones(noticia: noticia),
        SizedBox(height: 10),
        Divider()

      ],

    );
  }
}

class _TarjetasBotones extends StatelessWidget {
  const _TarjetasBotones({
  
    this.noticia,
  });

  final Article noticia;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RawMaterialButton(
            onPressed: (){},
            fillColor: miTema.accentColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Icon(Icons.star_border),
          ),
          SizedBox(width: 10,),
             RawMaterialButton(
            onPressed: (){},
            fillColor: Colors.lightBlue,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Icon(Icons.more),
          )

        ],
      ),
    );
  }
}

class _TarjetaBody extends StatelessWidget {
  const _TarjetaBody(   
   this.noticia,
  );

  final Article noticia;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child:Text((noticia.description != null)? noticia.description:'') ,
    );
  }
}

class _TrajetaImagen extends StatelessWidget {
final Article noticia;

  const _TrajetaImagen( this.noticia) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
            child: Container(
          child:(noticia.urlToImage !=null)
          ?FadeInImage(
            placeholder: AssetImage('assets/img/giphy.gif'),
             image: NetworkImage(this.noticia.urlToImage)
             )
             :Image(image: AssetImage('assets/img/no-image.png'))
        ),
      ),
    );
  }
}

class _TarjetaTitulo extends StatelessWidget {
 final Article noticia;

  const _TarjetaTitulo( this.noticia) ;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.symmetric(horizontal: 15) ,
      child:Text(noticia.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)) ,
    );
  }
}

class _TarjetaTopBar extends StatelessWidget {
  final Article noticia;
  final int index;

  const _TarjetaTopBar( this.noticia, this.index);
 

  @override
  Widget build(BuildContext context) {
    return Container(
padding: EdgeInsets.symmetric(horizontal: 10),
margin:  EdgeInsets.only(bottom:10),
      child: Row(
        children: <Widget>[
          Text('${index +1}.', style: TextStyle(color: miTema.accentColor),),
          Text('${noticia.source.name}.')
        ],
      ),
    );
  }
}
