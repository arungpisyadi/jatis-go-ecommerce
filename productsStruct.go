package main

import (
	"os"

	"github.com/gocarina/gocsv"
)

type Client struct {
	ID int `csv:"ID"`
	name string `csv:"name"`
	unitPrice float64 `csv:"unitPrice"`
	inStock bool `csv:"inStock"`
}

func main() {
	in, err := os.Open("csvs/products.csv")
	if err != nil {
		panic(err)
	}
	defer in.Close()

	clients := []*Client{}

	if err := gocsv.UnmarshalFile(in, &clients); err != nil {
		panic(err)
	}
}