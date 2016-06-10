# Docker image for [ManuaLE](https://github.com/veeti/manuale), a fully manual Let's Encrypt/ACME client

Based on [Alpine Linux](http://alpinelinux.org/).

## Description

From the ManuaLE README:

manuale is a fully manual [Let's Encrypt](https://letsencrypt.org)/[ACME](https://github.com/ietf-wg-acme/acme/) client for advanced users. It is intended to be used by a human in a manual workflow and contains no automation features whatsoever.

## Usage

While using this image, you will create a few files that you might want to save out of the container (`account.json` and the generated certificates and keys). The easiest is to mount a directory from the host in the container as a volume.

You need to create an account once. To do so, call `docker run --rm -ti -v $PWD:/data jgiannuzzi/letsencrypt-manuale register [email]`. This will create a new account key for you. Follow the registration instructions.

Once that's done, you'll have your account saved in `account.json` in the current directory. You'll need this to do anything useful. Oh, and it contains your private key, so keep it safe and secure.

`manuale` expects the account file to be in your working directory by default, so you'll probably want to make a specific directory to do all your certificate stuff in. Likewise, created certificates get saved in the current path by default.

Next up, verify the domains you want a certificate for with `docker run --rm -ti -v $PWD:/data jgiannuzzi/letsencrypt-manuale authorize [domain]`. This will show you the DNS records you need to create and wait for you to do it. For example, you might do it for `example.com` and `www.example.com`.

Once that's done, you can finally get down to business. Run `docker run --rm -ti -v $PWD:/data jgiannuzzi/letsencrypt-manuale issue example.com www.example.com` to get your certificate. It'll save the key, certificate and certificate with intermediate to the working directory.

There's plenty of documentation inside each command. Run `docker run --rm -ti -v $PWD:/data jgiannuzzi/letsencrypt-manuale -h` for a list of commands and `docker run --rm -ti -v $PWD:/data jgiannuzzi/letsencrypt-manuale [command] -h` for details.

[![Build Status](https://travis-ci.org/jgiannuzzi/docker-letsencrypt-manuale.svg?branch=master)](https://travis-ci.org/jgiannuzzi/docker-letsencrypt-manuale)
