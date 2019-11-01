#!/usr/bin/env bash

conda install -c conda-forge 'nodejs'
conda install -c conda-forge notebook nb_conda_kernels

pip install -e .
jlpm install
jlpm run build
jlpm run build:core
jupyter lab build

python setup.py bdist_wheel

cp -a dev_mode lab
tar czf medinfo.lab-2.0.0a1.tar.gz lab