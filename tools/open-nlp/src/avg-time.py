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

# train = (4 levels * 10 folds * 4 repeats = 160)
times = times[:160]

times_cat = [getSeconds(i) for i in times[::4]]
times_types = [getSeconds(i) for i in times[1::4]]
times_subtypes = [getSeconds(i) for i in times[2::4]]
times_filtered = [getSeconds(i) for i in times[3::4]]

avg_time_cat = mean(times_cat)
avg_time_types = mean(times_types)
avg_time_subtypes = mean(times_subtypes)
avg_time_filtered = mean(times_filtered)


print(avg_time_cat) #21.825s
print(avg_time_types) #52.075s
print(avg_time_subtypes) #44.075s
print(avg_time_filtered) #16.275s

print(sum(times_cat+times_types+times_subtypes+times_filtered)) #5370s - 1h30