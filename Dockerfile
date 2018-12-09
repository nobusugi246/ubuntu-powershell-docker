FROM ubuntu:18.10

RUN apt-get update && apt-get upgrade -y && apt-get install openssh-server wget -yq && apt-get clean
RUN wget https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb \ 
    && dpkg -i packages-microsoft-prod.deb \
    && apt-get update \
    && apt-get install -y powershell \
    && apt-get clean

RUN mkdir /var/run/sshd
RUN echo 'root:screencast' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN echo "Subsystem powershell /usr/bin/pwsh -sshs -NoLogo -NoProfile" >> /etc/ssh/sshd_config 

RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

