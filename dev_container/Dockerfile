from debian:10

# UID="1000" \
# GID="1000" \
ENV UNAME="developer" \
    SHELL="/usr/bin/zsh" \
    UHOME=/home/developer \
    TERM=xterm-256color \
    LANG=en_US.UTF-8 \
    LC_CTYPE=en_US.UTF-8

RUN apt-get update && apt-get install -y git locales \
    python3 python3-pip ripgrep sudo tmux zsh \
    ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip

# Build neovim from source
RUN git clone https://github.com/neovim/neovim.git /tmp/nvim && \
    cd /tmp/nvim && \
    git checkout stable && \
    make && make install

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

#RUN chown $UID:$GID -R $UHOME
RUN chown $UNAME -R $UHOME

ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 10

#RUN rm /bin/sh && sudo ln -s /bin/bash /bin/sh
RUN rm /bin/sh && sudo ln -s /usr/bin/zsh /bin/sh
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.30.1/install.sh | bash \
    && source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

USER $UNAME
WORKDIR $UHOME

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
RUN rm $UHOME/.zshrc && cp $UHOME/dotfiles/redir/.zshrc $UHOME/.zshrc

RUN pip3 install --user pynvim
RUN touch .bashrc
RUN $NVM_DIR/install.sh
#RUN source $UHOME/.bashrc \
    #&& nvim +PlugInstall +UpdateRemotePlugins +qall \
    #&& nvim +CocUpdateSync +qall
#RUN source $UHOME/.bashrc \
    #&& cd $UHOME/.config/coc/extensions \
    #&& npm install coc-eslint coc-json coc-css coc-tsserver coc-prettier \
    #coc-lists coc-yank coc-vimlsp coc-python \
    #--global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
RUN source $UHOME/.zshrc \
    && nvim +PlugInstall +UpdateRemotePlugins +qall \
    && nvim +CocUpdateSync +qall
RUN source $UHOME/.zshrc \
    && cd $UHOME/.config/coc/extensions \
    && npm install coc-eslint coc-json coc-css coc-tsserver coc-prettier \
    coc-lists coc-yank coc-vimlsp coc-python \
    --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod

RUN sudo chsh -s /usr/bin/zsh $UNAME

#RUN git clone https://github.com/powerline/fonts.git --depth=1 \
    #&& cd fonts \
    #&& sudo ./install.sh \
    #&& cd .. \
    #&& rm -rf fonts

RUN mkdir $UHOME/workspace
WORKDIR $UHOME/workspace
ENTRYPOINT ["tmux", "-2", "new", "-s", "TMUX"]
#ENTRYPOINT /usr/bin/zsh
