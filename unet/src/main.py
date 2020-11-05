import os
from model import *
from data import *

#os.environ["CUDA_VISIBLE_DEVICES"] = "0"


data_gen_args = dict(rotation_range=0.2,
                    width_shift_range=0.05,
                    height_shift_range=0.05,
                    shear_range=0.05,
                    zoom_range=0.05,
                    horizontal_flip=True,
                    fill_mode='nearest')
os.mkdir("../data/train/aug")
myGene = trainGenerator(2,'../data/train','img','label',data_gen_args,save_to_dir = "../data/train/aug")

model = unet()
model_checkpoint = ModelCheckpoint('unet_mouse.hdf5', monitor='loss',verbose=1, save_best_only=True)
model.fit_generator(myGene,steps_per_epoch=300,epochs=5,callbacks=[model_checkpoint])
# model.load_weights("unet_mouse.hdf5")

testGene = testGenerator("../data/test/img")
results = model.predict_generator(testGene,steps=30,verbose=1)
os.mkdir("../data/test/predict")
saveResult("../data/test/predict",results)
