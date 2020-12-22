"""
Created on 20:37, Dec. 15th, 2020
Author: fassial
Filename: preprocess-sleep-mouse.py
"""
# dep
import os
import cv2
import shutil
import random
import numpy as np
# local dep

# macro
DIR_DATA = os.path.join(os.getcwd(), "..", "..", "data", "sleep-mouse")
DIR_DATA_RAW = os.path.join(DIR_DATA, "raw_data")
DIR_DATA_FRAME = os.path.join(DIR_DATA, "frame_data")
DIR_DATA_GRAY = os.path.join(DIR_DATA, "gray_data")
DIR_DATA_LABEL = os.path.join(DIR_DATA, "label_data")
DIR_DATA_TRAIN = os.path.join(DIR_DATA, "train")
DIR_DATA_TEST = os.path.join(DIR_DATA, "test")
VIDEO_POSTFIX = ".mp4"
PIC_POSTFIX = ".png"
PREFIX_FORMAT = "%s-%s-"
FRAME_FORMAT = "%d-%d-%d.png"

# def get_videos func
def get_videos(src_path = DIR_DATA_RAW):
    # init videos
    videos = []
    # set videos = [(type, name),...]
    for root, dirs, files in os.walk(src_path):
        video_type = os.path.split(root)[-1]
        for video_file in [file for file in files if file[-4:] == VIDEO_POSTFIX]:
            video_name = os.path.splitext(video_file)[0]
            videos.append((video_type, video_name))
    return videos

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

# def split_dataset func
def gen_frame(src_path = DIR_DATA_RAW, frame_params = {
    "video_fps": 20,
    "target_fps": 5,
    "max_sec": 15*60
}, res_path = {
    "frame_data": DIR_DATA_FRAME,
    "gray_data": DIR_DATA_GRAY
}):
    # get video.list & sort
    videos = get_videos(src_path = src_path); print("INFO: Find %d videos." % (len(videos)))
    # mkdir split_data & gray_data
    for subdir in res_path.keys():
        if (not os.path.exists(res_path[subdir])): os.mkdir(res_path[subdir])

    # gen frame
    for i in range(len(videos)):
        print("INFO: Gen frame for No.%d/%d video..." % ((i+1), len(videos)), end = "\r")
        # get video
        video = videos[i]
        # get video_path
        video_path = os.path.join(src_path, video[0], video[1]+VIDEO_POSTFIX)
        # set frame_path & gray_path
        frame_path = os.path.join(res_path["frame_data"], video[0])
        if (not os.path.exists(frame_path)): os.mkdir(frame_path)
        frame_path = os.path.join(frame_path, video[1])
        if (not os.path.exists(frame_path)): os.mkdir(frame_path)
        gray_path = os.path.join(res_path["gray_data"], video[0])
        if (not os.path.exists(gray_path)): os.mkdir(gray_path)
        gray_path = os.path.join(gray_path, video[1])
        if os.path.exists(gray_path): continue
        os.mkdir(gray_path)
        # cap video
        video_cap = cv2.VideoCapture(video_path)
        # get fps(cv2 error)
        video_fps = video_cap.get(cv2.CAP_PROP_FPS) if (frame_params["video_fps"] == None) else frame_params["video_fps"]
        fps_ratio = video_fps // frame_params["target_fps"]
        # init n_frame & success
        n_frame, success = 0, True
        # read video_cap
        while (success):
            success, frame = video_cap.read()
            if (success == True\
            and n_frame % fps_ratio == 0\
            and n_frame / video_fps < frame_params["max_sec"]):
                # save frame
                cv2.imwrite(os.path.join(frame_path, FRAME_FORMAT % ((n_frame/(video_fps*60)), (n_frame/video_fps)%60, (n_frame//fps_ratio)%(video_fps//fps_ratio))), frame)
                # save gray_frame
                frame_gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
                cv2.imwrite(os.path.join(gray_path, FRAME_FORMAT % ((n_frame/(video_fps*60)), (n_frame/video_fps)%60, (n_frame//fps_ratio)%(video_fps//fps_ratio))), frame_gray)
            n_frame += 1
        video_cap.release()
    print("INFO: Gen frame for videos(totla %d) complete!" % (len(videos)))

# now, the struct of /data looks like:
# data
#  |-raw_data
#  |-frame_data
#  |-gray_data
# then we have to sample frame randomly
# to build trainset and label data,
# and then we have to generate trainset
# from train, testset from the rest

# def sample_labelset func
def sample_labelset(src_path = DIR_DATA_GRAY, sample_params = {
    "sample_ratio": 0.005
}, res_path = {
    "label_data": DIR_DATA_LABEL
}):
    # get pics
    pics = get_pics(src_path = src_path)

    # mkdir label_data/img
    if (os.path.exists(res_path["label_data"])): shutil.rmtree(res_path["label_data"])
    os.mkdir(res_path["label_data"])
    res_path["label_data"] = os.path.join(res_path["label_data"], "img")
    os.mkdir(res_path["label_data"])

    # sample labelset
    for (pic_type, pic_name) in pics:
        # set pic_dir
        pic_dir = os.path.join(src_path, pic_type, pic_name)
        # start sample
        for pic in os.listdir(pic_dir):
            if random.random() < sample_params["sample_ratio"]:
                shutil.copyfile(
                    src = os.path.join(pic_dir, pic),
                    dst = os.path.join(res_path["label_data"], (PREFIX_FORMAT % (pic_type, pic_name))+pic)
                )
            
    return

# now, the struct of /data looks like:
# data
#  |-raw_data
#  |-frame_data
#  |-gray_data
#  |-label_data
#      |-img
# then we have to label the img in
# label_data(using PS to binary img)

# label data is not a func, you need
# to do it yourself

# now, the struct of /data looks like:
# data
#  |-raw_data
#  |-frame_data
#  |-gray_data
#  |-label_data
#      |-img
#      |-label
# then we need to generate dataset from
# label_data

# def gen_dataset func
def gen_dataset(src_path = {
    "gray_data": DIR_DATA_GRAY,
    "label_data": DIR_DATA_LABEL
}, sample_params = {
    "test_ratio": 0.005
}, res_path = {
    "train": DIR_DATA_TRAIN,
    "test": DIR_DATA_TEST
}):
    # get pics
    pics = get_pics(src_path = src_path["gray_data"])
    # get labels
    labels = os.listdir(os.path.join(src_path["label_data"], "label"))
    # mkdir train & test
    if (os.path.exists(res_path["train"])): shutil.rmtree(res_path["train"])
    os.mkdir(res_path["train"])
    os.mkdir(os.path.join(res_path["train"], "img")); os.mkdir(os.path.join(res_path["train"], "label"))
    if (os.path.exists(res_path["test"])): shutil.rmtree(res_path["test"])
    os.mkdir(res_path["test"])
    os.mkdir(os.path.join(res_path["test"], "img"))

    # gen trainset
    for label in labels:
        # copy origin pic
        pic_img = cv2.imread(os.path.join(src_path["label_data"], "img", label))
        pic_img = cv2.cvtColor(pic_img, cv2.COLOR_BGR2GRAY)
        cv2.imwrite(os.path.join(res_path["train"], "img", label), pic_img)
        # copy label pic
        pic_label = cv2.imread(os.path.join(src_path["label_data"], "label", label))
        pic_label = cv2.cvtColor(pic_label, cv2.COLOR_BGR2GRAY)
        cv2.imwrite(os.path.join(res_path["train"], "label", label), pic_label)
    # gen testset
    for (pic_type, pic_name) in pics:
        # set pic_dir
        pic_dir = os.path.join(src_path["gray_data"], pic_type, pic_name)
        # start sample
        for pic in os.listdir(pic_dir):
            # get pic_fname
            pic_fname = (PREFIX_FORMAT % (pic_type, pic_name))+pic
            if pic_fname in labels: continue
            elif random.random() < sample_params["test_ratio"]:
                pic_img = cv2.imread(os.path.join(pic_dir, pic))
                pic_img = cv2.cvtColor(pic_img, cv2.COLOR_BGR2GRAY)
                cv2.imwrite(os.path.join(res_path["test"], "img", pic_fname), pic_img)

# now, the struct of /data looks like:
# data
#  |-raw_data
#  |-frame_data
#  |-gray_data
#  |-label_data
#      |-img
#      |-label
#  |-train
#      |-img
#      |-label
#  |-test
#      |-img

if __name__ == "__main__":
    # gen frame
    gen_frame(src_path = DIR_DATA_RAW, frame_params = {
        "video_fps": 20,
        "target_fps": 5,
        "max_sec": 15*60
    }, res_path = {
        "frame_data": DIR_DATA_FRAME,
        "gray_data": DIR_DATA_GRAY
    })
    # # sample labelset
    # sample_labelset(src_path = DIR_DATA_GRAY, sample_params = {
    #     "sample_ratio": 0.005
    # }, res_path = {
    #     "label_data": DIR_DATA_LABEL
    # })
    # # gen dataset
    # gen_dataset(src_path = {
    #     "gray_data": DIR_DATA_GRAY,
    #     "label_data": DIR_DATA_LABEL
    # }, sample_params = {
    #     "test_ratio": 0.005
    # }, res_path = {
    #     "train": DIR_DATA_TRAIN,
    #     "test": DIR_DATA_TEST
    # })

