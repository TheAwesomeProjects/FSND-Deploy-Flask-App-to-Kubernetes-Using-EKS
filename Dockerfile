FROM python:stretch

RUN mkdir -p /app

COPY ./main.py /app
COPY ./test_main.py /app
COPY ./README.md /app
COPY ./simple_jwt_api.yml /app
COPY ./buildspec.yml /app
COPY ./ci-cd-codepipeline.cfn.yml /app
COPY ./requirements.txt /app
WORKDIR /app

RUN pip install --upgrade pip
RUN pip install -r requirements.txt


ENTRYPOINT ["gunicorn", "-b", ":8080", "main:APP"]
