// Package strand implements the function ToRNA, that transcribes given DNA to RNA.
package strand

var transMap = map[rune]string{
	'G': "C",
	'C': "G",
	'T': "A",
	'A': "U"}

// ToRNA takes a DNA as a string and transcribes it to RNA, that returns.
func ToRNA(dna string) (rna string) {
	for _, ch := range dna {
		rna += transMap[ch]
	}
	return
}
