defmodule Aoc2018.Day2 do
    def checksum(words) do
        words
            |> Enum.map(&(&1 |> analyze_word |> unique_counts))
            |> List.flatten
            |> count_occurences
            |> Map.values
            |> Enum.reduce(1, &(&1 * &2))
    end

    def analyze_word(word) do
        word_charlist = String.graphemes word
        char_groups = Enum.reduce(
            word_charlist,
            [],
            fn c, acc ->
                Keyword.update acc, String.to_atom(c), 1, &(&1+1)
            end
        )

        Enum.filter char_groups, fn {_, value} ->
            case value do
                1 -> false
                _ -> true
            end
        end
    end

    def unique_counts(counts) do
        counts
            |> keyword_list_to_value_list
            |> Enum.uniq
    end

    defp keyword_list_to_value_list(kwlist) do
        Enum.map kwlist, fn {_, value} -> 
            value
        end
    end

    def count_occurences(occurence_list) do
        Enum.reduce occurence_list, %{}, fn number, acc ->
            Map.update acc, number, 1, &(&1 + 1)
        end
    end

    # ----

    def find_common_letters(box_names) do
        [b1, b2] = Enum.filter(box_names, fn box_name ->
           with_diff_1 = Enum.filter(box_names, &(box_name_diff(&1, box_name) == 1)) 

           case Enum.count(with_diff_1) do
               1 -> true
               _ -> false
           end
        end)

        get_common_chars(
            String.graphemes(b1),
            String.graphemes(b2)
        )
    end

    def box_name_diff(box1_name, box2_name) do
        box1_name_list = String.graphemes box1_name
        box2_name_list = String.graphemes box2_name

        box_name_diff_list box1_name_list, box2_name_list
    end

    defp box_name_diff_list(box1_name, box2_name, diff \\ 0)
    defp box_name_diff_list([], [], diff) do
        diff
    end

    defp box_name_diff_list([b1_char | box1_name_tail], [b2_char | box2_name_tail], diff) do
        case b1_char == b2_char do
            true ->
                box_name_diff_list box1_name_tail, box2_name_tail, diff
            false ->
                box_name_diff_list box1_name_tail, box2_name_tail, diff + 1
        end
    end

    def get_common_chars(box1_name_list, box2_name_list, common \\ "")
    def get_common_chars([], [], common) do
        common
    end
    def get_common_chars([b1_char | box1_name_tail], [b2_char | box2_name_tail], common) do
        case b1_char == b2_char do
            true ->
                get_common_chars(box1_name_tail, box2_name_tail, common <> b1_char)
            false ->
                get_common_chars(box1_name_tail, box2_name_tail, common)
        end
    end
end