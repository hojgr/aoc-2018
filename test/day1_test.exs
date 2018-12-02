defmodule Aoc2018.Day1Test do
    use ExUnit.Case
    doctest Aoc2018.Day1
  
    test "part one - only additions" do
        assert Aoc2018.Day1.process_frequencies("+1\n+1\n+1") == 3
    end
    
    test "part one - mixed input" do
        assert Aoc2018.Day1.process_frequencies("+1\n+1\n-2") == 0
    end

    test "part one - only subtractions" do
        assert Aoc2018.Day1.process_frequencies("-1\n-2\n-3") == -6
    end

    test "part two - reaches 0 twice" do
        assert Aoc2018.Day1.process_looping_frequencies("+1\n-1") == 0
    end

    test "part two - reaches 10 twice" do
        assert Aoc2018.Day1.process_looping_frequencies("+3\n+3\n+4\n-2\n-4") == 10
    end

    test "part two - reaches 5 twice" do
        assert Aoc2018.Day1.process_looping_frequencies("-6\n+3\n+8\n+5\n-6") == 5
    end

    test "part two - reaches 14 twice" do
        assert Aoc2018.Day1.process_looping_frequencies("+7\n+7\n-2\n-7\n-4") == 14
    end
  end
  