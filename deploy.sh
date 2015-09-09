#!/bin/sh

eval `ssh-agent`

ssh-add ~/.ssh/id_rsa
ssh-add -l

### bundle exec cap staging deploy
### bundle exec cap development deploy:check
bundle exec cap development deploy

ssh-agent -k
