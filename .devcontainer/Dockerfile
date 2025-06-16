FROM texlive/texlive:latest-full

RUN apt update && \
    apt install -y git 

RUN mkdir -p /tmp/fonts /usr/share/fonts/custom && \
    git clone https://github.com/Haixing-Hu/latex-chinese-fonts.git /tmp/fonts/ && \
    cp /tmp/fonts/*/*/* /usr/share/fonts/custom/ && \
    fc-cache -fv && \
    rm -rf /tmp/*