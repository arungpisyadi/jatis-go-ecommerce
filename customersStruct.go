package main

import (
	"os"

	"github.com/gocarina/gocsv"
)

type Client struct {
	ID					int 	`csv:"ID"`
	companyName			string	`csv:"companyName"`
	firstName			string	`csv:"firstName"`
	lastName			string	`csv:"lastName"`
	billingAddress		string	`csv:"billingAddress"`
	city				string	`csv:"city"`
	state				string	`csv:"state"`
	zip					string	`csv:"zip"`
	email				string	`csv:"email"`
	companyWebsite		string	`csv:"companyWebsite"`
	phone				string	`csv:"phone"`
	fax					string	`csv:"fax"`
	shipAddress			string	`csv:"shipAddress"`
	shipCity			string	`csv:"shipCity"`
	shipState			string	`csv:"shipState"`
	shipZip				string	`csv:"shipZip"`
	shipPhone			string	`csv:"shipPhone"`
}

func main() {
	in, err := os.Open("csvs/customers.csv")
	if err != nil {
		panic(err)
	}
	defer in.Close()

	clients := []*Client{}

	if err := gocsv.UnmarshalFile(in, &clients); err != nil {
		panic(err)
	}
}