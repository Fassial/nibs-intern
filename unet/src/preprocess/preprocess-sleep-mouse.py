"""
Created on 20:37, Dec. 15th, 2020
Author: fassial
Filename: preprocess-sleep-mouse.py
"""
# dep
import os
import cv2
import shutil
import numpy as np
# local dep

# macro
DIR_DATA = os.path.join(os.getcwd(), "..", "..", "data", "sleep-mouse")
DIR_DATA_RAW = os.path.join(DIR_DATA, "raw_data")
DIR_DATA_FRAME = os.path.join(DIR_DATA, "frame_data")
DIR_DATA_GRAY = os.path.join(DIR_DATA, "gray_data")
VIDEO_POSTFIX = ".wmv"
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

# def split_dataset func
def gen_frame(src_path = DIR_DATA_RAW, res_path = {
    "frame_data": DIR_DATA_FRAME,
    "gray_data": DIR_DATA_GRAY
}):
    # get video.list & sort
    videos = get_videos(); print("INFO: Find %d videos." % (len(videos)))
    # mkdir split_data & gray_data
    for subdir in res_path.keys():
        if (os.path.exists(res_path[subdir])): shutil.rmtree(res_path[subdir])
        os.mkdir(res_path[subdir])

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
        gray_path = os.path.join(res_path["gray_data"], video[0])
        if (not os.path.exists(gray_path)): os.mkdir(gray_path)
        # cap video
        video_cap = cv2.VideoCapture(video_path)
        # get fps
        video_fps = video_cap.get(cv2.CAP_PROP_FPS)
        # init n_fram & success
        n_fram, success = 0, True
        # read video_cap
        while (success):
            success, frame = video_cap.read()
            if (success == True):
                # save frame
                cv2.imwrite(os.path.join(frame_path, FRAME_FORMAT % ((n_fram/(video_fps*60)), (n_fram/video_fps)%60, n_fram%video_fps)), frame)
                # save gray_frame
                frame_gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
                cv2.imwrite(os.path.join(gray_path, FRAME_FORMAT % ((n_fram/(video_fps*60)), (n_fram/video_fps)%60, n_fram%video_fps)), frame_gray)
            n_fram += 1
        video_cap.release()
    print("INFO: Gen frame for videos(totla %d) complete!" % (len(videos)))

# now, the struct of /data looks like:
# data
#  |-raw_data
#  |-frame_data
#  |-gray_data
# then we have to sample frame randomly
# to build trainset and label data

# def sample_trainset func
def sample_trainset():
    # TODO

# now, the struct of /data looks like:
# data
#  |-raw_data
#  |-frame_data
#  |-gray_data
#  |-train
#      |-img
#      |-label
# then we have to generate trainset
# from train, testset from the rest

# def gen_dataset func
def gen_dataset():
    # TODO

# # now, the struct of /data looks like:
# data
#  |-raw_data
#  |-frame_data
#  |-gray_data
#  |-train
#      |-img
#      |-label
#  |-test
#      |-img

if __name__ == "__main__":
    gen_frame()
    # sample_trainset()
    # gen_dataset()

