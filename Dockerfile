FROM python:3.8-slim
RUN pip install xonsh
ADD run.xsh /
ENTRYPOINT ["/usr/local/bin/xonsh", "/run.xsh"]