#!/usr/bin/env elixir

input = IO.read(:stdio, :all)

IO.puts Aoc2018.Day2.checksum(String.split(input, "\n"))