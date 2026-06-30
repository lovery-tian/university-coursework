# program1-5.py
number = int(input('请输入一个正整数：'))
count = 0
while number != 0:
    number //= 10
    count += 1
print('%d是一个%d位数'%(number,count))
