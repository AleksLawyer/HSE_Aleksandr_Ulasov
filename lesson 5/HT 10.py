import random

array = [random.randint(1, 1000000) for _ in range(100000)]
dict_array = [{"num_1": random.randint(1, 1000000), "num_2": random.randint(1, 1000000)} for _ in range(100000)]

def bubble_sort(arr):
    n = len(arr)
    for i in range(n-1):
        for j in range(n-i-1):
            if arr[j] > arr[j+1]:
                arr[j], arr[j+1] = arr[j+1], arr[j]


bubble_sort(array)
dict_array.sort(key=lambda x: (x["num_1"], x["num_2"]))
print("Отсортированный первый массив:", array)
print("Отсортированный второй массив:", dict_array)






