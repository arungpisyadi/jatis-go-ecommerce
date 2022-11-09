package main

import (
	"os"

	"github.com/gocarina/gocsv"
)

type Client struct {
	ID int `csv:"ID"`
	firstName string `csv:"companyName"`
	lastName string	`csv:"firstName"`
	title string `csv:"lastName"`
	phone string `csv:"billingAddress"`
}

func main() {
	in, err := os.Open("csvs/employees.csv")
	if err != nil {
		panic(err)
	}
	defer in.Close()

	clients := []*Client{}

	if err := gocsv.UnmarshalFile(in, &clients); err != nil {
		panic(err)
	}
}