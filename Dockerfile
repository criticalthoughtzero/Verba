FROM python:3.11
WORKDIR /Verba
COPY . /Verba
RUN pip install -e '.'
EXPOSE 8000

# Set permissions so that docker containers can see the mapped container folder correctly:
RUN mkdir -p /Verba && \
    chmod 755 /Verba && \
    find /Verba -type f -exec chmod 644 {} + || true && \
    find /Verba -type d -exec chmod 755 {} + || true && \
    chown -R nobody:nogroup /Verba
USER nobody
#CMD ["verba", "start","--port","8000","--host","0.0.0.0"]
