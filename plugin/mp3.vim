function Mp3Play()
python << EOF

import vim, mp3play, time, re    
import os.path

pattern = re.compile(r'BackgroundMusick')

filename = ''

for i in vim._get_paths():
    match = pattern.match(i)
    if match:
        filename =i.rpartition('/')[0]
        break

filename = os.path.join(filename, 'background.mp3')

clip = mp3play.load(filename)

clip.play()
time.sleep(min(10, clip.seconds()))
clip.stop()

EOF
endfunction
