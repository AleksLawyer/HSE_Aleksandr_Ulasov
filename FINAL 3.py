def is_monotonic(nums):
    increasing = all(nums[i] <= nums[i + 1] for i in range(len(nums) - 1))
    decreasing = all(nums[i] >= nums[i + 1] for i in range(len(nums) - 1))
    return increasing or decreasing


nums1 = [1, 2, 2, 3]
nums2 = [6, 5, 4, 4]
nums3 = [1, 3, 2]

print(is_monotonic(nums3))
