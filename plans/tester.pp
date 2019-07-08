plan puppet_ciamohe::tester(
) {
  # get pe_server ?
  $server = get_targets('*').filter |$n| { $n.vars['role'] == 'pe' }
  $agent_linux = get_targets('*').filter |$n| { $n.vars['role'] =~ /agent_linux/ }

  # get the agent_name
  $agent_hostname = $agent_linux[0].name
  $manifest = "class { 'motd':\ncontent => 'foomph'\n}"
  run_task('puppet_ciamohe::update_node_pp', $server, manifest => $manifest, target_node => $agent_hostname)
  run_command('puppet agent -t', $agent_linux)
}
