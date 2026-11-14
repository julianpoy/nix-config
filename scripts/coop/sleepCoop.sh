#!/bin/bash

ssh root@coop-thanatos.local -t 'systemctl suspend; bash -l'
ssh root@coop-erinyes.local -t 'systemctl suspend; bash -l'
ssh root@coop-atlas.local -t 'systemctl suspend; bash -l'
ssh root@coop-theia.local -t 'systemctl suspend; bash -l'

