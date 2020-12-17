##################################
# Modified on 16:40, Nov 5th, 2020
# Modifier: fassial
# Filename: main.py
##################################
# dep
import os
import shutil
# local dep
from model import *
from data import *

# macro
EXPR_CURR = ["mouse", "sleep-mouse"][1]
DATASET = os.path.join("..", "data")
DATA_GEN_ARGS = dict(
    rotation_range=0.2,
    width_shift_range=0.05,
    height_shift_range=0.05,
    shear_range=0.05,
    zoom_range=0.05,
    horizontal_flip=True,
    fill_mode='nearest'
)
MODEL_HDF5 = "unet-%s.hdf5"

def run_expr(expr_name = "mouse"):
    # init dataset loc
    dataset_curr = os.path.join(DATASET, expr_name)
    dataset_train= os.path.join(dataset_curr, "train")
    dataset_test = os.path.join(dataset_curr, "test")
    model_hdf5 = (MODEL_HDF5 % expr_name)

    # init unet-model
    # use lr = 1e-5(not 1e-4), loss < 0.02, more stable
    model = unet(lr = 1e-5)

    # mkdir trainset dirs
    train_aug_dir = os.path.join(dataset_train, "aug")
    if os.path.exists(train_aug_dir): shutil.rmtree(train_aug_dir)
    os.mkdir(train_aug_dir)
    # get traindataset
    trainset = trainGenerator(
        batch_size = 2,
        train_path = dataset_train,
        image_folder = "img",
        mask_folder = "label",
        aug_dict = DATA_GEN_ARGS,
        save_to_dir = train_aug_dir
    )
    # load model_hdf5
    if (os.path.exists(model_hdf5)): model.load_weights(model_hdf5)
    # start train
    model_checkpoint = ModelCheckpoint(model_hdf5,
        monitor = 'loss',
        verbose = 1,
        save_best_only = True
    )
    model.fit_generator(trainset,
        steps_per_epoch = 100,
        epochs = 5,
        callbacks=[model_checkpoint]
    )

    # mkdir testset dirs
    test_pred_dir = os.path.join(dataset_test, "predict")
    if os.path.exists(test_pred_dir): shutil.rmtree(test_pred_dir)
    os.mkdir(test_pred_dir)
    # get testset
    testset = testGenerator(os.path.join(dataset_test, "img"))
    # start test
    filelists = os.listdir(os.path.join(dataset_test, "img")); filelists.sort()
    results = model.predict_generator(testset, len(filelists), verbose = 1)
    saveResult(test_pred_dir, results, filelists)

if __name__ == "__main__":
    run_expr(expr_name = EXPR_CURR)

