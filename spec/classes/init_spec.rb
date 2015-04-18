require 'spec_helper'

describe 'ldirectord', :type => 'class' do
  context "On a CentOS 5 system with no options" do
    let :facts do
      {
        :osfamily               => 'RedHat',
        :operatingsystem        => 'CentOS',
        :operatingsystemrelease => '5.5',
      }
    end
    it { 
      should contain_package('perl-Socket6').with({'name' => 'perl-Socket6' }) 
      should contain_package('perl-IO-Socket-INET6').with({'name' => 'perl-IO-Socket-INET6' }) 
      should contain_package('perl-MailTools').with({'name' => 'perl-MailTools' }) 
      should contain_package('ipvsadm').with({'name' => 'ipvsadm' }) 
      should contain_package('curl').with({'name' => 'curl' }) 
      should contain_file('/usr/sbin/ldirectord').with({'mode' => '0755'}) 
      should contain_concat__fragment('global_opts').with({'target' => '/etc/ldirectord.cf'}) 
    }
  end
  context "On a CentOS 6 system with no options" do
    let :facts do
      {
        :osfamily => 'RedHat',
        :operatingsystem => 'CentOS',
        :operatingsystemrelease => '6.5',
        :concat_basedir => '/foo'
      }
    end
    it {
      should contain_package('perl-Socket6').with({'name' => 'perl-Socket6' })
      should contain_package('perl-IO-Socket-INET6').with({'name' => 'perl-IO-Socket-INET6' })
      should contain_package('perl-MailTools').with({'name' => 'perl-MailTools' })
      should contain_package('ipvsadm').with({'name' => 'ipvsadm' })
      should contain_package('curl').with({'name' => 'curl' })
      should contain_file('/usr/sbin/ldirectord').with({'mode' => '0755'})
      should contain_concat__fragment('global_opts').with({'target' => '/etc/ldirectord.cf'})
    }
  end
  context "On a CentOS 7 system with no options" do
    let :facts do
      { 
        :osfamily => 'RedHat',
        :operatingsystem => 'CentOS',
        :operatingsystemrelease => '6.5',
        :concat_basedir => '/foo'
      }
    end
    it {
      should contain_package('perl-Socket6').with({'name' => 'perl-Socket6' })
      should contain_package('perl-Sys-Syslog').with({'name' => 'perl-Sys-Syslog' })
      should contain_package('perl-libwww-perl').with({'name' => 'perl-libwww-perl' })
      should contain_package('perl-IO-Socket-INET6').with({'name' => 'perl-IO-Socket-INET6' })
      should contain_package('perl-MailTools').with({'name' => 'perl-MailTools' })
      should contain_package('ipvsadm').with({'name' => 'ipvsadm' })
      should contain_package('curl').with({'name' => 'curl' })
      should contain_file('/usr/sbin/ldirectord').with({'mode' => '0755'})
      should contain_concat__fragment('global_opts').with({'target' => '/etc/ldirectord.cf'})
    }
  end
  context "On a Fedora system with no options" do
    let :facts do
      {
        :osfamily => 'RedHat',
        :operatingsystem => 'Fedora',
        :concat_basedir => '/foo'
      }
    end
    it {
      should contain_package('ldirectord').with({'name' => 'ldirectord' })
      should contain_concat__fragment('global_opts').with({'target' => '/etc/ldirectord.cf'})
    }
  end


  context "On a Debian system with no options" do
    let :facts do 
      {
        :osfamily => 'Debian',
        :operatingsystem => 'Debian',
        :concat_basedir => '/foo'
      }
    end
    it { 
      should contain_package('ldirectord').with({'name' => 'ldirectord'}) 
      should contain_concat__fragment('global_opts').with({'target' => '/etc/ldirectord.cf'}) 
    }
  end

  context "On a Ubuntu system with no options" do
    let :facts do
      {
        :osfamily => 'Debian',
        :operatingsystem => 'Ubuntu',
        :concat_basedir => '/foo'
      }
    end
    it {
      should contain_package('ldirectord').with({'name' => 'ldirectord'})
      should contain_concat__fragment('global_opts').with({'target' => '/etc/ldirectord.cf'})
    }
  end

  context "On a OpenSuSE system with nothing specified" do
    let :facts do
      {
        :osfamily => 'Suse',
        :operatingsystem => 'OpenSuSE',
        :concat_basedir => '/foo'
      }
    end
    it { 
      should contain_package('ldirectord').with({'name' => 'ldirectord'})
      should contain_concat__fragment('global_opts').with({'target' => '/etc/ldirectord.cf'})
    }
  end

  context "On a SLES system with nothing specified" do
    let :facts do
      {
        :osfamily => 'Suse',
        :operatingsystem => 'SLES',
        :concat_basedir => '/foo'
      }
    end
    it {
      expect { should raise_error(Puppet::Error) }
    }
  end


  context "On a Debian system with download location http" do
    let :facts do
      {
        :osfamily => 'Debian',
        :operatingsystem => 'Debian',
        :concat_basedir => '/foo'
      }
    end
    let :params do
      {
        :download_location => 'http'
      }
    end
    it {
      expect { should raise_error(Puppet::Error) }
    }
  end

  context "On a Ubuntu system with download location http" do
    let :facts do
      {
        :osfamily => 'Debian',
        :operatingsystem => 'Debian',
        :concat_basedir => '/foo'
      }
    end
    let :params do
      {
        :download_location => 'http'
      }
    end
    it {
      expect { should raise_error(Puppet::Error) }
    }
  end

  context "On a Debian system with download location puppet" do
    let :facts do
      {
        :osfamily => 'Debian',
        :operatingsystem => 'Debian',
        :concat_basedir => '/foo'
      }
    end
    let :params do
      {
        :download_location => 'puppet'
      }
    end
    it {
      expect { should raise_error(Puppet::Error) }
    }
  end

  context "On a Ubuntu system with download location puppet" do
    let :facts do
      {
        :osfamily => 'Debian',
        :operatingsystem => 'Debian',
        :concat_basedir => '/foo'
      }
    end
    let :params do
      {
        :download_location => 'puppet'
      }
    end
    it {
      expect { should raise_error(Puppet::Error) }
    }
  end




end
