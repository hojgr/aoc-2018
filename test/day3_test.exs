defmodule Aoc2018.Day3Test do
    use ExUnit.Case
    doctest Aoc2018.Day3
  
    test "part one - parse instruction" do
        assert Aoc2018.Day3.parse_instruction("#1 @ 1,3: 4x4") == {1, {1,3}, {4,4}}
    end

    test "part one - expand_instruction" do
        expanded = Aoc2018.Day3.expand_instruction(
            {1, {1,3}, {3,2}}
        )
        assert expanded == [
            {1, {1,3}}, {1, {1,4}}, {1, {2,3}}, {1, {2,4}}, {1, {3,3}}, {1, {3,4}}, 
        ]
    end

    test "part one - process one instruction" do
        state = Aoc2018.Day3.process_instruction(Map.new, {1, {1,3}})
        
        assert state == %{
            {1,3} => [1] 
        }
    end

    test "part one - string instruction set to map" do
        assert Aoc2018.Day3.instructions_to_map([
            "#1 @ 1,3: 4x4",
            "#2 @ 3,1: 4x4",
            "#3 @ 5,5: 2x2"
        ]) == %{
                                                    {3,1} => [2]  , {4,1} => [2]  , {5,1} => [2], {6,1} => [2],
                                                    {3,2} => [2]  , {4,2} => [2]  , {5,2} => [2], {6,2} => [2],
                        {1,3} => [1], {2,3} => [1], {3,3} => [2,1], {4,3} => [2,1], {5,3} => [2], {6,3} => [2],
                        {1,4} => [1], {2,4} => [1], {3,4} => [2,1], {4,4} => [2,1], {5,4} => [2], {6,4} => [2],
                        {1,5} => [1], {2,5} => [1], {3,5} => [1]  , {4,5} => [1]  , {5,5} => [3], {6,5} => [3],
                        {1,6} => [1], {2,6} => [1], {3,6} => [1]  , {4,6} => [1]  , {5,6} => [3], {6,6} => [3],
        }
    end

    test "part one - count fabric with two or more claims" do
        count = Aoc2018.Day3.count_with_more_than_one_claim(%{{2,3} => [1], {3,3} => [2,1], {4,3} => [2,1]})

        assert count == 2
    end

    test "part two - find not overlapping claim" do
        assert Aoc2018.Day3.find_not_overlapping_claim(%{
                                        {3,1} => [2]  , {4,1} => [2]  , {5,1} => [2], {6,1} => [2],
                                        {3,2} => [2]  , {4,2} => [2]  , {5,2} => [2], {6,2} => [2],
            {1,3} => [1], {2,3} => [1], {3,3} => [2,1], {4,3} => [2,1], {5,3} => [2], {6,3} => [2],
            {1,4} => [1], {2,4} => [1], {3,4} => [2,1], {4,4} => [2,1], {5,4} => [2], {6,4} => [2],
            {1,5} => [1], {2,5} => [1], {3,5} => [1]  , {4,5} => [1]  , {5,5} => [3], {6,5} => [3],
            {1,6} => [1], {2,6} => [1], {3,6} => [1]  , {4,6} => [1]  , {5,6} => [3], {6,6} => [3],
        }) == 3
    end

  end
  