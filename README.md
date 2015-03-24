# Puppet Module - ldirectord

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with ldirectord](#setup)
    * [What ldirectord affects](#what-ldirectord-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with ldirectord](#beginning-with-ldirectord)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

There was not an ldirectord puppet module.  So here one is.

## Module Description

Installs ldirectord from the mainteners website, from puppet source, 
or from package. Provides new type, to configure load balancer entries.

## Setup

### What ldirectord affects

* Installs ldirectord in /usr/sbin/
* Installs all needed perl modules,
* Installs ipvsadm

### Setup Requirements **OPTIONAL**

* pluginsync = true is required.
* puppetlabs concat module required
* puppetlabs stdlib required.

### Beginning with ldirectord

To get started you can simply define a vritual host

     ldirectord::virtual_host { "servicename-80":
       name         => "servicename-80",
       virtual      => "192.168.xx.xx",
       real         => [ "192.168.xx.xx", "192.168.xx.xx" ],
       real_options => "gate",
       port         => '80',
       service      => 'http',
       request      => '/lb.html',
       receive      => 'up',
       protocol     => 'tcp',
       scheduler    => 'wlc',
       checktype    => 'negotiate',
       persistent   => '900',
     }

The above defined by itself will include the ldirector class 
and give you an /etc/ldirector.cf file that looks like so:
#Managed by puppet using ldirectord module.

    checkinterval=15
    checktimeout=15
    autoreload=no
    quiescent=yes
    logfile="/var/log/ldirectord.log"
    virtual=192.168.xx.xx:80
        real=192.168.xx.xx:80 gate
        real=192.168.xx.xx:80 gate
        service=http
        request="/lb.html"
        receive="up"
        scheduler=wlc
        protocol=tcp
        checktype=negotiate
        persistent=900

Unfortantly every entry you add you will need to increment the entrynumber,  
this is required because the concat module is used to prepare the the config file


## Usage

The defaults should be enough to get you started with a global options config but no 
virtual hosts.

if you want to edit the default global oiptions you can do so like so:

    class { ::ldirectord:
      #Install Options
      download_location = 'http://horms.net/projects/ldirectord/download/ldirectord-latest',
      package_name      = 'ldirectord',
      #Global Options
      configfile_path   = '/etc/ldirector.cf',
      checkinterval     = '15',
      checktimeout      = '15',
      connecttimeout    = undef,
      negotiatetimeout  = undef,
      checkcount        = undef,
      autoreload        = 'no',
      callback          = undef,
      quiescent         = 'yes',
      logfile           = '/var/log/ldirectord.log',
    }

Note:  If you want to install ldirectord from a package rather then the maintaners website,  change download location to package,  
       If you want to install from a puppet file,  change to puppet and place the ldirectord file you want to use in the file directory

Defining a service the following options are available:

      ldirectord::virtual_host { "servicename":
        entrynumber,
        name,
        virtual,
        real,
        real_options,
        port,
        service,
        protocol,
        scheduler,
        checktype = undef,
        checkport = undef,
        httpmethod = undef,
        virtualhost = undef,
        login = undef,
        passwd = undef,
        database = undef,
        request = undef,
        receive = undef,
        checktype = undef,
        netmask = undef,
        persistent = undef,
      }


## Reference

Will update later

## Limitations

This is where you list OS compatibility, version compatibility, etc.
Tested on Centos6, and ubuntu 12.04

## Development

Please feel free to make this better then it is.

## Release Notes/Contributors/Etc **Optional**

If you aren't using changelog, put your release notes here (though you should
consider using changelog). You may also add any additional sections you feel are
necessary or important to include here. Please use the `## ` header.
