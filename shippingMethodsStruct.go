package main

import (
	"os"

	"github.com/gocarina/gocsv"
)

type Client struct {
	ID int `csv:"ID"`
	method string `csv:"method"`
}

func main() {
	in, err := os.Open("csvs/shipping_methods.csv")
	if err != nil {
		panic(err)
	}
	defer in.Close()

	clients := []*Client{}

	if err := gocsv.UnmarshalFile(in, &clients); err != nil {
		panic(err)
	}
}