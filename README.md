# puppet_ciamohe

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with puppet_ciamohe](#setup)
    * [What puppet_ciamohe affects](#what-puppet_ciamohe-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with puppet_ciamohe](#beginning-with-puppet_ciamohe)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Limitations - OS compatibility, etc.](#limitations)
5. [Development - Guide for contributing to the module](#development)

## Description

allows you to run some funky tests

## Setup

    bundle install --path .bundle/gems/ --jobs 4
    bundle exec rake spec_prep
    # this will provision machines, and label them in the inventory files
    bundle exec bolt --modulepath /Users/tp/workspace/git/puppet_ciamohe/spec/fixtures/modules plan run puppet_ciamohe::provisioner --inventoryfile inventory.yaml
    
    # this installs pe on a machines that is labelled in the inventory file, install a module, turn on autosign, set the ui password to litmus, updates the site.pp
    bundle exec bolt --modulepath /Users/tp/workspace/git/puppet_ciamohe/spec/fixtures/modules plan run puppet_ciamohe::server_setup  --inventoryfile inventory.yaml
    
    # only install the agent on the labeled machines, (we do not need the cert signing), run agent -t to module sync
    bundle exec bolt --modulepath /Users/tp/workspace/git/puppet_ciamohe/spec/fixtures/modules plan run puppet_ciamohe::agents  --inventoryfile inventory.yaml
    
    # for each agent machine to test against, create its own manifest on the server, trigger agent -t on the agent
    bundle exec bolt --modulepath /Users/tp/workspace/git/puppet_ciamohe/spec/fixtures/modules plan run puppet_ciamohe::tester  --inventoryfile inventory.yaml
