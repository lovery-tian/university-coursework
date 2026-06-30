# program1-2.py
PM=eval(input("请输入PM2.5的值："))
if 0<=PM<35:
    print("优")
elif 35<=PM<=75:
    print("良")
else:
    print("污染")
