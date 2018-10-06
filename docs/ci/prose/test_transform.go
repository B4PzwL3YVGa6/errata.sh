package main // example3 begin

import (
	"fmt"
	"strings"

	"github.com/jdkato/prose/transform"
)

func main() {
	text := "the last of the mohicans"
	tc := transform.NewTitleConverter(transform.APStyle)
	if strings.Title(text) != "The Last Of The Mohicans" {
		panic("title failed")
	} else if tc.Title(text) != "The Last of the Mohicans" {
		panic("title failed")
	}
} // example3 end
