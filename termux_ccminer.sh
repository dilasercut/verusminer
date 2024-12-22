#!/bin/bash

# Script otomatis untuk menginstal ccminer, membuat konfigurasi, dan menjalankan miner di Termux
# Pastikan Anda menjalankan script ini di Termux dengan akses penuh

# Perbarui dan instal dependensi
pkg update && pkg upgrade -y
pkg install -y git clang make openssl curl screen

# Buat direktori kerja
mkdir -p ~/miner && cd ~/miner

# Clone repository ccminer
if [ ! -d "ccminer" ]; then
  git clone https://github.com/tpruvot/ccminer.git
else
  echo "Repository ccminer sudah ada. Menggunakan direktori yang ada."
  cd ccminer && git pull && cd ..
fi

# Masuk ke direktori ccminer
cd ccminer

# Jalankan build script
./build.sh

# Verifikasi hasil build
if [ -f "ccminer" ]; then
  echo "ccminer berhasil diinstal!"
else
  echo "Terjadi kesalahan saat membangun ccminer. Periksa log untuk detail."
  exit 1
fi

# Buat file script run_ccminer.sh untuk menjalankan miner
cat <<EOF > ~/run_ccminer.sh
#!/bin/bash

# Ganti wallet dan worker_name di sini
WALLET="your_wallet_address"
WORKER="your_worker_name"
POOL="stratum+tcp://your_pool_address:your_port"

# Jalankan miner
cd ~/miner/ccminer
./ccminer -a verus -o \$POOL -u \$WALLET.\$WORKER -p x
EOF

# Buat script dapat dieksekusi
chmod +x ~/run_ccminer.sh

# Tambahkan alias ke file bashrc agar mudah dijalankan
if ! grep -q "alias startminer" ~/.bashrc; then
  echo "alias startminer='bash ~/run_ccminer.sh'" >> ~/.bashrc
fi

# Pesan selesai
echo "Instalasi selesai."
echo "Edit file ~/run_ccminer.sh untuk mengganti wallet dan nama worker Anda."
echo "Jalankan miner dengan perintah: startminer"

