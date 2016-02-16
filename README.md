RAagent Cookbook
================
TODO: Installs RAAgent on Linux node


Requirements
------------
Tested on CentOS 6

Attributes
----------
default[:RAagent][:install_dir]  = '/opt/CA/RAagent'
default[:RAagent][:RA_Server]  = 'ITADO'
default[:RAagent][:RA_Server_Port]  = '8080'
default[:RAagent][:RA_ES_nimi_Port]  = '6600'
default[:RAagent][:application]  = "Lisa Cars"
default[:RAagent][:server_type]   = "Application Server"
default[:RAagent][:environment]   = "QA"

e.g.
#### RAagent::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['RAagent']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

Usage
-----
#### RAagent::default
TODO: Write usage instructions for each cookbook.

e.g.
Just include `RAagent` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[RAagent]"
  ]
}
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: TODO: List authors
