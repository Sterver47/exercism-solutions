class Anagram {
  Set<String> findAnagrams(String word, List<String> candidates) {
    final wordLower = word.toLowerCase();
    final wordSorted = (wordLower.split('')..sort()).join();

    return candidates.where((candidate) {
      final candidateLower = candidate.toLowerCase();

      if (word.length != candidate.length || wordLower == candidateLower){
        return false;
      }

      return wordSorted == (candidateLower.split('')..sort()).join();
    }).toSet();
  }
}
