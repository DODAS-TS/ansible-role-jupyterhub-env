# ansible-role-jupyterhub-env

A role to have a nvidia docker environment

## :paperclip: Current status

* Installation of **nvidia cuda driver**:
  * Ubuntu *(tested on 18.04)*
  * RedHat (CentOS)
* Installation of **nvidia-docker2**:
  * Ubuntu *(tested on 18.04)*
* Installation of **docker-compose**
* Installation of [Jupyter-Hub from dodas-ts](https://github.com/dodas-ts/single-node-jupyterhub)
  * Run the Jupyter-hub

## :link: Useful resources

* External roles:
  * [nvidia_driver](https://github.com/NVIDIA/ansible-role-nvidia-driver)

* Installation reference:
  * [cuda driver](https://docs.nvidia.com/datacenter/tesla/tesla-installation-notes/index.html)
  * [nvidia docker installation guide](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker)
