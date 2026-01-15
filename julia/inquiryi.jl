n = parse(Int, readline())

let nums = [parse(Int, readline()) for _ in 1:1:n]

	function f(k)
		a = sum(map((i->i^2), nums[begin:k]))
		b = sum(nums[k+1:end])
		return a*b
	end
	last = -1
	for i in lastindex(nums)-1:-1:firstindex(nums)
		ans = f(i)
		if ans < last
			print("$(last)\n")
			exit(0)
		end
		last = ans
	end
	print("$(last)\n")
end
