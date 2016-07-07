function Mp3Play()
python << EOF

import vim, mp3play, time    

filename = r'background.mp3'
clip = mp3play.load(filename)

clip.play()
time.sleep(min(200, clip.seconds()))
clip.stop()

EOF
endfunction
