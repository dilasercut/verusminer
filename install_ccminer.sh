#!/bin/bash

# Script untuk menginstal ccminer di STB Armbian
# Pastikan Anda menjalankan script ini sebagai root

# Perbarui dan instal dependensi
apt update && apt upgrade -y
apt install -y build-essential libcurl4-openssl-dev libssl-dev git automake screen

# Buat direktori kerja
mkdir -p /root/miner && cd /root/miner

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
cat <<EOF > /root/run_ccminer.sh
#!/bin/bash

# Ganti wallet dan worker_name di sini
WALLET="your_wallet_address"
WORKER="your_worker_name"
POOL="stratum+tcp://your_pool_address:your_port"

# Jalankan miner
cd /root/miner/ccminer
./ccminer -a verus -o \$POOL -u \$WALLET.\$WORKER -p x
EOF

# Buat script dapat dieksekusi
chmod +x /root/run_ccminer.sh

# Pesan selesai
echo "Instalasi selesai. Edit file /root/run_ccminer.sh untuk mengganti wallet dan nama worker Anda."
