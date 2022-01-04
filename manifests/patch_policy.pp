class puppet_homelab::patch_policy (
  $patch_policy = '000000',) {
    validate_string($patch_policy)

  # Convert $patch_policy to humane readable $patch_policy_content
  case $patch_policy {
    '000000':   {$patch_policy_content = 'policy: 000000 - No patche policy is set!'}
    '010000':   {$patch_policy_content = 'policy: 010000 - Wednesday on week after patch Tuesday kl 03:00'}
    '010100':   {$patch_policy_content = 'policy: 010100 - Wednesday on week after patch Tuesday kl 07:00'}
    '010200':   {$patch_policy_content = 'policy: 010200 - Wednesday on week after patch Tuesday kl 11:00'}
    '020000':   {$patch_policy_content = 'policy: 020000 - Third  thursday kl 03:00'}
    '020100':   {$patch_policy_content = 'policy: 020100 - Third  saturday kl 01:00'}
    '020200':   {$patch_policy_content = 'policy: 020200 - Last Wednesday in the month'}
    '020300':   {$patch_policy_content = 'policy: 020300 - Last Thursday in the month'}
    '020400':   {$patch_policy_content = 'policy: 020400 - First  monday in the month, time kl 00:00'}
    '020401':   {$patch_policy_content = 'policy: 020401 - Third monday in the month, time kl 01:00'}
    '020402':   {$patch_policy_content = 'policy: 020402 - Third monday in the month, time kl 02:00'}
    '020500':   {$patch_policy_content = 'policy: 020500 - Second Thursday in the month, time kl 01:00-05:00'}
    '030000':   {$patch_policy_content = 'policy: 030000 - Egne avtaler'}
    '030100':   {$patch_policy_content = 'policy: 030100 - Service window'}
    '030101':   {$patch_policy_content = 'policy: 030101 - Service window special"'}
    '040000':   {$patch_policy_content = 'policy: 040000 - No autopatching patching / manual'}
    '040200':   {$patch_policy_content = 'policy: 040200 - No patching, only restart. third  Wednesday kl 01:00'}
    '040300':   {$patch_policy_content = 'policy: 040300 - No patching, only restart. third Wednesday kl 10:00 (daytime)"'}
    default:  {$patch_policy_content = "policy: Invalid parameter - ${patch_policy}"}
  }

  # Writeing value of $patch_policy_content to file
  if ! defined(File['/etc/puppet_homelab']) {
    file {
      '/etc/puppet_homelab':
        ensure  => 'directory',
        mode    => '0700';
    }
  }
  file { '/etc/puppet_homelab/patch_policy':
    ensure  => file,
    content => "# Managed by Puppet\n\n${patch_policy_content}\n",
  }

}
