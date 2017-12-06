# Project Dahpne


## Achtergronden

* https://git.osd.surfsara.nl/francisc/openstack-ansible
* https://git.osd.surfsara.nl/DDP/daphne

## Informatie

* GSP OpenStack bekijken
* Kubernetes as a Service <> Tenant met eigen Kubernetes
* Component testing
* Omgeving: 10 nodes beschikbaar voor tests
* Netwerk, 
 * SanderB design
 * Federatie met Nikhef & Groningen
 * OpenContrail, keuze vanuit Tristan...
 * evalutatie ervan is nog open.
 * Intel DPDK 
* Foreman (system installer), Maarten 
* Stabiel en beheersbaar cloud.
* OS complete stacks, Merantis etc etc
 ** RDO release 'gekozen'
* Storage
 ** CEPH
 ** GINA heeft niet veel storage nodig
 *** CEPH, root disk
 *** Local, scratch ??
* OpenStack services in Docker.
* Security
** Cloud Model
** Fysieke scheiding ??
* HA transparant
** hoe minder, hoe beter??
** Message Bus (RabbitMQ)
* Metering (Luis)
* Accounting
* Second Platform, "standaard cluster setup" herhaalbare Tenant setup: worker nodes + batch schedular (slurm)

## Project Documentatie

Topic list voor de **Design Guide**

Project Design Document
* Background

* Exec Summary
* Requirementn
* Physical Architecture
** Compute 
** Storage
* Service Architecture
* Tenant Architecture
* Maintenance
** Upgrades
** Automated Testing
* Roadmap


