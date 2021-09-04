# Puppet
<img src=".images/logo.png" alt="Puppet Labs" width="200"/>

### Objective:  
Puppet is the most powerful configuration management tool in the solar system. bolt mark. Bolt. Spend less time on manual tasks with our task orchestrator.

### Documentation:
Documentation for Puppet and related projects can be found online at the [Puppet Docs site](https://puppet.com/docs).

### Contributing:
Read more [here](./CONTRIBUTING.md) 

### Puppet Modules:
[Forge](https://forge.puppet.com/).

```bash
.
├── CONTRIBUTING.md   # How to Contribute 
├── data              # Store the configuration data in key-value pairs
├── environment.conf  # Any environment can contain an environment.conf file.
├── Gemfile
├── hiera.yaml        # Hiera uses layers of data with a hiera.yaml for each layer.
├── manifests         # Grouping and classifying nodes
├── modules           # Normal modules that manage one particular technology, for example puppetlabs/apache.
├── Puppetfile        # The Puppetfile specifies the modules and data that you want in each environment.
├── Readme.md         # Project Markdown
└── site
    ├── profile       # Wrapper classes that use multiple component modules to configure a layered technology stack.
    └── role          # Wrapper classes that use multiple profiles to build a complete system configuration.

```

Local Development:
-------------
### Prerequisites
| Name | Source | Version |
|------|--------|---------|
| vagrant | hashicorp | >= 2.2.18 |
| virtualbox | oracle | >= 6.0 |

#### Start Environment
```bash
vagrant up
```

#### Validate the Virtual Machines
```bash
$ vagrant status

Current machine states:

puppetserver              running (virtualbox)
centos7                   running (virtualbox)

```

#### Connect on puppet agent to test
```bash
$ vagrant ssh centos7
$ sudo -i
# puppet agent -t 
```
