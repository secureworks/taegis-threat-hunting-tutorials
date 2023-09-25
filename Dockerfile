# Derived from https://jupyter-docker-stacks.readthedocs.io/en/latest/using/recipes.html#using-mamba-install-recommended-or-pip-install-in-a-child-docker-image

FROM docker.io/jupyter/minimal-notebook:2023-08-28

ARG env_name=taegis-hunting-tutorials
ARG py_ver=3.11

ENV DOCKER_STACKS_JUPYTER_CMD=notebook

COPY requirements.txt /tmp/requirements.txt
#COPY samples/*.ipynb ./samples/  TODO: Make sure to add samples in the same directory as the dockerfile

RUN mamba create --yes -p "${CONDA_DIR}/envs/${env_name}" \
    python=${py_ver} \
    'ipykernel' \
    'jupyterlab' && \
    mamba clean --all -f -y

RUN "${CONDA_DIR}/envs/${env_name}/bin/python" -m ipykernel install --user --name="${env_name}" && \
    jupyter notebook --generate-config && \
    echo "c.MultiKernelManager.default_kernel_name = '$env_name'" >> ~/.jupyter/jupyter_notebook_config.py && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

RUN "${CONDA_DIR}/envs/${env_name}/bin/pip" install --no-cache-dir -r /tmp/requirements.txt

COPY . "/home/${NB_USER}"

USER ${NB_UID}

RUN echo "conda activate ${env_name}" >> "${HOME}/.bashrc"