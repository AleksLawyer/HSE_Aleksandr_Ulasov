rom_num = {
    'I': 1,
    'V': 5,
    'X': 10,
    'L': 50,
    'C': 100,
    'D': 500,
    'M': 1000,
}

def rom_num_to_dec(s):
    sum = 0
    for i in range(len(s) - 1):
        left = s[i]
        right = s[i + 1]
        if rom_num[left] < rom_num[right]:
            sum -= rom_num[left]
        else:
            sum += rom_num[left]
    sum += rom_num[s[-1]]
    return sum


s1 = "III"
s2 = "LVIII"
s3 = "MCMXCIV"
s4 = "XIX"
print(rom_num_to_dec(s4))
