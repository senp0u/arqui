import random

with open("numbers.txt", "a") as f:
    for i in range(2048):
        f.write(str(random.randint(0, 1000000))+"\n")
    f.close()
