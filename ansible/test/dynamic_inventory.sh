#!/bin/bash

      echo -e "
        hosts:
          appserver:
               ansible_host: ${a[1]}" > inventory.yml
