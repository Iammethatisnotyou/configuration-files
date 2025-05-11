from tkinter import *
from tkinter import ttk
import os
import glob
import subprocess

dir = "/home/LiamUSR/Pictures/Backgrounds"

def entries():
    raw_items = os.listdir(dir)
    items=[]
    for i in raw_items:
        if "." in i:
            item = os.path.splitext(i)[0]
        else:
            item = i + "/"
        items.append(item)
    return raw_items, items

def construct():
    root = Tk()
    root.title("Wallpaper")
    frm = ttk.Frame(root, padding=10)
    frm.grid()
    return root, frm

def key_presses(root):
    esc_key = root.bind('<Escape>', lambda event: root.destroy())
    return esc_key

def main():
    raw_items, items = entries()

    root, frm = construct()
    esc_key = key_presses(root)
    ttk.Label(frm, text="Wallpaper").grid(column = 0, row = 0)
    ttk.Button(frm, text="Quit", command=root.destroy).grid(column = 0, row = 1)

    search_button = Button(frm, text="Search").grid(column = 50, row = 1)

    txt= Text(root)
    txt.insert('1.0','''Enter Text here...''')

    number=2
    for i in items:
        ttk.Label(frm, text=i).grid(columns = 2, row = number)
        number+=1

    root.mainloop()

if __name__ == '__main__':
    main()
