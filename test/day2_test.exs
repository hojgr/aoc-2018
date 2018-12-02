defmodule Aoc2018.Day2Test do
    use ExUnit.Case
    doctest Aoc2018.Day2
  
    test "part one - check letters abcdef" do
        assert Aoc2018.Day2.analyze_word("abcdef") == []
    end
  
    test "part one - check letters bababc" do
        assert Aoc2018.Day2.analyze_word("bababc") == [b: 3, a: 2]
    end
  
    test "part one - check letters abbcde" do
        assert Aoc2018.Day2.analyze_word("abbcde") == [b: 2]
    end
  
    test "part one - check letters abcccd" do
        assert Aoc2018.Day2.analyze_word("abcccd") == [c: 3]
    end
  
    test "part one - check letters aabcdd" do
        assert Aoc2018.Day2.analyze_word("aabcdd") == [a: 2, d: 2]
    end
  
    test "part one - check letters abcdee" do
        assert Aoc2018.Day2.analyze_word("abcdee") == [e: 2]
    end
  
    test "part one - check letters ababab" do
        assert Aoc2018.Day2.analyze_word("ababab") == [a: 3, b: 3]
    end

    test "part one - unique_counts" do
        assert Aoc2018.Day2.unique_counts(a: 3, b: 3) == [3]
        assert Aoc2018.Day2.unique_counts(a: 3) == [3]
        assert Aoc2018.Day2.unique_counts(a: 2, b: 3) == [2, 3]
    end

    test "part one - count_occurences" do
        assert Aoc2018.Day2.count_occurences([2, 2, 2, 3, 4]) == %{2 => 3, 3 => 1, 4 => 1}
    end

    test "part one - checksum" do
        assert Aoc2018.Day2.checksum([
            "abcdef",
            "bababc",
            "abbcde",
            "abcccd",
            "aabcdd",
            "abcdee",
            "ababab",
        ]) == 12
    end

    test "part two - find_common_letters" do
        assert Aoc2018.Day2.find_common_letters([
            "abcde",
            "fghij",
            "klmno",
            "pqrst",
            "fguij",
            "axcye",
            "wvxyz",
        ]) == "fgij"
    end
    
    test "part two - box_name_diff fghij/fguij" do
        assert Aoc2018.Day2.box_name_diff("fghij", "fguij") == 1
    end

    test "part two - box_name_diff abcde/axcye" do
        assert Aoc2018.Day2.box_name_diff("abcde", "axcye") == 2
    end

    test "part two - get_common_chars fghij/fguij" do
        assert Aoc2018.Day2.get_common_chars(
            String.graphemes("fghij"),
            String.graphemes("fguij")
        ) == "fgij"
    end
  end
  