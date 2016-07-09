function! PlayMp3()
python << EOF

import vim, mp3play, time  
import os.path
import os
from threading import Thread
import random

def init():
    global ROOT_DIR, MP3_DIR
    root_dir = ''

    for i in vim._get_paths():
        if 'BackgroundMusic' in i: 
            root_dir = i[0:i.rfind(os.sep)]
            break

    return root_dir

ROOT_DIR = init()
MP3_DIR = os.path.join(ROOT_DIR, 'mp3')

def random_mp3():
    mp3s = os.listdir(MP3_DIR)
    return mp3s[random.randint(1, len(mp3s)) - 1]
    
def play(mp3):
    filename = os.path.join(MP3_DIR, mp3)
    clip = mp3play.load(filename)

    clip.play()
    time.sleep(min(60,clip.seconds()))
    clip.stop()

def forever():
    while 1:
        filename = random_mp3()
        mp3 = filename[filename.rfind(os.sep) + 1:]
        p = Thread(target = play, args=(filename,))
        p.daemon = True
        p.start()
        p.join()

p = Thread(target=forever)
p.daemon = True
p.start()

EOF
endfunction
