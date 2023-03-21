import 'package:alquran_flutter/view/ayat_screen.dart';
import 'package:flutter/material.dart';

import '../api/alquran_api.dart';
import '../model/surat.dart';

class SuratScreen extends StatefulWidget {
  const SuratScreen({super.key});

  @override
  State<SuratScreen> createState() => _MyAppState();
}

class _MyAppState extends State<SuratScreen> {
  late Future<List<Surat>> futureSurat;

  late AlquranApi alquranApi;

  @override
  void initState() {
    super.initState();
    alquranApi = AlquranApi();
    futureSurat = alquranApi.fetchSurat();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Al-Quran',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Al-Quran'),
        ),
        body: Center(
          child: FutureBuilder(
            future: futureSurat,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // print();
                return
                    // const Text('ok');
                    ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    var surat = snapshot.data![index];
                    return ListTile(
                      title: Text(
                        surat.namaLatin,
                      ),
                      subtitle: Text(surat.arti),
                      leading: Text(surat.nomor.toString()),
                      trailing: Text(surat.nama),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AyatScreen(
                                    nomorsurat: surat.nomor,
                                  )),
                        );
                      },
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
