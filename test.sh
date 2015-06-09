#!/bin/sh -e

cd chainer
python setup.py install
pip install `chainer-cuda-requirements`

pip install nose coverage
nosetests --with-coverage --cover-package=chainer
coverage xml -i