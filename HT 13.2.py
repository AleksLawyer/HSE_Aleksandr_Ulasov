def is_palindrome(num):
    num_str = str(num)
    if num_str == num_str[::-1]:
        return True

    else:
        return False


print(is_palindrome(100))
