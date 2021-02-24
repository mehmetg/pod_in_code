FROM centos:7.9.2009

ENV PATH="/usr/local/bin/:${PATH}"

RUN set -o pipefail && \
    yum install -y epel-release && \
    yum install -y gcc openssl-devel bzip2-devel make gcc-c++ libsqlite3x-devel \
    mariadb-devel python-devel postgresql-devel postgresql-libs cyrus-sasl-devel && \
    yum -y upgrade

RUN set -o pipefail && \
    curl -Ls https://www.python.org/ftp/python/2.7.18/Python-2.7.18.tgz | tar zxv && \
    cd Python-2.7.18 && \
    ./configure --enable-optimizations && \
    make -j 8 altinstall && \
    /usr/local/bin/python2.7 -m ensurepip

RUN set -o pipefail && \
    pip2.7 install 'pip==20.2.0' && \
    pip2.7 install -U wheel virtualenv setuptools cython numpy && \
    pip2.7 install pysqlite cython psycopg2 mysqlclient apache-airflow-upgrade-check && \
    pip2.7 install apache-airflow[all_dbs,cncf.kubernetes]==1.10.14

RUN mkdir /airflow

COPY pod_in_code/pod_in_code/kubernetes_executor.py /airflow/plugins/pod_as_code.py

RUN ln -s /usr/local/bin/python2.7 /usr/local/bin/python

RUN yum clean all

ENV AIRFLOW_HOME="/airflow"
