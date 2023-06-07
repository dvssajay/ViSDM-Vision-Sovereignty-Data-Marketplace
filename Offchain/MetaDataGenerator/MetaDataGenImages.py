import os
import sys
import json
import cv2
from PIL import Image
import imagehash


def genMeta(images_path):
    imageList = os.listdir(images_path)

    metaData = {}

    for image in imageList:

        data = {}

        img = cv2.imread(images_path + image)
        dimensions = img.shape
        data["dimensions"] = dimensions

        img_pil = Image.open(images_path + image)

        h =  imagehash.average_hash(img_pil)

        data["AverageHash"] = str(h) 

        p = imagehash.phash(img_pil)

        data["PHash"] = str(p) 

        c = imagehash.colorhash(img_pil)

        data["ColorHash"] = str(c)

        d = imagehash.dhash(img_pil)
        data["DHash"] = str(d)

        w = imagehash.whash(img_pil)
        data["WaveletHash"] = str(w)

        imgGray = cv2.imread(images_path + image, cv2.IMREAD_GRAYSCALE)
        assert imgGray is not None, "file could not be read, check with os.path.exists()"
        histo = cv2.calcHist([imgGray],[0],None,[256],[0,256])  
        data["Histogram"] = histo.tolist()
       
        metaData[image] = data


    with open("metadata.json", "w") as write_file:
        json.dump(metaData , write_file, indent=4)
   


images_path = sys.argv[1]

if (os.path.exists(images_path)):
    print("Input path exists")


    genMeta(images_path)


    
else:
    sys.exit("Input path does not exists")



