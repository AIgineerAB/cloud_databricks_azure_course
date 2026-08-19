FROM python:3.13-slim

COPY frontend/ /app/
WORKDIR /app/

RUN pip install uv --no-cache-dir
RUN uv sync --no-dev
WORKDIR /app/src/frontend

CMD [ "uv", "run", "streamlit", "run", "dashboard.py" ]