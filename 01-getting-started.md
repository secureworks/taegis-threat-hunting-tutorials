# Tutorial 1: Getting Started

## Objectives

- Create a Python 3.11 virtual environment
- Install required dependencies
- Launch Jupyter Notebook web interface

## Description

In this tutorial, you will install the required Python packages and launch a Jupyter Notebook.
For your convenience, this tutorial covers both local and containerized installations using `conda`.

## Step 1: Clone Project

Clone this repository from GitHub:

```bash
git clone https://github.com/secureworks/taegis-threat-hunting-tutorials.git
```

Navigate into the project directory:

```bash
cd taegis-threat-hunting-tutorials
```

## Step 2: Install Dependencies

The recommend installing the dependencies for this tutorial in a container.
Alternative instructions have been provided for local installation using [`conda`](https://www.anaconda.com/download).

### Option 1 - Run in a Container

*Requirements:*

- `docker` (or `podman`) must be installed. `podman` users can replace `docker` with `podman` in the commands below.

<br>

Build the container using the Dockerfile:

```bash
docker build -t taegis-hunting-tutorials .
```

Once the container has finished building, run the container:

```bash
docker run -it --rm -p 8888:8888 taegis-hunting-tutorials start-notebook.sh
```

Open your browser and navigate to http://127.0.0.1:8888.

---

### Option 2 - Install Locally

*Requirements:*

- Download and install [`conda`](https://www.anaconda.com/download)

<br>

Create a new `conda` virtual environment running Python 3.11:

```bash
conda create -y -n taegis-hunting-tutorials python=3.11 ipykernel
```

Activate your conda environment:

```bash
conda activate taegis-hunting-tutorials
```

Use `pip` to install remaining dependencies:

```bash
python -m pip install -r requirements.txt
```

Use `ipykernel` to register the named Jupyter kernel:

```bash
python -m ipykernel install --name taegis-hunting-tutorials --user
```

From the project directory, launch Jupyter server:

```bash
jupyter notebook
```

If your browser does not automatically open, open your browser and navigate to http://127.0.0.1:8888.

## Step 3: Open Tutorial Notebook

Navigate the directory tree and open the next tutorial notebook.

# Wrap-Up

Congratulations! You are up and running.
Please carry on to the next tutorial.