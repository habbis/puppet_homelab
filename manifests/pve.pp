# basic server setup
class puppet_homelab::pve.pp {

  include puppet_homelab::pve::packages7
  include puppet_homelab::pve::pve7_list
  include puppet_homelab::pve::sshd.pp
  include puppet_homelab::pve::xinetd.pp

}
