defmodule Walutomierz.Sources.InternetowyKantor do
  @behaviour Walutomierz.Sources.BaseSource
  @allowed_currencies [:eur, :usd, :gbp, :chf]
  @source_url "https://internetowykantor.pl/cms/currency_money/"

  def get_currency_info(currency) when currency in @allowed_currencies do
    @source_url
    |> HTTPoison.get!
    |> parse_currency_info
    |> Poison.decode!
    |> parse_currency_info(currency)
  end
  def get_currency_info(_) do
    {:error, :currency_not_supported}
  end

  defp parse_currency_info(%{"rates" => map}, currency) do
    currency_code =
      currency
      |> to_string
      |> String.upcase
    map
    |> Map.fetch!(currency_code)
    |> Map.fetch!("buying_rate")
  end
  defp parse_currency_info(%{body: response_body}) do
    response_body
  end
end
