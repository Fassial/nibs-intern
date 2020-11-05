"""
Created on 09:43, Nov. 4th, 2020
Author: fassial
Filename: preprocess.py
"""
# dep
import os
import cv2
import shutil
# local dep

# macro
DATASET = os.path.join(os.getcwd(), "..", "data")
RESULTS_SPLIT = os.path.join(DATASET, "split_data")
RESULTS_BINARY= os.path.join(DATASET, "binary_data")
RESULTS_LABEL = os.path.join(DATASET, "label_data")
DATASET_TRAIN = os.path.join(DATASET, "train")
DATASET_TEST  = os.path.join(DATASET, "test")
FRAM_FORMAT = "%d-%d-%d.png"

# def split_dataset func
def split_dataset(src_path = DATASET, res_path = {"split_data":RESULTS_SPLIT, "binary_data":RESULTS_BINARY}):
    # get video.list & sort
    videos = os.listdir(src_path); videos = list(filter(lambda f:f[-4:] in [".avi"], videos))
    # videos.sort(key=lambda x:int(x[-2:-1]))
    # mkdir split_data & binary_data
    for subdir in res_path.keys():
        if (os.path.exists(res_path[subdir])): shutil.rmtree(res_path[subdir])
        os.mkdir(res_path[subdir])
    # start split
    for video in videos:
        # cap video
        video_cap = cv2.VideoCapture(os.path.join(src_path, video))
        # get fps
        video_fps = video_cap.get(cv2.CAP_PROP_FPS)
        # init n_fram & success
        n_fram, success = 0, True
        # read video_cap
        while (success):
            success, frame = video_cap.read()
            if (success == True):
                # save frame
                cv2.imwrite(os.path.join(res_path["split_data"], FRAM_FORMAT % ((n_fram/(video_fps*60)), (n_fram/video_fps)%60, n_fram%video_fps)), frame)
                # save binary_frame
                frame_gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
                frame_gray = cv2.medianBlur(frame_gray, 5)
                frame_bin = cv2.adaptiveThreshold(frame_gray,255,cv2.ADAPTIVE_THRESH_MEAN_C,\
                    cv2.THRESH_BINARY,3,5)
                cv2.imwrite(os.path.join(res_path["binary_data"], FRAM_FORMAT % ((n_fram/(video_fps*60)), (n_fram/video_fps)%60, n_fram%video_fps)), frame_bin)
            n_fram += 1
        video_cap.release()

# then we have to label split data
# mkdir RESULTS_LABEL
# data
#  |-mouse.avi
#  |-split_data
#  |-binary_data
#  |-label_data

# def gen_dataset func
# we hope to have the following struct
# data
#  |-mouse.avi
#  |-split_data
#  |-binary_data
#  |-label_data
#  |-train
#     |-img
#     |-label
#  |-test
#     |-img
def gen_dataset(dataset_cfg = {
    "split_data": RESULTS_SPLIT,
    "label_data": RESULTS_LABEL,
    "train": DATASET_TRAIN,
    "test": DATASET_TEST
}, n_col = 2, n_row = 2):
    # mkdir train
    if (os.path.exists(dataset_cfg["train"])): shutil.rmtree(dataset_cfg["train"])
    os.mkdir(dataset_cfg["train"])
    # mkdir train subdir
    img_subdir = os.path.join(dataset_cfg["train"], "img"); os.mkdir(img_subdir)
    label_subdir = os.path.join(dataset_cfg["train"], "label"); os.mkdir(label_subdir)
    # mkdir test
    if (os.path.exists(dataset_cfg["test"])): shutil.rmtree(dataset_cfg["test"])
    os.mkdir(dataset_cfg["test"])
    # mkdir test subdir
    img_subdir = os.path.join(dataset_cfg["test"], "img"); os.mkdir(img_subdir)
    # gen dataset
    # get filelists
    train_filelists = os.listdir(dataset_cfg["label_data"])
    all_filelists = os.listdir(dataset_cfg["split_data"])
    test_filelists = list(set(all_filelists).difference(set(train_filelists)))
    # separate train frame
    for train_file in train_filelists:
        img = cv2.imread(os.path.join(dataset_cfg["split_data"], train_file))
        label = cv2.imread(os.path.join(dataset_cfg["label_data"], train_file))
        row_step, col_step = img.shape[0]//n_row, img.shape[1]//n_col
        for i in range(n_row):
            for j in range(n_col):
                img_roi = img[(i*row_step):((i+1)*row_step), (j*col_step):((j+1)*col_step)]
                cv2.imwrite(os.path.join(dataset_cfg["train"], "img", os.path.splitext(train_file)[0]+"-"+str((i*n_col)+j)+os.path.splitext(train_file)[1]), img_roi)
                label_roi = label[(i*row_step):((i+1)*row_step), (j*col_step):((j+1)*col_step)]
                cv2.imwrite(os.path.join(dataset_cfg["train"], "label", os.path.splitext(train_file)[0]+"-"+str((i*n_col)+j)+os.path.splitext(train_file)[1]), label_roi)
    # separate test frame
    for test_file in test_filelists:
        img = cv2.imread(os.path.join(dataset_cfg["split_data"], test_file))
        row_step, col_step = img.shape[0]//n_row, img.shape[1]//n_col
        for i in range(n_row):
            for j in range(n_col):
                img_roi = img[(i*row_step):((i+1)*row_step), (j*col_step):((j+1)*col_step)]
                cv2.imwrite(os.path.join(dataset_cfg["test"], "img", os.path.splitext(test_file)[0]+"-"+str((i*n_col)+j)+os.path.splitext(test_file)[1]), img_roi)
    return

if __name__ == "__main__":
    # split_dataset()
    gen_dataset()

