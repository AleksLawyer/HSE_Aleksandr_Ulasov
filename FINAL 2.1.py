def roman_to_int(s: str) -> int:
    roman_values = {
        'I': 1,
        'V': 5,
        'X': 10,
        'L': 50,
        'C': 100,
        'D': 500,
        'M': 1000
    }

    total = 0
    previous_value = 0

    for char in s[::-1]:
        current_value = roman_values[char]

        if current_value >= previous_value:
            total += current_value
        else:
            total -= current_value

        previous_value = current_value

    return total


s1 = roman_to_int("MCMXCIV")
print(s1)
