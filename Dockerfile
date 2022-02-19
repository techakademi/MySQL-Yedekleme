FROM alpine:3.14

LABEL maintainer="Hamza GÜRCAN techakademi@gmail.com" 

RUN apk add --update mysql-client bash openssh-client && rm -rf /var/cache/apk/*

RUN mkdir /mysqlyedek

COPY dbyedek.sh /

RUN chmod +x dbyedek.sh

ENTRYPOINT ["/dbyedek.sh"]
