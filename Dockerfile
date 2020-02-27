FROM debian:latest

RUN mkdir /home/MAPS6_docker_env
RUN mkdir /home/MAPS6_docker_env/libs

COPY PI_test.py PI_test_config.py /home/MAPS6_docker_env
COPY /libs/MAPS_pi.py /libs/MAPS_mcu.py /libs/display.py /home/MAPS6_docker_env/libs

WORKDIR /home/MAPS6_docker_env

RUN pip3 install Adafruit_SSD1306

CMD python3 PI_test.py