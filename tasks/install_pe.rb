#!/opt/puppetlabs/puppet/bin/ruby
require 'json'
require 'open3'
require 'puppet'

def install_pe(something = nil)
  pe_release = 2019.0
  pe_latest_cmd = "curl http://enterprise.delivery.puppetlabs.net/#{pe_release}/ci-ready/LATEST"
  stdout, stderr, status = Open3.capture3(pe_latest_cmd)
  
  pe_latest_string = stdout.delete("\n")
  pe_file_name = "puppet-enterprise-#{pe_latest_string}-el-7-x86_64"
  tar_file = "#{pe_file_name}.tar"
  download_url = "http://enterprise.delivery.puppetlabs.net/#{pe_release}/ci-ready/#{tar_file}"

  # Download PE
  download_pe_cmd = "wget -q #{download_url}"
  stdout, stderr, status = Open3.capture3(download_pe_cmd)

  # Install PE
  untar_cmd = "tar xvf #{tar_file}"
  stdout, stderr, status = Open3.capture3(untar_cmd)
  stdout, stderr, status = Open3.capture3("cd #{pe_file_name} && 1 | ./puppet-enterprise-installer")

  # Set Autosign
  autosign_cmd = "echo 'autosign = true' >> /etc/puppetlabs/puppet/puppet.conf"
  stdout, stderr, status = Open3.capture3(autosign_cmd)

  # Run agent
  stdout, stderr, status = Open3.capture3('puppet agent -t')
end

params = JSON.parse(STDIN.read)
something = params['something']

begin
  result = install_pe(something)
  puts result.to_json
  exit 0
rescue Puppet::Error => e
  puts({ status: 'failure', error: e.message }.to_json)
  exit 1
end
