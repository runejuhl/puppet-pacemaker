require 'facter'

Facter.add('pcmk_is_remote') do
  confine :service_provider => 'systemd'

  setcode do
    systemd_pcmk_remote = `/usr/bin/systemctl is-active pacemaker_remote`
    systemd_pcmk_remote.downcase.chomp == 'active'
  end
end
