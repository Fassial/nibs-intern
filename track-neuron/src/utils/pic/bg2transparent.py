###################################
# Created on 14:46, Feb. 10th, 2021
# Author: fassial
# Filename: bg2transparent.py
###################################
# dep
import os
import PIL.Image as Image
# local dep

# macro
DIR_ROOT = os.path.join(os.getcwd())
DIR_DATA = os.path.join(DIR_ROOT, "data")
DIR_OUTPUTS = os.path.join(DIR_ROOT, "outputs")
FILE_DATA = os.path.join(DIR_DATA, "bg2transparent.png")
FILE_OUTPUT = os.path.join(DIR_OUTPUTS, "bg2transparent.png")

# def bg2transparent func
def bg2transparent(src_path, dst_path):
    # get src img
    img = Image.open(src_path)
    # convert to RGBA format
    img = img.convert("RGBA")
    # get bg_color
    bg_color = img.getpixel((0, 0))
    # exec bg2transparent
    for l in range(img.size[0]):
        for h in range(img.size[1]):
            dot = (l, h)
            dot_color = img.getpixel(dot)
            if dot_color == bg_color:
                dot_color = dot_color[:-1] + (0,)
                img.putpixel(dot, dot_color)
    # write into dst_path
    img.save(dst_path)

if __name__ == "__main__":
    # mkdir
    if not os.path.exists(DIR_OUTPUTS): os.mkdir(DIR_OUTPUTS)
    # inst bg2transparent
    bg2transparent(
        src_path = FILE_DATA,
        dst_path = FILE_OUTPUT
    )
