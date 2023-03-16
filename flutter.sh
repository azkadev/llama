# Lisensi MIT

# Pernyataan Hak Cipta (c) 2023 @azkadev

# Izin diberikan dengan gratis, kepada siapa pun yang memperoleh salinan
# dari perangkat lunak ini dan file dokumentasi terkait (selanjutnya disebut "Perangkat Lunak"), untuk menggunakan 
# Perangkat Lunak tanpa batasan, termasuk tanpa batasan hak 
# untuk menggunakan, menyalin, mengubah, menggabungkan, menerbitkan, mendistribusikan, mensublisensikan, dan/atau menjual 
# salinan Perangkat Lunak, dan untuk mengizinkan orang yang menerima Perangkat Lunak ini
# untuk melakukan hal yang sama, dengan syarat-syarat berikut:

# Pemberitahuan hak cipta di atas dan pemberitahuan izin ini harus disertakan dalam setiap
# salinan atau bagian utama Perangkat Lunak.

# Perangkat Lunak disediakan "apa adanya", tanpa jaminan apapun, baik tersurat maupun tersirat,
# termasuk namun tidak terbatas pada jaminan jual beli,
# kesesuaian untuk tujuan tertentu, atau tidak adanya pelanggaran hak.

# Dalam keadaan apapun, para pemegang hak cipta tidak akan bertanggung jawab atas klaim, kerusakan, atau
# kewajiban lainnya yang timbul dalam hubungannya dengan Perangkat Lunak atau penggunaan atau pengoperasian Perangkat Lunak.



echo "started install flutter and android sdk"

export DEBIAN_FRONTEND=noninteractive

export ANDROID_SDK="/opt/android-sdk"
export ANDROID_SDK_ROOT="/opt/android-sdk"
export ANDROID_HOME="/opt/android-sdk"
export PATH="$ANDROID_HOME/cmdline-tools/latest/bin/:$PATH"
export PATH="$ANDROID_HOME/cmdline-tools/latest/:$PATH"
export PATH="$ANDROID_HOME/emulator/:$PATH"
export PATH="$ANDROID_HOME/platform-tools/:$PATH"
export PATH="$ANDROID_SDK:$PATH"
export PATH="$PATH:/usr/local/flutter/bin"

sudo apt-get update

sudo apt-get install -y --no-install-recommends \
    wget \
    curl \
    make \
    git \
    zlib1g-dev \
    libssl-dev \
    gperf \
    cmake \
    clang \
    libc++-dev \
    libc++abi-dev \
    php-cli \
    g++ \
    ninja-build \
    pkg-config \
    libgtk-3-dev \
    liblzma-dev \
    xz-utils \
    unzip \
    xvfb \
    openjdk-11-jdk

mkdir -p /opt/android-sdk/cmdline-tools
wget -q https://dl.google.com/android/repository/commandlinetools-linux-7583922_latest.zip -O /tmp/tools.zip
unzip -q /tmp/tools.zip -d /opt/android-sdk/cmdline-tools
mv -rf /opt/android-sdk/cmdline-tools/cmdline-tools /opt/android-sdk/cmdline-tools/latest
echo "export PATH=$PATH:/opt/android-sdk/cmdline-tools/latest/bin" >> ~/.bashrc

echo "export ANDROID_SDK=/opt/android-sdk" >> ~/.bashrc
echo "export ANDROID_SDK_ROOT=/opt/android-sdk" >> ~/.bashrc
echo "export ANDROID_HOME=/opt/android-sdk" >> ~/.bashrc
echo "export PATH=$ANDROID_HOME/cmdline-tools/latest/bin/:$PATH" >> ~/.bashrc
echo "export PATH=$ANDROID_HOME/cmdline-tools/latest/:$PATH" >> ~/.bashrc
echo "export PATH=$ANDROID_HOME/emulator/:$PATH" >> ~/.bashrc
echo "export PATH=$ANDROID_HOME/platform-tools/:$PATH" >> ~/.bashrc
echo "export PATH=$ANDROID_SDK:$PATH" >> ~/.bashrc
echo "export PATH=$PATH:/usr/local/flutter/bin" >> ~/.bashrc

yes "y" | /opt/android-sdk/cmdline-tools/latest/bin/sdkmanager
yes "y" | /opt/android-sdk/cmdline-tools/latest/bin/sdkmanager --update
yes "y" | /opt/android-sdk/cmdline-tools/latest/bin/sdkmanager "platform-tools"
yes "y" | /opt/android-sdk/cmdline-tools/latest/bin/sdkmanager "platforms;android-30"
yes "y" | /opt/android-sdk/cmdline-tools/latest/bin/sdkmanager "patcher;v4"
yes "y" | /opt/android-sdk/cmdline-tools/latest/bin/sdkmanager "build-tools;30.0.2"
yes "y" | /opt/android-sdk/cmdline-tools/latest/bin/sdkmanager --licenses
curl -L https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.7.3-stable.tar.xz -o flutter.tar.xz && \
    tar xf flutter.tar.xz -C /usr/local && \
    rm -f flutter.tar.xz

# menambahkan path flutter ke PATH
git config --global --add safe.directory /usr/local/flutter
# mengaktifkan flutter web support
flutter config --enable-web
flutter config --enable-linux-desktop
flutter config --enable-macos-desktop
flutter config --enable-windows-desktop
flutter config --no-analytics
flutter config --android-sdk /opt/android-sdk

dart --version
flutter doctor --android-licenses