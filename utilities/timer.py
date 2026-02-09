# a script to calculate the time presalers etc.

internal_clock = 400e6
arr_range = 2**16

prescaler = 19999
prescaler += 1  # because the value in the register is prescaler - 1

timer_clock = internal_clock / prescaler

period_duration = arr_range / timer_clock
print(f"prescaler: {prescaler}")
print(f"timer clock: {timer_clock/1e6} MHz")
print(f"Resolution: {1/timer_clock*1e6} us")
print(f"period duration: {period_duration} seconds")
print(f"period frequency: {1/period_duration} Hz")