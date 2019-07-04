plan puppet_ciamohe::agents(
) {
  # get pe_server ?
  $pe_server = get_targets('*')
  # get agents ?
  $agents = get_targets('*')


  # install agents
  run_task('puppet_agent::install', $agents, action => 'provision', inventory => '/Users/tp/workspace/git/puppet_ciamohe')
  # run the cert signing dance
  # run agent -t
}
