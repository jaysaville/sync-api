FROM python:3.8.12-slim

COPY fast.py /fast.py
COPY requirements_docker.txt /requirements.txt

RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN apt-get update && apt-get install -y libglib2.0-0 libgl1-mesa-glx ffmpeg && rm -rf /var/lib/apt/lists/*

CMD uvicorn api.fast:app --host 0.0.0.0 --port $PORT
