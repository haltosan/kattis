n = parse(Int, readline())

let nums = [parse(Int, readline()) for _ in 1:1:n], mx = -1

	a = 0
	b = sum(nums)
	c = 0
	for i in firstindex(nums):lastindex(nums)-1
		a += nums[i]^2
		b -= nums[i]
		c = a*b
		if c > mx
			mx = c
		end
	end
	print("$(mx)\n")
end
