#! ruby -w

## Hipoteza 3n+1
## Wersja z funkcja udajaca funkcje wyzszego rzedu

# zabawa z procami
stop        = lambda { |n| n <= 1 }
even        = lambda { |n| n % 2 == 0 }

odd_action  = lambda { |n| 3*n + 1 }
even_action = lambda { |n| n / 2 }

def conjecture(n, stop, pred, t_action, f_action)
	if stop.call(n) then
		0
	else
		action = pred.call(n) ? t_action : f_action
		n2     = action.call(n)
		return 1 + conjecture(n2, stop, pred, t_action, f_action)
	end
end

print "n = "
t = Integer(gets)
puts conjecture(t, stop, even, even_action, odd_action)