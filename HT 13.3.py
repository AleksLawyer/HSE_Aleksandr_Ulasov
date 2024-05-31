def find_target_indices(nums, target):
    num_indices = []
    for i in range(len(nums)-1):
        for j in range(i+1, len(nums)):
            if target == nums[i] + nums[j]:
                num_indices.append(i)
                num_indices.append(j)
    print(num_indices)


find_target_indices(nums=[3, 3], target=6)
