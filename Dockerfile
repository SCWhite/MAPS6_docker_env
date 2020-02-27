FROM debian:latest


RUN apt-get update && apt-get install -y \
    python3-pip

RUN apt-get install -y libtiff5-dev \ 
    libjpeg62-turbo-dev \
    zlib1g-dev \
    libfreetype6-dev \ 
    liblcms2-dev \ 
    libwebp-dev \
    python3-rpi.gpio


RUN pip3 install --no-binary pillow pillow requests
RUN pip3 install Adafruit_SSD1306 pyserial

RUN mkdir /home/MAPS6_docker_env
RUN mkdir /home/MAPS6_docker_env/libs


COPY PI_test.py PI_test_config.py /home/MAPS6_docker_env/
COPY /libs/MAPS_pi.py /libs/MAPS_mcu.py /libs/display.py /home/MAPS6_docker_env/libs/
COPY ARIALUNI.TTF /home/

WORKDIR /home/MAPS6_docker_env



CMD python3 PI_test.py
