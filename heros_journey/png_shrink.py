import os
from pathlib import Path
from glob import glob
from PIL import Image

def shrink_png(infile, outfile=None, colors=255):
    # Open image
    img = Image.open(infile)
    
    # Convert to palette mode with quantization
    img = img.convert("P", palette=Image.ADAPTIVE, colors=colors)
    
    # Overwrite check
    if(outfile is None):
        outfile = infile

    # Save optimized PNG
    img.save(outfile, optimize=True)

user_dir = os.path.expanduser('~')
image_dir = "PATH GOES HERE"
image_list = list(Path(image_dir).glob('*.png'))

if len(image_list)<1:
    print("No PNG files found")
    exit

else:
    print(f'Files found: {image_list}')
    for file in image_list:
        print(f'Processing {file}')
        try:
            shrink_png(file, colors=255)
        except Exception as e:
            print(f'Error: {e} while processing')