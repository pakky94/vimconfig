from debian:10

ENV UID="1000" \
    UNAME="developer" \
    GID="1000" \
    SHELL="/bin/bash" \
    UHOME=/home/developer \
    TERM=xterm-256color

RUN apt-get update && apt-get install -y git tmux sudo

RUN apt-get install -y python3 python3-pip ripgrep

# Build neovim from source
RUN apt-get install -y ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip
RUN git clone https://github.com/neovim/neovim.git /tmp/nvim && \
    cd /tmp/nvim && \
    git checkout stable && \
    make && make install

RUN apt install -y locales
RUN echo "LC_ALL=en_US.UTF-8" >> /etc/environment && \
    echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && \
    echo "LANG=en_US.UTF-8" > /etc/locale.conf && \
    locale-gen en_US.UTF-8

RUN useradd $UNAME
RUN echo "${UNAME} ALL=(ALL) NOPASSWD: ALL" \
    > "/etc/sudoers.d/${UNAME}" \
    && chmod 0440 "/etc/sudoers.d/${UNAME}"

RUN mkdir $UHOME
RUN echo "if [[ -f ~/.profile ]]; then" >> $UHOME/.bash_profile && \
    echo "    . ~/.profile" >> $UHOME/.bash_profile && \
    echo "fi" >> $UHOME/.bash_profile && \
    echo "if [[ \$- == *i* && -f ~/.bashrc ]]; then" >> $UHOME/.bash_profile && \
    echo "    . ~/.bashrc" >> $UHOME/.bash_profile && \
    echo "fi" >> $UHOME/.bash_profile


RUN cd $UHOME && \
    git clone https://github.com/pakky94/dotfiles $UHOME/dotfiles && \
    cp $UHOME/dotfiles/redir/.tmux.conf $UHOME/.tmux.conf && \
    mkdir $UHOME/.config && \
    mkdir $UHOME/.config/nvim && \
    cp $UHOME/dotfiles/redir/.config/nvim/init.vim $UHOME/.config/nvim/init.vim

RUN chown $UID:$GID -R $UHOME

ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 10

RUN rm /bin/sh && sudo ln -s /bin/bash /bin/sh
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.30.1/install.sh | bash \
    && source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

USER $UNAME
WORKDIR $UHOME
RUN pip3 install --user pynvim
RUN touch .bashrc
RUN $NVM_DIR/install.sh
RUN source $UHOME/.bashrc \
    && nvim +PlugInstall +UpdateRemotePlugins +qall \
    && nvim +CocUpdateSync +qall

RUN source $UHOME/.bashrc \
    && cd $UHOME/.config/coc/extensions \
    && npm install coc-eslint coc-json coc-css coc-tsserver coc-prettier \
    coc-lists coc-yank coc-vimlsp coc-python \
    --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod

RUN sudo chsh -s /bin/bash developer

ENTRYPOINT ["tmux", "new", "-s", "TMUX"]
