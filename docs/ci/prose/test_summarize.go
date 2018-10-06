package main // example4 begin

import (
	"fmt"

	"github.com/jdkato/prose/summarize"
)

func main() {
	doc := summarize.NewDocument("This is some interesting text.")
	fmt.Println(doc.SMOG(), doc.FleschKincaid())
} // example4 end
