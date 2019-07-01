plan puppet_ciamohe::myplan(
  TargetSpec $load_balancer,
) {

  run_task('provision::vmpooler', $load_balancer, action => 'provision', platform => 'ubuntu-1604-x86_64', inventory => '/Users/tp/workspace/git/puppet_ciamohe')

#  $manifest = "crapola banolo"
#  run_task('mymodule::lb_remove', $load_balancer, webservers => $webserver_names)
}
