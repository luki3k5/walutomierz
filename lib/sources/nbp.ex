defmodule Walutomierz.Sources.Nbp do
  @behaviour Walutomierz.Sources.BaseSource
  @allowed_currencies [:eur, :usd, :gbp, :chf]
  @source_url "http://api.nbp.pl/api/exchangerates/rates/c/:currency:/today/"


  def get_currency_info(currency) when currency in @allowed_currencies do
    currency
    |> prepare_url_for_currency
    |> HTTPoison.get!
    |> parse_currency_info
    |> Poison.decode!
    |> parse_currency_info
  end
  def get_currency_info(_) do
    {:error, :currency_not_supported}
  end

  defp prepare_url_for_currency(currency) when currency in @allowed_currencies do
    @source_url |> String.replace(":currency:", to_string(currency))
  end

  defp parse_currency_info(%{body: response_body}) do
    response_body
  end
  defp parse_currency_info(%{"rates" => table}) do
    table
    |> hd()
    |> Map.fetch!("bid")
  end
end
