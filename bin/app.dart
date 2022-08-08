import 'package:console/console.dart';

//Estudiante: Carlos Daniel Peñaloza Torres - 2172336

// [1.8] En una clase se estaba decidiendo la actividad que se realizaría como finalización de
// curso. En total se propusieron 12 actividades y cada estudiante debía votar por 1 de ellas.
// Los 35 estudiantes hacen su votación y se representan en un array.
// Como organizador de la actividad debes informar al grupo cuál fue el resultado de la
// votación indicando el número de votos por cada opción.

void main(List<String> arguments) {
  initVotacion();
}

Future<void> initVotacion() async {
  final votos = List.filled(35, "");              ///Array de 35 nodos
  final resultadoVotacion = List.filled(12, 0);   ///Array de 12 nodos
  final repo = Repo();

  Console.init();

  for (int i = 0; i < 35; i++) {
    print("${repo.title} \n");

    final opc = setVoto(repo.opcMenu, i+1);

    votos[i] = opc;
  }

  int cont = 0;

  for (int i = 0; i < 12; i++) {
    for (int j = 0; j < 35; j++) {
      if (votos[j] == repo.opcMenu[i]) {
        cont++;
      }
    }
    resultadoVotacion[i] = cont;
    cont = 0;
  }

  print(repo.resultado);

  for (int i = 0; i < 12; i++) {
    print("${repo.opcMenu[i]} =  ${resultadoVotacion[i]}");
  }
}


String setVoto(List<String> opc, int estudiante) {
  var chooser = Chooser<String>(
    opc,
    message: '\nSeleccione una opción estudiante: $estudiante -> ',
  );
  return chooser.chooseSync();
}

class Repo {
  String title = '''
===================================
        ACTIVIDADES PROPUESTAS
===================================
''';

  String resultado = '''
===================================
        RESULTADO DE VOTACIÓN
===================================
''';

  var opcMenu = [
    "actividadUno   ",
    "actividadDos   ",
    "actividadTres  ",
    "actividadCuatro",
    "actividadCinco ",
    "actividadSeis  ",
    "actividadSiete ",
    "actividadOcho  ",
    "actividadNueve ",
    "actividadDies  ",
    "actividadOnce  ",
    "actividadDoce  "
  ];

  static final Repo _singleton = Repo._internal();
  factory Repo() => _singleton;
  Repo._internal();
}
