FROM jupyter/base-notebook

USER root

# Instalar o Java
RUN apt-get update && \
    apt-get install -y openjdk-11-jdk && \
    apt-get clean;

COPY ./requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Definir a variável JAVA_HOME
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64

# Mudar para o usuário jovyan (usuário padrão do Jupyter)
USER jovyan