FROM python:3.8-alpine
WORKDIR /usr/src/app
COPY requirements.txt .
RUN apk update && apk add build-base git
RUN python3 -m pip install -r requirements.txt
RUN wget https://releases.hashicorp.com/terraform/1.1.9/terraform_1.1.9_linux_amd64.zip
RUN unzip terraform_1.1.9_linux_amd64.zip && rm terraform_1.1.9_linux_amd64.zip
RUN mv terraform /usr/bin/terraform
COPY terraform .
COPY input.sh .
COPY template_generator.py .
ENV PATH $PATH:/root/.local/bin
RUN python -m pylint *.py --disable too-many-arguments --disable too-many-locals
RUN pip uninstall pylint -y