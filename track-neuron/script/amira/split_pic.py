###################################
# Created on 15:11, Feb. 12nd, 2021
# Author: fassial
# Filename: split_pic.py
###################################
# dep
import os
import shutil
# local dep

# macro
EXPR_CURR = "amira"
PIC_FORMAT = "png"
PIC_TRANSP = PIC_FORMAT + ".transparent"
PIC_SPLIT = PIC_FORMAT + ".split"
DIR_ROOT = os.path.join(os.getcwd(), "..", "..")
DIR_OUTPUTS = os.path.join(DIR_ROOT, "outputs")
DIR_OUTPUTS_AMIRA = os.path.join(DIR_OUTPUTS, EXPR_CURR)
SPLIT_POINTS = [{
    "start": 0,
    "end": 452,
    "reverse": False,
    "dname": "start"
}, {
    "start": 453,
    "end": 1827,
    "reverse": True,
    "dname": "cycle"
}]

# def main func
def main():
    for comp in os.listdir(DIR_OUTPUTS_AMIRA):
        if os.path.isdir(os.path.join(DIR_OUTPUTS_AMIRA, comp)):
            # set dir_tp & dir_sps
            dir_tp = os.path.join(DIR_OUTPUTS_AMIRA, comp, PIC_TRANSP)
            dir_sps = os.path.join(DIR_OUTPUTS_AMIRA, comp, PIC_SPLIT)
            if not os.path.exists(dir_sps): os.mkdir(dir_sps)
            else: continue
            # split pic
            for pic in os.listdir(dir_tp):
                n_pic = int(pic.split(sep = ".")[-2])
                for sp in SPLIT_POINTS:
                    # set dir_sp
                    dir_sp = os.path.join(DIR_OUTPUTS_AMIRA, comp, PIC_SPLIT, sp["dname"])
                    if not os.path.exists(dir_sp): os.mkdir(dir_sp)
                    # check whether in range
                    if n_pic >= sp["start"] and n_pic <= sp["end"]:
                        pic_fname = ("%04d" % (n_pic - sp["start"])) + "." + pic.split(sep = ".")[-1]
                        if sp["reverse"]: pic_fname = ("%04d" % (sp["end"] - n_pic)) + "." + pic.split(sep = ".")[-1]
                        shutil.copyfile(
                            src = os.path.join(dir_tp, pic),
                            dst = os.path.join(dir_sp, pic_fname)
                        )

if __name__ == "__main__":
    main()
