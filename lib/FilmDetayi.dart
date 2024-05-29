import 'package:flutter/material.dart';
import 'package:gridview_film_uygulamasi_flutter/Filmler.dart';

class FilmDetayi extends StatefulWidget {
  Filmler film;

  FilmDetayi({required this.film});

  @override
  State<FilmDetayi> createState() => _FilmDetayiState();
}

class _FilmDetayiState extends State<FilmDetayi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.limeAccent,
      appBar: AppBar(
        title: Text(widget.film.film_ismi),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 345,
                height: 505,
                child: Image.asset("fotolar/${widget.film.film_foto_ismi}"),
            ),
            Text("${widget.film.fiyat} \u{20BA}", style: TextStyle(fontSize: 31, fontWeight: FontWeight.bold, color: Colors.pink),),
            SizedBox(
              width: 150,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  foregroundColor: Colors.white,
                ),
                onPressed:(){
                print("${widget.film.film_ismi} kiralandı.");
              }, child: const Text("Kirala"),),
            )
            ],
        ),
      ),

    );
  }
}
