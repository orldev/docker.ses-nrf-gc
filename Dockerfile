FROM ubuntu:20.04

# Set up envs
ENV PATH=$PATH:/root/google-cloud-sdk/bin
ENV PATH=/opt/ses/bin:$PATH
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

# Create install dir for delete it after install
RUN mkdir install
WORKDIR /root/install

RUN apt-get update \ 
    && apt-get upgrade -y \
    && apt-get install -y apt-transport-https ca-certificates gnupg add-apt-key make git python3-pip wget curl libfreetype6 libxrender1 libfontconfig1 ibusb-1.0-0 \
    && apt-get clean 

# Install gsutil as part of the Google Cloud CLI
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - && apt-get update -y && apt-get install google-cloud-cli -y

# Install Segger Embedded Studio 7.10
RUN wget https://www.segger.com/downloads/embedded-studio/Setup_EmbeddedStudio_ARM_v710_linux_x64.tar.gz -O ses_install.tar.gz \
    && tar -xzf ses_install.tar.gz \
    && /bin/sh -c '/bin/echo -e "yes\n" | ./arm_segger_embedded_studio_v710_linux_x64/install_segger_embedded_studio --copy-files-to /opt/ses'

# Install nRF command-line tools 10.18.1 Linux amd 64
RUN wget https://nsscprodmedia.blob.core.windows.net/prod/software-and-other-downloads/desktop-software/nrf-command-line-tools/sw/versions-10-x-x/10-18-1/nrf-command-line-tools_10.18.1_amd64.deb \
    && dpkg -i nrf-command-line-tools_10.18.1_amd64.deb

# Install deps over pip
RUN pip3 install --upgrade pip --no-cache-dir \
    && pip3 install nrfutil --no-cache-dir 
    
# Clean install files
WORKDIR /root
RUN rm -r -f /root/install/