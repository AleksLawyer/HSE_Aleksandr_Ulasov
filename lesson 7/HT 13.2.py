def is_palindrome(num):
    num_str = str(num)
    if num_str == num_str[::-1]:
        print("True")
        return True

    else:
        print("False")
        return False


is_palindrome(909)
