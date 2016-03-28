#!/bin/sh -ex

cd chainer
python setup.py develop install

if [ $CUDNN = none ]; then
  nosetests --with-coverage --cover-branches --cover-package=chainer,cupy -a '!cudnn'
else
  nosetests --with-coverage --cover-branches --cover-package=chainer,cupy
fi

coverage xml -i

if [ $COVERALLS_REPO_TOKEN ]; then
  coveralls
fi
