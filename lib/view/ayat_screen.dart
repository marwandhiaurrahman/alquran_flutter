import 'package:flutter/material.dart';

import '../api/alquran_api.dart';
import '../model/ayat.dart';

// ignore: must_be_immutable
class AyatScreen extends StatefulWidget {
  int nomorsurat;

  AyatScreen({super.key, required this.nomorsurat});

  @override
  State<AyatScreen> createState() => _AyatScreenState();
}

class _AyatScreenState extends State<AyatScreen> {
  late Future<Ayat> futureAyat;
  late AlquranApi alquranApi;
  String namaSurat = "Surat";
  String artiSurat = "Arti Surat";

  @override
  void initState() {
    super.initState();
    alquranApi = AlquranApi();
    futureAyat = alquranApi.fetchAyat(widget.nomorsurat);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: FutureBuilder(
            future: futureAyat,
            builder: (context, snapshot) {
              var surat = snapshot.data;
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Text(
                      surat!.namaLatin,
                    ),
                    Text(
                      surat.arti,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            }),
      ),
      body: Center(
        child: FutureBuilder(
          future: futureAyat,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.ayat.length,
                  itemBuilder: (context, index) {
                    var ayat = snapshot.data!.ayat[index];
                    return ListTile(
                      title: Text(
                        ayat.ar.toString(),
                        textAlign: TextAlign.right,
                        style: const TextStyle(fontSize: 20),
                      ),
                      subtitle: Text(ayat.idn.toString()),
                      leading: Text(ayat.nomor.toString()),
                      onTap: () {},
                    );
                  });
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );

    // return ;
  }
}
