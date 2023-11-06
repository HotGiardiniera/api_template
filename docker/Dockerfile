FROM python:3.12-bookworm
LABEL authors="chm"

COPY ./app /api/app
WORKDIR /api

RUN apt update
RUN apt upgrade -y

RUN pip install --upgrade pip

RUN pip install pip-tools==7.3.0 # For requirements compiling
RUN pip install ipython
RUN pip install -r ./app/requirements.txt

COPY docker/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENV PYTHONPATH=/api

ENTRYPOINT ["/entrypoint.sh"]

