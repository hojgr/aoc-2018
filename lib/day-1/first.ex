defmodule Aoc2018.Day1 do
    def process_frequencies(str) do
        frequencies = Enum.map String.split(str, "\n"), &(&1 |> String.to_integer)

        Enum.reduce frequencies, &(&1+&2)
    end
    def process_looping_frequencies(str) do
        frequencies = Enum.map String.split(str, "\n"), &(&1 |> String.to_integer)

        find_first_freq_that_appears_twice frequencies, 0, [0]
    end

    defp find_first_freq_that_appears_twice([freq_change | tail], freq, reached_freqs) do
        new_freq = freq + freq_change

        cond do
            Enum.member?(reached_freqs, new_freq) -> 
                new_freq
            true -> 
                find_first_freq_that_appears_twice tail ++ [freq_change], new_freq, [new_freq|reached_freqs]
        end
    end
end