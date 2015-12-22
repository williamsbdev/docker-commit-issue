# docker-commit-issue

To replicate the issue, simply:

    git clone git@github.com:williamsbdev/docker-commit-issue.git
    ./build.sh

This will/should cause docker to hang during the commit at which point
the only I have found to fix this is to stop the docker daemon. Be
careful of letting this run too long as it will fill the disk.
