#nginx 1.0
FROM centos
MAINTAINER your dada
RUN yum install -y gcc make pcre-devel  openssl-devel
ADD nginx-1.14.2.tar.gz /usr/local/src
RUN mkdir /8001 /8002
RUN useradd nginx
workdir /usr/local/src/nginx-1.14.2
RUN ./configure --user=nginx --group=nginx --with-http_stub_status_module --with-http_ssl_module --prefix=/usr/local/nginx
RUN make && make install
RUN rm -rf /usr/local/nginx/conf/nginx.conf
ADD nginx.conf /usr/local/nginx/conf/nginx.conf
VOLUME ["/8001","/8002"]
ENTRYPOINT ["/usr/local/nginx/sbin/nginx"]
CMD ["-g" , "daemon off;"]
EXPOSE 8001 8002
