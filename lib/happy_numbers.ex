defmodule HappyNumbers do
  @moduledoc """
  Ask yourself: "Am I a *happy* number?"

  Rule 1: The number 1 is happy.
  Rule 2: A number is happy if the sum of the squares of its digits is happy.
  Rule 3: Otherwise, it is unhappy.

  Or, stated another way: if a recursive function of summing the squares of the
  digits of a number reaches 1, the number is happy.

  1. Take a number, say 79. Is it happy?
  2. Sum the squares of each digit, so 7*7=49 + 9*9=81 = 49+81 = 130. Is 130 happy?
  3. Sum the squares of each digit, so 1*1=1 + 3*3=9 = 10. Is 10 happy?
  4. Sum the squares of each digit, so 1*1=1 + 0*0=0 = 1. Is 1 happy? Yes!
  5. Therefore 10 is happy.
  6. Therefore 130 is happy.
  7. Therefore 79 is happy.
  8. HOORAY!

  But... what happens if a number is NOT happy? The answer is you'll never reach
  the number one. The only way to do this, it turns out, is for the numbers to
  enter a cycle that loops around forever.

  Example:
  1. Take a number, say 8. Is it happy?
  2. To sum things up a bit, 8 -> 16 -> 37 -> 58 -> 89 -> 145 -> 42 -> 20 -> 4.
  3. But 4*4 = 16, and we've seen 16 go by already, it leads to 37. And so on,
  around and around. We'll never reach 1.
  4. Therefore, 8 is unhappy.
  5. BOO!

  How do we test a number for happiness on a computer, then? I suppose we could
  recursively apply the function and if the program ever finishes, we know the
  number is happy. There are some runtime implications for unhappy numbers here,
  however.

  A better approach is to ask if the recursively applied function enters a
  cycle. A simple way to test for this is to keep track of each number we've
  calculated, and if we see it a second time, we know we're cycling and
  therefore unhappy.

  In Ruby/Python/C I would create some kind of collection to keep track of the
  numbers I've already calculated. I'd consult this at each step of the
  function, and return false if the value was already present. If the number
  were not already seen, I would add it to the collection and proceed to the
  next step of recursion.

  In Elixir, we can't have a mutable collection hanging around for everybody to
  access in a parallel shared fashion. We're going to have to pass a collection
  in, along with the number to test, at each step. If we're not at 1 and we
  haven't seen this new number yet, we pass in the collection with the new
  number appended and carry on.
  """

  def happy?(num) do
    # IO.puts '--------------------'
    # IO.puts num
    happy? num, []
  end

  def happy?(1, _), do: true

  def happy?(num, list) do
    # IO.puts "Checking #{num} against #{inspect(list)}"
    if Enum.member?(list, num) do
      # IO.puts "#{num} is a member of #{inspect(list)}"
      false
    else
      new_num = next_num(num)
      happy?(new_num, list ++ [num])
    end
  end

  def next_num(num) do
    Integer.digits(num)
      |> Enum.map( fn x -> :math.pow(x,2) end)
      |> Enum.sum
      |> round
  end
end
