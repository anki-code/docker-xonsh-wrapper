FROM python:3.8-slim
RUN pip install xonsh==0.9.24
ADD run.xsh /
ENTRYPOINT ["/usr/local/bin/xonsh", "/run.xsh"]
