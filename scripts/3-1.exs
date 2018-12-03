#!/usr/bin/env elixir

input = IO.read(:stdio, :all)

instructions = String.split(input, "\n")

IO.puts Aoc2018.Day3.count_with_more_than_one_claim(
    Aoc2018.Day3.instructions_to_map(instructions)
)