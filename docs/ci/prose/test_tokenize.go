package main // example1 begin

import (
	"fmt"

	"github.com/jdkato/prose/tokenize"
)

func main() {
	text := "They'll save and invest more."
	tokenizer := tokenize.NewTreebankWordTokenizer()

	expected := []string{"They", "'ll", "save", "and", "invest", "more", "."}
	for i, word := range tokenizer.Tokenize(text) {
		if expected[i] != word {
			panic("tokenize failed")
		}
		fmt.Println(word)
	}
} // example1 end
