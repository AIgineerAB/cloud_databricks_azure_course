FROM python:3.13-slim

COPY backend/ /app/

# avoid cache to bloat image
RUN pip install --no-cache-dir uv

WORKDIR /app/backend
RUN uv sync --no-dev 

WORKDIR /app/src/backend
# binds to home wifi e.g. 192.168.1.10 and localhost 127.0.0.1
CMD ["uv", "run", "uvicorn", "api:app", "--host", "0.0.0.0"]

