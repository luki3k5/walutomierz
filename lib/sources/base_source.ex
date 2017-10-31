defmodule Walutomierz.Sources.BaseSource do
  @callback get_currency_info(arg :: Atom) :: {:ok, String}
end
