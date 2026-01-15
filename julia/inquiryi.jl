n = parse(Int, readline())

let nums = [parse(Int, readline()) for _ in 1:1:n]

	function f(k)
		a = sum(map((i->i^2), nums[begin:k]))
		b = sum(nums[k+1:end])
		return a*b
	end
	l = f.(firstindex(nums):lastindex(nums)-1)
	m = reduce(max, l)
	print("$(m)\n")
end
