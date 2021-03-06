#!/bin/sh -xe

eval `ssh-agent`

ssh-add ~/.ssh/id_rsa
ssh-add -l

### bundle exec cap staging deploy
### bundle exec cap development deploy:check
bundle exec cap development deploy || RET=$?

ssh-agent -k

exit $RET
