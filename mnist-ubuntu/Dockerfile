FROM nvcr.io/nvidia/tensorflow:23.04-tf2-py3

# RUN rm /etc/apt/sources.list.d/cuda.list
# RUN rm /etc/apt/sources.list.d/nvidia-ml.list

RUN apt update
RUN apt upgrade -y

RUN pip install pip -U
RUN pip install numpy
RUN pip install matplotlib
RUN pip install pandas
RUN pip install scikit-learn
RUN pip install cloudmesh-common
RUN pip install cloudmesh-gpu
