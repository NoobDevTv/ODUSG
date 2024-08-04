class Player {
  const Player(
      {required this.name,
      required this.bad,
      required this.keyWord,
      required this.keyWordSet});

  final String name;
  final bool bad;
  final String keyWord;
  final List<String> keyWordSet;
}
