class RnaTranscription {
  static const _transMap = {'G': 'C', 'C': 'G', 'T': 'A', 'A': 'U'};

  String toRna(String dna) =>
      dna.split('').map((nucleotide) => _transMap[nucleotide]).join('');
}
