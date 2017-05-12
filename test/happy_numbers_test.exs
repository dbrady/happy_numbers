defmodule HappyNumbersTest do
  use ExUnit.Case
  doctest HappyNumbers

  test "happiness" do
    assert HappyNumbers.happy?(1) == true
    assert HappyNumbers.happy?(20) == false
    assert HappyNumbers.happy?(42) == false
    assert HappyNumbers.happy?(10000) == true
  end
end
