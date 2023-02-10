FROM ubuntu
USER root
RUN mkdir -p jenkins_home
RUN chmod 777 jenkins_home
RUN apt-get update -qq
RUN apt-get install openjdk-11-jdk -qq
RUN apt-get install openssh-server -qq
RUN useradd -ms /bin/bash jenkins

#install docker client
RUN apt-get update -qq
RUN apt-get install apt-transport-https curl gnupg-agent ca-certificates software-properties-common -y
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" -y
RUN apt-get update -y
RUN apt-get install docker-ce docker-ce-cli containerd.io -y
RUN usermod -aG docker jenkins
USER jenkins
WORKDIR jenkins_home
CMD ["/bin/bash"]
