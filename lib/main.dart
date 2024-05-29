import 'package:flutter/material.dart';
import 'package:gridview_film_uygulamasi_flutter/FilmDetayi.dart';

import 'Filmler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<List<Filmler>> getirFilm() async{
     var filmler = <Filmler>[];

     var f1 = Filmler(id: 1, film_ismi: "Kaybedenler Kulübü", film_foto_ismi: "kk.webp", fiyat: 17.95);
     var f2 = Filmler(id: 2, film_ismi: "Kolpaçino", film_foto_ismi: "kolpacino.jpg", fiyat: 12.95);
     var f3 = Filmler(id: 3, film_ismi: "Adalet Peşinde", film_foto_ismi: "lawabidingcitizen.webp", fiyat: 19.95);
     var f4 = Filmler(id: 4, film_ismi: "Yüzüklerin Efendisi", film_foto_ismi: "lotr.webp", fiyat: 25.45);
     var f5 = Filmler(id: 5, film_ismi: "Örümcek Adam : Eve Dönüş yok", film_foto_ismi: "orumcek.jpg", fiyat: 23.15);
     var f6 = Filmler(id: 6, film_ismi: "V for Vendetta", film_foto_ismi: "vendetta.jpg", fiyat: 20.65);

     filmler.add(f1);
     filmler.add(f2);
     filmler.add(f3);
     filmler.add(f4);
     filmler.add(f5);
     filmler.add(f6);

     return filmler;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.limeAccent,
      appBar: AppBar(
        title: Text("Filmler"),
      ),
      body: FutureBuilder<List<Filmler>>(
        future: getirFilm(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            var filmler = snapshot.data;
            return GridView.builder(
              itemCount: filmler!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 4/7,
              ),

              itemBuilder: (context, index){

                  var film = filmler[index];
                  
                  return Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                              height: 280,
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => FilmDetayi(film: film,)));
                                },
                                  child: Image.asset("fotolar/${film.film_foto_ismi}"),
                              ),
                          ),
                        ),
                        Text(film.film_ismi, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.pink),),
                        Text("${film.fiyat} \u{20BA}", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.pink),),
                      ],
                    ),
                  );
              },
            );
          }else{
            return Center();
          }
        },
      ),

    );
  }
}
