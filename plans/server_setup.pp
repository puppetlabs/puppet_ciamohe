plan puppet_ciamohe::server_setup(
) {
  # get server ?
  $server = get_targets('*')
  # install server
  run_task('puppet_agent::install', $server)
  run_task('puppet_ciamohe::install_pe', $server)


  # run the cert signing dance

  # update site on server
  $manifest = "crapola banolo"
  run_task('puppet_ciamohe::update_site_pp', $server, manifest => $manifest)
  # install modules
  run_command('puppet module install puppetlabs-motd', $server)
}
