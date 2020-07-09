FROM python:3.9.0a5-alpine3.10
ARG AV_Data_Capture_ZIP=https://codeload.github.com/yoshiko2/AV_Data_Capture/zip/master

ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

WORKDIR /tmp

RUN apk add curl libxslt-dev libxml2-dev gcc libc-dev jpeg-dev zlib-dev

RUN \
    curl ${AV_Data_Capture_ZIP} -o AV_Data_Capture.zip && \
    unzip -x AV_Data_Capture.zip && \
    cd AV_Data_Capture-master && \
    pip install -r /tmp/AV_Data_Capture-master/requirements.txt

VOLUME ["/xxx"]

WORKDIR /xxx

RUN mkdir /config_file
RUN cp config.ini /config_file &>- || true
RUN cp /tmp/AV_Data_Capture-master/config.ini /config_file &>- || true
RUN cp /config_file/config.ini . &>- || true

# RUN sed -i '$d' /tmp/AV_Data_Capture-master/AV_Data_Capture.py
# CMD [ "python3", "/tmp/AV_Data_Capture-master/AV_Data_Capture.py", "-a" ]
COPY ./script/av.sh.sh /
ENTRYPOINT ["/av.sh"]