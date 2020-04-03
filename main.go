package main

import (
	"log"
	"os"
	ignore "github.com/codeskyblue/dockerignore"
)

func main() {
	patterns, err := ignore.ReadIgnoreFile(".dockerignore")
	if err != nil {
		log.Fatal(err)
	}

	isSkip, err := ignore.Matches(os.Args[1], patterns)
	if err != nil {
		log.Fatal(err)
	}
	if isSkip {
		os.Exit(1)
	} else {
		os.Exit(0)
	}
}
