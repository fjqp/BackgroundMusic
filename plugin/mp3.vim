function Mp3Play()
python << EOF

import vim, mp3play, time  
import os.path
import os

filename = ''

for i in vim._get_paths():
    if 'BackgroundMusic' in i: 
        filename = i[0:i.rfind(os.sep)]
        break

filename = os.path.join(filename, r'background.mp3')
print filename

clip = mp3play.load(filename)

clip.play()
time.sleep(min(10, clip.seconds()))
clip.stop()

EOF
endfunction
