Build the image on Raspberry Pi
===============================

```
docker build -t ymettier/rpi-docker-letsencrypt-nginx-proxy-companion:latest .
```

Maintaining this fork
=====================

Add the remote repo (do it once) :
```
git remote add upstream https://github.com/JrCs/docker-letsencrypt-nginx-proxy-companion.git
```

Synchronize with upstream branch :
```
git fetch upstream
git rebase upstream/master
```

