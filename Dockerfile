FROM alpine:3.7

RUN apk add -U python py2-numpy py2-pip
RUN pip install websockify

COPY ./ /app
WORKDIR /app
RUN ln -sf vnc.html index.html

ENV HTTP_PORT 8002
ENV VNC_SERVER localhost:5900

CMD websockify -v --web=/app :${HTTP_PORT} ${VNC_SERVER}
