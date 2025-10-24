#!/bin/bash

ssh root@thanatos.local.tartarus.cloud -t 'systemctl reboot; bash -l'
ssh root@erinyes.local.tartarus.cloud -t 'systemctl reboot; bash -l'
ssh root@atlas.local.tartarus.cloud -t 'systemctl reboot; bash -l'
ssh root@theia.local.tartarus.cloud -t 'systemctl reboot; bash -l'

