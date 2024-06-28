def fib(n):
    if n <= 1:
        return n
    else:
        return (fib(n-1) + fib(n-2))


n = int(input("Введите номер числа в последовательности Фибоначчи:"))
print("Последовательность Фибоначчи:")
for i in range(n):
    print(fib(i))
