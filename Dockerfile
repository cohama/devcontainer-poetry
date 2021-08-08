FROM python:3.9

ARG USERNAME=dev
ARG USER_UID=5000
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | sudo -u $USERNAME -i python - \
  && sudo -u $USERNAME /home/$USERNAME/.poetry/bin/poetry config virtualenvs.in-project true

ENV PATH=/home/$USERNAME/.poetry/bin/:$PATH

USER $USERNAME
