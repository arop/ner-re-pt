import re
import datetime
import time

file = open('../run-log.txt','r')
f_str = file.read()
file.close()

def getSeconds(string):
	x = time.strptime(string,'%Mm%S.%fs')
	return datetime.timedelta(minutes=x.tm_min,seconds=x.tm_sec).total_seconds()

def mean(times):
	return float(sum(times)) / max(len(times),1)

regex = r'real\t(\d+m\d+\.\d+s)'
times = re.findall(regex, f_str)

# train = (4 levels * 10 folds * 4 repeats * 3 algorithms = 480)
times = times[:480]

times_cat_nb = [getSeconds(i) for i in times[::12]]
times_cat_me = [getSeconds(i) for i in times[1::12]]
times_cat_dt = [getSeconds(i) for i in times[2::12]]
times_cat = times_cat_nb + times_cat_me + times_cat_dt

times_types_nb = [getSeconds(i) for i in times[3::12]]
times_types_me = [getSeconds(i) for i in times[4::12]]
times_types_dt = [getSeconds(i) for i in times[5::12]]
times_types = times_types_nb + times_types_me + times_types_dt

times_subtypes_nb = [getSeconds(i) for i in times[6::12]]
times_subtypes_me = [getSeconds(i) for i in times[7::12]]
times_subtypes_dt = [getSeconds(i) for i in times[8::12]]
times_subtypes = times_subtypes_nb + times_subtypes_me + times_subtypes_dt

times_filtered_nb = [getSeconds(i) for i in times[9::12]]
times_filtered_me = [getSeconds(i) for i in times[10::12]]
times_filtered_dt = [getSeconds(i) for i in times[11::12]]
times_filtered = times_filtered_nb + times_filtered_me + times_filtered_dt

avg_time_cat_nb = mean(times_cat_nb)
avg_time_types_nb = mean(times_types_nb)
avg_time_subtypes_nb = mean(times_subtypes_nb)
avg_time_filtered_nb = mean(times_filtered_nb)

avg_time_cat_me = mean(times_cat_me)
avg_time_types_me = mean(times_types_me)
avg_time_subtypes_me = mean(times_subtypes_me)
avg_time_filtered_me = mean(times_filtered_me)

avg_time_cat_dt = mean(times_cat_dt)
avg_time_types_dt = mean(times_types_dt)
avg_time_subtypes_dt = mean(times_subtypes_dt)
avg_time_filtered_dt = mean(times_filtered_dt)

print(avg_time_cat_nb) #2s
print(avg_time_types_nb) #2s
print(avg_time_subtypes_nb) #2s
print(avg_time_filtered_nb) #2s

print(avg_time_cat_me) #116.424s - 1min56
print(avg_time_types_me) #323.125s - 5min23
print(avg_time_subtypes_me) #265.2s - 4min25
print(avg_time_filtered_me) #72.05s - 1min12

print(avg_time_cat_dt) #354.975s - 5min55
print(avg_time_types_dt) #353.7s - 5min54
print(avg_time_subtypes_dt) #352.4s - 5min52 
print(avg_time_filtered_dt) #358.325s - 5min58

print(sum(times_cat+times_types+times_subtypes+times_filtered)) #88188s - 24h30
