# setup
FROM jfloff/alpine-python:3.8
COPY ./app /app
WORKDIR /app

# install dependencies
RUN pip3 install --upgrade pip \
  && pip3 install -r requirements.txt

# setup app user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Tell docker that all future commands should run as the appuser user
USER appuser

# run app
ENTRYPOINT uwsgi --ini uwsgi.ini
EXPOSE 5000
