FROM python:3.11.4

RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi
RUN pip install Flask==2.3.2 uWSGI==2.0.21 requests==2.31.0 redis==4.6.0
WORKDIR /app
COPY app /app
COPY cmd.sh /

EXPOSE 9090 9191
USER uwsgi
CMD ["/cmd.sh"]