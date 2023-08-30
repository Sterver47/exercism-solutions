int score(String word) {
  int score = 0;
  for (var i = 0; i < word.length; i++) {
    score += letterScore[word[i].toUpperCase()]!;
  }
  return score;
}

const Map<String, int> letterScore = {
  // 1:
  'A': 1,
  'E': 1,
  'I': 1,
  'O': 1,
  'U': 1,
  'L': 1,
  'N': 1,
  'R': 1,
  'S': 1,
  'T': 1,
  // 2:
  'D': 2,
  'G': 2,
  // 3:
  'B': 3,
  'C': 3,
  'M': 3,
  'P': 3,
  // 4:
  'F': 4,
  'H': 4,
  'V': 4,
  'W': 4,
  'Y': 4,
  // 5:
  'K': 5,
  // 8:
  'J': 8,
  'X': 8,
  // 10:
  'Q': 10,
  'Z': 10
};
