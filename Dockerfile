FROM python:3.7-slim

ARG PORT


ENV APP_HOME /app

WORKDIR $APP_HOME

COPY . ./

# Set $PORT environment variable
ENV PORT $PORT

RUN echo "PORT ========== $PORT"

RUN pip install Flask gunicorn        # Plus other libraries

CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 app:app
