from random import randint

f = open("random.txt", "w")
fa = open("answer.txt", "w")

n = 1000
f.write("%d\n" % n)

array = [randint(-2**31, 2**31-1) for i in range(n)]
for i in array:
    f.write("%d " % i)

array.sort()

for i in array:
    fa.write("%d " % i)

fa.write("\n")

f.close()
fa.close()
