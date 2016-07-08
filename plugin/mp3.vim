python << EOF

import vim, mp3play, time  
import os.path
import os
from threading import Thread

def play():
    filename = ''

    for i in vim._get_paths():
        if 'BackgroundMusic' in i: 
            filename = i[0:i.rfind(os.sep)]
            break

    filename = os.path.join(filename, r'background.mp3')

    clip = mp3play.load(filename)

    clip.play()
    time.sleep(min(300, clip.seconds()))
    clip.stop()

p = Thread(target = play, name = 'play')
p.daemon = True
p.start()


EOF
