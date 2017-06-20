# @summary This profile installs mysql without default accounts
class profile::sample_website::mysql {

  class { 'mysql::server':
    remove_default_accounts => true
  }

}
