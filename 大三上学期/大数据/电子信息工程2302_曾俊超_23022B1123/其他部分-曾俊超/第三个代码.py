# program1-4.py
x = int(input("请输入一个数:"))
if x < 5:
    y=0
elif 5<=x<10:
    y=5*x-25
else:
    y=pow(x-5,2)
print(y)
