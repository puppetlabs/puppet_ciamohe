plan puppet_ciamohe::teardown(
) {
  run_task('provision::vmpooler', 'localhost', action=> 'tear_down_nodes', inventory => './')
}


