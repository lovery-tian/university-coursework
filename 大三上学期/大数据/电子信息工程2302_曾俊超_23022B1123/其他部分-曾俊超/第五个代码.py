#program1-44.py
import turtle

# 定义颜色列表
colors = ["red", "orange", "yellow", "green", "blue", "indigo", "violet"]

# 绘制螺旋图案
turtle.speed(0)  # 设置最快速度
for i in range(360):
    turtle.pencolor(colors[i % 7])  # 循环使用颜色
    turtle.forward(i)  # 前进i像素
    turtle.right(59)    # 右转59度

turtle.done()  # 完成绘图
