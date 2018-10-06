package main // example5 begin

import (
	"fmt"

	"github.com/jdkato/prose/chunk"
	"github.com/jdkato/prose/tag"
	"github.com/jdkato/prose/tokenize"
)

func main() {
	words := tokenize.TextToWords("Go is an open source programming language created at Google.")
	regex := chunk.TreebankNamedEntities
	tagger := tag.NewPerceptronTagger()
	for _, entity := range chunk.Chunk(tagger.Tag(words), regex) {
		fmt.Println(entity) // [Go Google]
	}
} // example5 end
