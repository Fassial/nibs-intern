"""
Created on 16:20, Dec. 17th, 2020
Author: fassial
Filename: postprocess-sleep-mouse.py
"""
# dep
import os
import cv2
import shutil
import numpy as np
import pandas as pd
import skimage.io as io
# local dep
import sys
DIR_ROOT = os.path.join(os.getcwd(), "..", "..")
DIR_SRC = os.path.join(DIR_ROOT, "src")
sys.path.append(DIR_SRC)
import UNet

# macro
PIC_POSTFIX = ".png"
CSV_POSTFIX = ".csv"
EXPR_CURR = "sleep-mouse"
MODEL_HDF5 = os.path.join(DIR_SRC, "unet-%s.hdf5")
DIR_DATA = os.path.join(DIR_ROOT, "data", EXPR_CURR)
DIR_DATA_GRAY = os.path.join(DIR_DATA, "gray_data")
DIR_OUTPUT = os.path.join(DIR_ROOT, "outputs")
if (not os.path.exists(DIR_OUTPUT)): os.mkdir(DIR_OUTPUT)
DIR_OUTPUT = os.path.join(DIR_OUTPUT, EXPR_CURR)
if (os.path.exists(DIR_OUTPUT)): shutil.rmtree(DIR_OUTPUT)
os.mkdir(DIR_OUTPUT)

# def get_pics func
def get_pics(src_path = DIR_DATA_GRAY):
    # init pics
    pics = []
    # set pics = [(type, name),...]
    for root, dirs, files in os.walk(src_path):
        pic_type, pic_name = os.path.split(os.path.split(root)[0])[-1], os.path.split(root)[-1]
        for video_file in [file for file in files if file[-4:] == PIC_POSTFIX]:
            if (pic_type, pic_name) not in pics: pics.append((pic_type, pic_name))
    return pics

# def cal_centroid func
def cal_centroid(img):
    # convert to gray
    img = img*255; img = img.astype(np.uint8)
    _, img = cv2.threshold(img, img.max()/2, 255, cv2.THRESH_BINARY)
    # cal contours
    _, thresh = cv2.threshold(img, 127, 255, 0, cv2.THRESH_BINARY_INV | cv2.THRESH_OTSU)
    img_cnts, contours, _ = cv2.findContours(thresh, cv2.RETR_TREE, cv2.CHAIN_APPROX_NONE)
    # get img_cnts
    img_cnts = cv2.drawContours(img, contours[0], -1, (0, 255, 0), 1)
    # get moments
    moments = cv2.moments(img_cnts)
    cx = int(moments["m10"] / moments["m00"])
    cy = int(moments["m01"] / moments["m00"])
    return (cx, cy)

# def gen_centroids func
def gen_centroids(src_path = DIR_DATA_GRAY, res_path = DIR_OUTPUT):
    # def cmp func for sort
    def cmp(x):
        x = [int(i) for i in reversed((os.path.splitext(x)[0]).split(sep = "-"))]
        x = [x[i]*(60**i) for i in range(len(x))]
        return sum(x)
    # get pics([(pic_type, pic_name),...])
    pics = get_pics(src_path = src_path)

    # init unet
    unet = UNet.UNet(model_path = (MODEL_HDF5%EXPR_CURR))

    # gen centroids
    for (pic_type, pic_name) in pics:
        # get pic_path & csv_path
        pic_path = os.path.join(DIR_DATA_GRAY, pic_type, pic_name)
        csv_path = os.path.join(DIR_OUTPUT, pic_type)
        if (not os.path.exists(csv_path)): os.mkdir(csv_path)
        csv_path = os.path.join(csv_path, pic_name+CSV_POSTFIX)
        # get pic_fnames
        pic_fnames = os.listdir(pic_path); pic_fnames.sort(key = cmp)

        # init pic_centroids
        pic_centroids = {
            "time": [], 
            "cx": [],
            "cy": []
        }; pic_processed = 0
        for pic_fname in pic_fnames:
            # read pic_img
            pic_img = io.imread(os.path.join(pic_path, pic_fname), as_grey = True)
            # get pic_pred
            pic_pred = unet.predict(X = pic_img)
            # get pic_cx & pic_cy
            pic_cx, pic_cy = cal_centroid(img = pic_pred)
            pic_centroids["time"].append(os.path.splitext(pic_fname)[0])
            pic_centroids["cx"].append(pic_cx)
            pic_centroids["cy"].append(pic_cy)
            # update pic_processed
            pic_processed += 1
            if (pic_processed % 100 == 0) or (pic_processed == len(pic_fnames)):
                print("INFO: processing pic<%s,%s> %d/%d..." % \
                    (pic_type, pic_name, pic_processed, len(pic_fnames)), end = "\r")
        pic_centroids = pd.DataFrame(pic_centroids)
        print("INFO: processing pic<%s,%s> complete with pic_centroids.shape%s." % \
            (pic_type, pic_name, str(pic_centroids.shape)))
        pic_centroids.to_csv(csv_path)

    return

if __name__ == "__main__":
    # gen_centroids
    gen_centroids(
        src_path = DIR_DATA_GRAY,
        res_path = DIR_OUTPUT
    )

