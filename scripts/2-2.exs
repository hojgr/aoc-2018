#!/usr/bin/env elixir

input = IO.read(:stdio, :all)

IO.puts Aoc2018.Day2.find_common_letters(String.split(input, "\n"))