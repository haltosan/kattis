function bad1()
	let line = readline(), tot = 0
		Threads.@threads for i in line
			if isletter(i)
				tot += 1
			end
		end
		print(tot)
	end
end

function sum_letters(a)
	tot = 0
	for i in a
		if isletter(i)
			tot += 1
		end
	end
	return tot
end

function good_partition()
	let line = readline(), tot = 0
		chunks = Iterators.partition(line, cld(length(line), Threads.nthreads()))
		tasks = map(chunks) do chunk
			Threads.@spawn sum_letters(chunk)
		end
		chunk_sums = fetch.(tasks)
		print(sum(chunk_sums))
	end
end

function good_locks()
	mutex = ReentrantLock()
	tot = 0
	line = readline()
	Threads.@threads for i in line
		if isletter(i)
			@lock mutex tot += 1
		end
	end
	print(tot)
end

function good_locks_2()
	mutex = ReentrantLock()
	tot = 0
	line = readline()
	Threads.@threads for i in line
		if isletter(i)
			lock(mutex)
			try
				tot += 1
			finally
				unlock(mutex)
			end
		end
	end
	print(tot)
end

function good_atomic()
	tot = Threads.Atomic{Int}(0)
	line = readline()
	Threads.@threads for i in line
		if isletter(i)
			Threads.atomic_add!(tot, 1)
		end
	end
	print(tot[])
end

