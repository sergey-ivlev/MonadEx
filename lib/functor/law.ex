defmodule Functor.Law do
  @moduledoc false

  use Monad.Operators

  # fmap id ≡ id
  @doc false
  def identity?(functor) do
    ((& &1) <|> functor) == functor
  end

  # fmap (f . g) ≡ fmap f . fmap g
  @doc false
  def composition?(functor, fun1, fun2) do
    ((& fun1.(fun2.(&1))) <|> functor) == (fun1 <|> (fun2 <|> functor))
  end
end
