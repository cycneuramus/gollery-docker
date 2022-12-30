FROM golang:alpine

ENV GOARCH $TARGETARCH

ARG USER=gollery
ARG HOME_DIR=/home/$USER

RUN apk add --no-cache --update \
	git \
	exiftool

RUN adduser \
	--disabled-password \
	--uid 1000 \
	$USER

USER $USER
COPY entrypoint.sh $HOME_DIR
WORKDIR $HOME_DIR

RUN git clone https://github.com/cycneuramus/IfExifExtract

ENTRYPOINT ["sh", "entrypoint.sh"]
