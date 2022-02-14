# setup dam server
class puppet_homelab::dam_setup {

  include puppet_homelab::dam_setup/dam_packages
  include puppet_homelab::dam_setup/dam_user
}
