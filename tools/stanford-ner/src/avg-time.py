import re

file = open('../run-log.txt','r')
f_str = file.read()
file.close()

regex = r'CRFClassifier training \.\.\. done \[(\d+,\d+) sec\]\.'
times = re.findall(regex, f_str)

times_cat = [float(i.replace(',','.')) for i in times[::2]]
times_filtered = [float(i.replace(',','.')) for i in times[1::2]]

avg_time_cat = float(sum(times_cat)) / max(len(times_cat),1)
avg_time_filtered = float(sum(times_filtered)) / max(len(times_filtered),1)

print(avg_time_cat) #700.40s
print(avg_time_filtered) #309.30s

print(sum(times_cat+times_filtered)) #40381.7s - 11.21713889h - 11h13min