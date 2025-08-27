#!/bin/bash

ssh root@10.0.1.187 -t 'systemctl suspend; bash -l'
ssh root@10.0.1.42 -t 'systemctl suspend; bash -l'
ssh root@10.0.3.24 -t 'systemctl suspend; bash -l'
ssh root@10.0.1.244 -t 'systemctl suspend; bash -l'

