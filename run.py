#!/usr/bin/python3
import os
import random
import subprocess
import re

ans=random.randint(100,10000)

print("You are forced to read\t"+str(ans))
print("now begin")

output=subprocess.getoutput('./bin/iat_record_sample -m -d4')

# print("-----------------")
# print(output)
# print("-----------------")
try:
	m=re.findall(r'Result.*',output)
	if(len(m)==0):
		print("The content you say is wrong")
		exit(0)

	print("Your answer "+m[0])

	num=re.findall(r'\d{3,}',output)
	result=int(num[0])

	if ans==result:
		print("answer is right")
	else:
		print("answer is wrong")
except:
	print("The content you say is wrong")
	exit(0)