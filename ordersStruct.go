package main

import (
	"os"

	"github.com/gocarina/gocsv"
)

type Client struct {
	ID int `csv:"ID"`
	customerID int `csv:"customerID"`
	employeeID int `csv:"employeeID"`
	orderDate string `csv:"orderDate"`
	purchaseOrderNumber string `csv:"purchaseOrderNumber"`
	shipDate string `csv:"shipDate"`
	shippingMethodID int `csv:"shippingMethodID"`
	freightCharge float64 `csv:"freightCharge"`
	taxes float64 `csv:"taxes"`
	paymentReceived bool `csv:"paymentReceived"`
	comment string `csv:"comment"`
}

func main() {
	in, err := os.Open("csvs/orders.csv")
	if err != nil {
		panic(err)
	}
	defer in.Close()

	clients := []*Client{}

	if err := gocsv.UnmarshalFile(in, &clients); err != nil {
		panic(err)
	}
}