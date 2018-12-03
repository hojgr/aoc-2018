defmodule Aoc2018.Day3 do

    def instructions_to_map(instructions) do
        instructions
            |> Enum.map(&parse_instruction/1)
            |> Enum.map(&expand_instruction/1)
            |> List.flatten
            |> Enum.reduce(Map.new, &(process_instruction(&2, &1)))
    end

    def parse_instruction(instruction) do
        case Regex.run(~r/#([0-9]+) @ ([0-9]+),([0-9]+): ([0-9]+)x([0-9]+)/, instruction) do
            [_, id, x, y, width, height] ->
                {
                    String.to_integer(id), 
                    {
                        String.to_integer(x),
                        String.to_integer(y)
                    },
                    {
                        String.to_integer(width), 
                        String.to_integer(height)
                    }
                }
        end
    end

    def expand_instruction({id, {x, y}, {width, height}}) do
        expanded_nested = Enum.map(0..(width-1), fn xplus ->
            Enum.map(0..(height-1), fn yplus ->
                {id, {x + xplus, y + yplus}}
            end)
        end)

        List.flatten expanded_nested
    end

    def process_instruction(state, []) do
        state
    end

    def process_instruction(state, {id, {x, y}}) do
        Map.update(
            state,
            {x, y},
            [id],
            &([id | &1])
        )
    end

    def count_with_more_than_one_claim(map) do
        map
            |> Map.values
            |> Enum.filter(&(Enum.count(&1) > 1))
            |> Enum.count
    end

    def find_not_overlapping_claim(claim_map) do
        claim_values_list = Map.values claim_map

        Enum.reduce(
            claim_values_list,
            Enum.uniq(List.flatten(claim_values_list)),
            fn claims, acc ->
                case Enum.count(claims) do
                    1 ->
                        acc
                    _ ->
                        delete_from_list(acc, claims)
                end
            end
        ) |> List.first
    end

    defp delete_from_list(acc, []) do
        acc
    end

    defp delete_from_list(acc, claims_to_remove) do
        Enum.filter(
            acc,
            fn claim ->
                not Enum.member?(claims_to_remove, claim)
            end
        )
    end
end