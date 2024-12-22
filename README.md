# verusminer armbian stb
Cara menggunakan:
  git clone https://github.com/dilasercut/verusminer.git\n
  cd verusminer\n
  nano run_ccminer.sh // Ganti wallet dan worker_name punya kamu\n
  // Save and quit. Dengan cara tekan tombol CTRL+X, tekan tombol Y dan enter\n
  \n
  Masuk ke cronjob: crontab -e\n
  ketikan ini: @reboot bash /root/run_ccminer.sh > /root/run_ccminer.log 2>&1\n
\n
  // Save and quit. Dengan cara tekan tombol CTRL+X, tekan tombol Y dan enter\n
  Setelah itu kamu reboot stbnya.\n
  
