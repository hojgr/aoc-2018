#!/usr/bin/env elixir

input = IO.read(:stdio, :all)

instructions = String.split(input, "\n")

result = Aoc2018.Day3.find_not_overlapping_claim(
    Aoc2018.Day3.instructions_to_map(instructions)
)

IO.inspect(result)