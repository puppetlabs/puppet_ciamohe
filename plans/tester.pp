plan puppet_ciamohe::tester(
) {
  # get pe_server ?
  $server = get_targets('*').filter |$n| { $n.vars['role'] == 'pe' }
  $agent_linux = get_targets('*').filter |$n| { $n.vars['role'] =~ /agent_linux/ }
  $agent_windows = get_targets('*').filter |$n| { $n.vars['role'] =~ /agent_windows/ }
  
  # get the agent_name
  $manifest = "class { 'motd':\ncontent => 'foomph'\n}"
  
  $agent_linux_hostname = $agent_linux[0].name
  run_task('puppet_ciamohe::update_node_pp', $server, manifest => $manifest, target_node => $agent_linux_hostname)
  #run_command('puppet agent -t', $agent_linux)
  
  $agent_windows_hostname = $agent_windows[0].name
  run_task('puppet_ciamohe::update_node_pp', $server, manifest => $manifest, target_node => $agent_windows_hostname)
  run_command('puppet agent -t', get_targets('*').filter |$n| { $n.vars['role'] =~ /agent/})
}
