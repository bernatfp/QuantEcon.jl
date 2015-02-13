using PyPlot

# Exercise 1
function factorial2(n)
	res = n
	for i in 1:n-1
		res *= n-i
	end
	return res
end

# Exercise 2
function binomial_rv(n, p)
	return (rand() >= p) ? 1 : 0
end

# Exercise 3
function pi_mc(steps)
	radius = 1
	outside = 0
	inside = 0
	for i in 1:steps
		if rand()^2 + rand()^2 <= 1
			inside += 1
		else
			outside += 1
		end
	end
	area = 4*inside/(inside+outside)
	pi = area/radius^2
end

# Exercise 4
function random_device()
	v = 0
	for i in 1:10
		if rand() >= 0.5
			v += 1
		else
			v = 0
		end
		
		if v == 3
			return 1
		end
	end
	return 0
end

# Exercise 5
function correlated_time_series(T, alpha)
	xt = Array(Float64, T)
	xt[1] = 0
	for t in 2:T
		xt[t] = alpha * xt[t-1] + randn()
	end
	return xt
end

PyPlot.plot(correlated_time_series(200, 0.9))

# Exercise 6
plot(correlated_time_series(200,0.0), label="alpha = 0.0")
plot(correlated_time_series(200,0.8), label="alpha = 0.8")
plot(correlated_time_series(200,0.98), label="alpha = 0.98")
legend()
show()



