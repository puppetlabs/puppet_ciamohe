plan puppet_ciamohe::tester(
) {
  # get pe_server ?
  $server = get_targets('*').filter |$n| { $n.vars['role'] == 'pe' }
  $agents = get_targets('*').filter |$n| { $n.vars['role'] =~ /agent/}
  $agent_names = $agents.map |$n| { $n.name }
  
  $manifest = "class { 'motd':\ncontent => 'foomph'\n}"
  $agent_names.each |$agent_name| {
    run_task('puppet_ciamohe::update_node_pp', $server, manifest => $manifest, target_node => $agent_name)
  }
  run_command('puppet agent -t', $agents)
}
