FROM python:3.11
WORKDIR /Verba
COPY . /Verba
RUN pip install --no-cache-dir -e '.[huggingface]' --no-deps && \
    pip install --no-cache-dir goldenverba[huggingface] --no-deps
RUN pip install --no-cache-dir click
EXPOSE 8000
CMD ["verba", "start","--port","8000","--host","0.0.0.0"]
