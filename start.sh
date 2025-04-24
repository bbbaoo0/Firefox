#!/bin/bash

cloudflared tunnel --edge-ip-version auto run --token ${CF_TOKEN} &

/startapp.sh
