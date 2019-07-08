plan puppet_ciamohe::agents(
) {
  # get pe_server ?
  $server = get_targets('*').filter |$n| { $n.vars['role'] == 'pe' }
  # get agents ?
  $agents = get_targets('*').filter |$n| { $n.vars['role'] =~ /agent/ }


  # install agents
  run_task('puppet_agent::install', $agents)
  # set the server 
  $server_string = $server[0].name
  run_task('puppet_conf', $agents, action => 'set', section => 'main', setting => 'server', value => "${server_string}")
  # rm -rf /etc/puppetlabs/puppet/ssl
  # run agent -t
  run_command('puppet agent -t', $agents)
}
