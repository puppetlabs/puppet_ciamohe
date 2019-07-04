plan puppet_ciamohe::tester(
) {
  # get pe_server ?
  $pe_server = get_targets('*')
  
  # create manifest for agent_orange to use motd, set a funny message
  # run agent -t, on agent_orange
  # cat /etc/motd

  # create manifest for agent_green to use motd, set a funnier message
  # run agent -t, on agent_green
  # cat /etc/motd
}
