plan puppet_ciamohe::provisioner(
) {
  # provision server machine ? change group ?
  # friendly name ?
  run_task('provision::vmpooler', 'localhost', action => 'provision', platform => 'centos-7-x86_64', inventory => '/Users/tp/workspace/git/puppet_ciamohe')

#  # provision agents
# friendly name ? Role name agent_orange : agent_green 
#  run_task('provision::vmpooler', 'localhost', action => 'provision', platform => 'centos-6-x86_64', inventory => '/Users/tp/workspace/git/puppet_ciamohe')
#  run_task('provision::vmpooler', 'localhost', action => 'provision', platform => 'centos-6-x86_64', inventory => '/Users/tp/workspace/git/puppet_ciamohe')
}
