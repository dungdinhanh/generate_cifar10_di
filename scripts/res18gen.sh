#!/bin/bash

batch=256
net="resnet18"
for (( c=0; c<=1000; c++ ))
do
  cmd="python deepinversion_cifar10.py --teacher_weights checkpoint/state_dicts/${net}.pt --net ${net} --i_start ${c} --iters_mi 5001"
  echo $cmd
  eval $cmd
  num_images=$((batch * c + batch))
  echo $num_images
  if [ $num_images -ge 50000 ]; then
      break
      fi
done
#cmd="python deepinversion_cifar10.py --teacher_weights checkpoint/state_dicts/resnet34.pt --net resnet34"
#echo $cmd
#eval $cmd
