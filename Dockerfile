FROM centos:8

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN dnf check-update; \
    dnf install -y gcc libffi-devel python3 epel-release; \
    dnf install -y python3-pip; \
    dnf install -y wget; \
    dnf clean all

RUN pip3 install --upgrade pip; \
    pip3 install --upgrade virtualenv; \
    pip3 install pywinrm[kerberos]; \
    pip3 install pywinrm; \
    pip3 install jmspath; \
    pip3 install requests; \
    python3 -m pip install ansible; \
    ansible-galaxy collection install azure.azcollection; \
    pip3 install -r ~/.ansible/collections/ansible_collections/azure/azcollection/requirements-azure.txt
