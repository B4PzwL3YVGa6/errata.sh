package main // example2 begin

import (
	"fmt"

	"github.com/jdkato/prose/tag"
	"github.com/jdkato/prose/tokenize"
)

func main() {
	text := "A fast and accurate part-of-speech tagger for Golang."
	words := tokenize.NewTreebankWordTokenizer().Tokenize(text)

	tagger := tag.NewPerceptronTagger()
	for _, tok := range tagger.Tag(words) {
		fmt.Println(tok.Text, tok.Tag)
	}
} // example2 end
