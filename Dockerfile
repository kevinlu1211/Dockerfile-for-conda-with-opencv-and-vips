FROM continuumio/miniconda3
EXPOSE 8888
EXPOSE 80

# Add dependencies:
# 1. OpenCV (ffmpeg, libsm6, libxext6) 
# 2. Vips (libvips-dev)
# 3. Vim
RUN apt-get update ##[edited]
RUN DEBIAN_FRONTEND="noninteractive" apt-get install \
    'ffmpeg'\ 
    'libsm6' \ 
    'libxext6' \
    'libvips-dev' \
    'vim' -y

# Add and install our conda environment
COPY env.yml /tmp/env.yml
RUN conda env create -f /tmp/env.yml
RUN echo "conda activate" $(grep name: /tmp/env.yml | awk '{print $2}') >> ~/.bashrc
SHELL ["/bin/bash", "--login", "-c"]


# Set some flags so that we can output to stdout
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

ENTRYPOINT ["python"]