FROM python:3.8-alpine
WORKDIR /usr/src/app
COPY requirements.txt .
RUN apk update && apk add build-base git
RUN python3 -m pip install -r requirements.txt
RUN  pipx install copier==6.0.0b0 --force && pipx inject copier "MarkupSafe<2.1.0" && pipx inject copier jinja2-time
RUN wget https://releases.hashicorp.com/terraform/0.12.21/terraform_0.12.21_linux_amd64.zip
RUN unzip terraform_0.12.21_linux_amd64.zip && rm terraform_0.12.21_linux_amd64.zip
RUN mv terraform /usr/bin/terraform
RUN wget https://releases.hashicorp.com/terraform/1.1.9/terraform_1.1.9_linux_amd64.zip
RUN unzip terraform_1.1.9_linux_amd64.zip && rm terraform_1.1.9_linux_amd64.zip
RUN mv terraform /usr/bin/terraform
ENV PATH $PATH:/root/.local/bin