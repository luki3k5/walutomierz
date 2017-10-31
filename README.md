# Walutomierz

Simple Elixir Application for measuring pairs of currencies: EUR/PLN,
USD/PLN, CHF/PLN and GBP/PLN it uses two different sources: 

- www.nbp.pl (polish national bank)
- www.internetowykantor.pl (online currency exchange)

## Usage

Simply call a module with a ```get_currency_info``` function
also pass one of the following supported atoms: :chf, :eur, :gbp or :usd


To use it with the InternetowyKantor:

```
Walutomierz.Sources.InternetowyKantor.get_currency_info(:eur)
```

```
Walutomierz.Sources.InternetowyKantor.get_currency_info(:usd)
```

or for NBP as a source


```
Walutomierz.Sources.Nbp.get_currency_info(:eur)
```

```
Walutomierz.Sources.Nbp.get_currency_info(:usd)
```



