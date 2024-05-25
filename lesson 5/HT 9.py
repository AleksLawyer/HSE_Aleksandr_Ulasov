import random
import time

step = random.randint(3, 5)
array = list(range(10, 250000001, step))
random_numbers = [random.randint(0, 100) for _ in range(10)]

def linear_search(array, target):
    for i in range(len(array)):
       if array[i] == target:
           return i
           return -1

def binary_search(array, target):
    low = 0
    high = len(array) - 1
    while low <= high:
        mid = (low + high) // 2
        if array[mid] == target:
            return mid
        elif array[mid] < target:
            low = mid + 1
        else:
            high = mid - 1

        return -1

start_time = time.time()
linear_result = [linear_search(array, num) for num in random_numbers]
linear_time = time.time() - start_time
start_time = time.time()
binary_result = [binary_search(array, num) for num in random_numbers]
binary_time = time.time() - start_time
print("Linear Search Result:", linear_result)
print("Linear Search Time:", linear_time)
print("Binary Search Result:", binary_result)
print("Binary Search Time:", binary_time)