package main

import (
	"os"

	"github.com/gocarina/gocsv"
)

type Client struct {
	ID int `csv:"ID"`
	orderID int `csv:"orderID"`
	productID int `csv:"productID"`
	quantity float64 `csv:"quantity"`
	price float64 `csv:"price"`
	discount float64 `csv:"discount"`
}

func main() {
	in, err := os.Open("csvs/order_details.csv")
	if err != nil {
		panic(err)
	}
	defer in.Close()

	clients := []*Client{}

	if err := gocsv.UnmarshalFile(in, &clients); err != nil {
		panic(err)
	}
}