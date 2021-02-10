###################################
# Created on 15:14, Feb. 10th, 2021
# Author: fassial
# Filename: amira2transparent.py
###################################
# dep
import os
# local dep
import sys
DIR_ROOT = os.path.join(os.getcwd(), "..", "..")
DIR_SRC = os.path.join(DIR_ROOT, "src")
DIR_SRC_UTILS = os.path.join(DIR_SRC, "utils")
DIR_SRC_UTILS_PIC = os.path.join(DIR_SRC_UTILS, "pic")
sys.path.append(DIR_SRC_UTILS_PIC)
from bg2transparent import bg2transparent

# macro
EXPR_CURR = "amira"
PIC_FORMAT = "png"
RES_DNAME = PIC_FORMAT + ".transparent"
DIR_OUTPUTS = os.path.join(DIR_ROOT, "outputs")
DIR_OUTPUTS_AMIRA = os.path.join(DIR_OUTPUTS, EXPR_CURR)

# def main func
def main():
    for comp in os.listdir(DIR_OUTPUTS_AMIRA):
        if os.path.isdir(os.path.join(DIR_OUTPUTS_AMIRA, comp)):
            # set dir_pic & dir_res
            dir_pic = os.path.join(DIR_OUTPUTS_AMIRA, comp, PIC_FORMAT)
            dir_res = os.path.join(DIR_OUTPUTS_AMIRA, comp, RES_DNAME)
            if not os.path.exists(dir_res): os.mkdir(dir_res)
            else: continue
            # exec bg2transparent
            for pic in os.listdir(dir_pic):
                bg2transparent(
                    src_path = os.path.join(dir_pic, pic),
                    dst_path = os.path.join(dir_res, pic)
                )

if __name__ == "__main__":
    main()
