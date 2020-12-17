###################################
# Created on 17:17, Dec. 16th, 2020
# Author: fassial
# Filename: vconvert.py
###################################
# dep
import os
import sys
import argparse
# local dep

# macro
FFMPEG_FORMAT = "ffmpeg -i %s %s"

# set parser
parser_vconvert = argparse.ArgumentParser(description='Video Convertor')
parser_vconvert.add_argument('-s', '--src', choices=['wmv'],
        default='wmv',
        help='Source file type.')
parser_vconvert.add_argument('-d', '--dst', choices=['mp4'],
        default='mp4',
        help='Dest file type.')
parser_vconvert.add_argument('-r', '--ref', type=str,
        help='Video directory.')
args = parser_vconvert.parse_args()

# def vconvert func
def vconvert(src_path, convert_params = {
    "src_type": "wmv",
    "dst_type": "mp4"
}):
    # get videos & 
    videos = os.listdir(src_path)
    videos = list(filter(lambda f:f[-4:] == ("."+convert_params["src_type"]), videos))
    # start convert
    for video in videos:
        video_name = os.path.splitext(video)[0]
        os.system(FFMPEG_FORMAT %\
            (os.path.join(src_path, video_name+"."+convert_params["src_type"]),\
             os.path.join(src_path, video_name+"."+convert_params["dst_type"]))\
        )

"""
Usage:
    python vconvert.py -r ./videos -s wmv -d mp4
"""
if __name__ == "__main__":
    vconvert(
        src_path = args.ref,
        convert_params = {
            "src_type": args.src,
            "dst_type": args.dst
        }
    )

