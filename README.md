# ansible-role-jupyterhub-env [![Ansible Lint](https://github.com/DODAS-TS/ansible-role-jupyterhub-env/actions/workflows/ansible-lint.yml/badge.svg)](https://github.com/DODAS-TS/ansible-role-jupyterhub-env/actions/workflows/ansible-lint.yml)

A role to setup a node with a jupyterhub that spawns jupyterlab with or without GPU utilization and a monitoring service.

Requirements
------------

This role needs a working IAM Client in order to configure the JupyterHub authentication plugin.
If you are using this role as it is and not through [INFN PaaS orchestrator](https://my.cloud.infn.it), you should provide `iam_url`, `iam_client_id` and `iam_token` variables.

Role Variables
--------------

### defaults

Variable for the monitoring service:

- `install_docker`: bool (default: `yes`)
- `install_docker_compose`: bool (default: `yes`)
- `docker_compose_version`: string (default: `"1.29.2"`)
- `install_nvidia_driver`: bool (default: `yes`)
- `install_nvidia_driver_from_cuda`: bool (default: `yes`)
- `install_nvidia_container_toolkit`: bool (default: `yes`)
- `nvidia_driver_skip_reboot`: bool (default: `yes`)
- `gpu_partition_flavor`: string, enable the A100 GPU partitioning, four values allowed (default: `"None"`)
- `run_jupyter`: bool, if you want to run the jupyterhub compose (default: `yes`)
- `jupyter_port`: string (default: `"8888"`)
- `jupyter_proxy_token`: string, token needed for the collaborative service, autogenerated if empty (default: `""`)
- `jupyter_images`: string, Comma separated image list (default: `"dodasts/snj-base-lab:v1.1.1-snj"`)
- `jupyter_use_gpu`: bool, if to enable the jupyter notebook to use the GPU (default: `no`)
- `jupyter_default_spawner`: string, indicates to start with lab or notebook (possible values: ["LAB", "NOTEBOOK"])
- `jupyter_post_start_cmd`: string, the command to run after jupyter spawned (default: "")
- `jupyter_host_mount_dir`: path of base mount point in the host machine (default: "")
- `jupyter_mount_dir`: path of mount point in the jupyter env (default: "")
- `jupyterlab_collaborative`: bool, if to deploy the collaborative service (default: `no`)
- `jupyterlab_collaborative_use_gpu`: bool, if to enable the collaborative service to use the GPU (default: `no`)
- `jupyterlab_collaborative_image`: string, the collaborative Docker image (default: `"dodasts/snj-base-jlabc:v1.1.1-snj"`)
- `iam_url`: URL of the IAM service (`Mandatory`)
- `iam_groups`: string with the name of the IAM groups allowed (space separated)
- `iam_admin_groups`: string with the name of the IAM groups that will be admin (space separated)
- `iam_subject` : string, token subject of the user deploying the service
- `iam_client_id`: string, IAM client id (`Mandatory`)
- `iam_token` : string, token needed to interact with the IAM Issuer (`Mandatory`)
- `server_ip`: string with the ip of the current server
- `monitoring`: bool, if to deploy the Grafana monitoring service (default: `yes`)
- `grafana_port`:  int, the grafana service port
- `grafana_admin_user`:  string
- `grafana_admin_password`:  string
- `grafana_client_id`:  string (used for the IAM login)
- `grafana_client_secret`:  string (used for the IAM login)
- `grafana_image`: string (default: `"grafana/grafana:9.5.7"`)
- `cvmfs_repos`: string, list of the cvmfs repo to mount (default: `""`)

### vars

The following string variables will be filled with the docker service information:

- `jupyter_gpu`: string (default: `"WITH_GPU=false"`)
- `cvmfs_service`: string (default: `""`)
- `compose_base_jhub_image`: string (default: `"dodasts/snj-base-jhub:v1.1.1-snj"`)
- `compose_base_http_proxy_image`: string (default: `"jupyterhub/configurable-http-proxy"`)
- `compose_base_collab_http_proxy_image`: string (default: `"dodasts/snj-base-jlabc-proxy:v1.1.1-snj"`)
- `jupyterlab_collaborative_service`: string (default: `""`)
- `jupyterlab_collaborative_service_dependency`: string (default: `""`)
- `jupyterlab_collaborative_image_param`: string (default: `"image: dodasts/snj-base-jlabc:v1.1.1-snj"`)
- `jupyterlab_collaborative_gpu_param`: string (default: `""`)
- `jupyter_with_cvmfs`: bool (default: `false`)
- `jupyter_collab_service`: bool (default: `false`)
- `gpu_partition_flavor`: string, enable the A100 GPU partitioning, four values allowed (default: `"None"`)
- `use_gpu`: bool, if the GPU can be used or not (default: `no`)

Dependencies
------------

There are no other dependencies.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

```yaml
    - hosts: servers
      roles:
         - role: ansible-role-jupyterhub-env
           server_ip: "a.b.c.d"
           jupyterlab_collaborative: yes 
           monitoring: no 
           run_jupyter: no 
           iam_url: https://iam.example.service.it 
           iam_groups: groupA
           iam_client_id: XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX
           iam_token: <TOKEN>

```

## :paperclip: Current status

* Installation of **nvidia cuda driver**:
  * Ubuntu *(tested on 20.04)*
  * RedHat (CentOS)
* Installation of **nvidia-docker2**:
  * Ubuntu *(tested on 18.04)*
* Installation of **docker-compose**
* Installation of [Jupyter-Hub from dodas-ts](https://github.com/dodas-ts/single-node-jupyterhub)
  * Run the Jupyter-hub

## :link: Useful resources

* External roles:
  * [gpu-support](https://baltig.infn.it/infn-cloud/ansible-role-gpu-support)
  * [monitoring](https://github.com/DODAS-TS/ansible-role-monitoring)

* Installation reference:
  * [cuda driver](https://docs.nvidia.com/datacenter/tesla/tesla-installation-notes/index.html)
  * [nvidia docker installation guide](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker)

License
-------

Apache 2.0

Author Information
------------------

DODAS-TS

