FROM ubuntu

ENV HOME /root
ENV GOPATH /go
ENV PATH $PATH:$GOPATH/bin

RUN apt-get update && \
    apt-get install -y \
    vim \
    git \
    golang \
    mercurial && \
    mkdir -p /go && \
    mkdir -p $HOME/.vim/bundle && \
    cd $HOME/.vim/bundle && \
    git clone https://github.com/gmarik/Vundle.vim

ADD .vimrc $HOME/.vimrc
RUN vim +PluginInstall +GoInstallBinaries +qall

ENTRYPOINT ["vim"]
