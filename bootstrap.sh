#!/bin/bash

# needed by kitchen.ci for testing
curl -L https://www.chef.io/chef/install.sh | bash

yum -y install epel-release
yum -y install jq

