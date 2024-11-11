// Fonctions qui visent à formatter une valeur, ou récupérer une valeur à partir d'autres valeurs.
String formatNumberWithPoints(int number) {
  String numberString = number.toString();
  final regExp = RegExp(r'(\d)(?=(\d{3})+(?!\d))');
  return numberString.replaceAllMapped(regExp, (match) => '${match[1]}.');
}

String formatNumberWithSpaces(int number) {
  String numberString = number.toString();
  final regExp = RegExp(r'(\d)(?=(\d{3})+(?!\d))');
  return numberString.replaceAllMapped(regExp, (match) => '${match[1]} ');
}

int calculatePercentage(int part, int total) {
  double percentage = (part / total) * 100;
  return percentage.round();
}
