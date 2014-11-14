require 'spec_helper'

describe 'ldirectord', :type => 'class' do
  context "On a RedHat system with no package name specified" do
    let :facts do
      {
        :osfamily => 'RedHat',
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
      should contain_concat__fragment('global_opts').with({'target' => '/etc/ldirector.cf'}) 
    }
  end

  context "On a debian system with package specified" do
    let :facts do 
      {
        :osfamily => 'Debian',
        :concat_basedir => '/foo'
      }
    end
    let :params do
      {
        :download_location => 'package'
      }
    end
    it { 
      should contain_package('ldirectord').with({'name' => 'ldirectord'}) 
      should contain_concat__fragment('global_opts').with({'target' => '/etc/ldirector.cf'}) 
    }
  end

  context "On a debian system with nothing specified" do
    let :facts do
      {
        :osfamily => 'Debian',
        :concat_basedir => '/foo'
      }
    end
    it { 
      should contain_file('/usr/sbin/ldirectord').with({'mode' => '0755'}) 
      should contain_concat__fragment('global_opts').with({'target' => '/etc/ldirector.cf'}) 
      should contain_package('ipvsadm').with({'name' => 'ipvsadm'}) 
      should contain_package('libauthen-radius-perl').with({'name' => 'libauthen-radius-perl'}) 
      should contain_package('libconvert-asn1-perl').with({'name' => 'libconvert-asn1-perl'})
      should contain_package('libcrypt-ssleay-perl').with({'name' => 'libcrypt-ssleay-perl'}) 
      should contain_package('libdbi-perl').with({'name' => 'libdbi-perl'}) 
      should contain_package('libdigest-hmac-perl').with({'name' => 'libdigest-hmac-perl'}) 
      should contain_package('libencode-locale-perl').with({'name' => 'libencode-locale-perl'}) 
      should contain_package('libfile-listing-perl').with({'name' => 'libfile-listing-perl'}) 
      should contain_package('libfont-afm-perl').with({'name' => 'libfont-afm-perl'}) 
      should contain_package('libhtml-form-perl').with({'name' => 'libhtml-form-perl'}) 
      should contain_package('libhtml-format-perl').with({'name' => 'libhtml-format-perl'}) 
      should contain_package('libhtml-parser-perl').with({'name' => 'libhtml-parser-perl'}) 
      should contain_package('libhtml-tagset-perl').with({'name' => 'libhtml-tagset-perl'}) 
      should contain_package('libhtml-tree-perl').with({'name' => 'libhtml-tree-perl'}) 
      should contain_package('libhttp-cookies-perl').with({'name' => 'libhttp-cookies-perl'}) 
      should contain_package('libhttp-daemon-perl').with({'name' => 'libhttp-daemon-perl'}) 
      should contain_package('libhttp-date-perl').with({'name' => 'libhttp-date-perl'}) 
      should contain_package('libhttp-message-perl').with({'name' => 'libhttp-message-perl'}) 
      should contain_package('libhttp-negotiate-perl').with({'name' => 'libhttp-negotiate-perl'}) 
      should contain_package('libio-socket-inet6-perl').with({'name' => 'libio-socket-inet6-perl'}) 
      should contain_package('libio-socket-ssl-perl').with({'name' => 'libio-socket-ssl-perl'}) 
      should contain_package('liblwp-mediatypes-perl').with({'name' => 'liblwp-mediatypes-perl'}) 
      should contain_package('liblwp-protocol-https-perl').with({'name' => 'liblwp-protocol-https-perl'}) 
      should contain_package('libmail-pop3client-perl').with({'name' => 'libmail-pop3client-perl'}) 
      should contain_package('libmailtools-perl').with({'name' => 'libmailtools-perl'}) 
      should contain_package('libnet-daemon-perl').with({'name' => 'libnet-daemon-perl'}) 
      should contain_package('libnet-dns-perl').with({'name' => 'libnet-dns-perl'}) 
      should contain_package('libnet-http-perl').with({'name' => 'libnet-http-perl'}) 
      should contain_package('libnet-imap-simple-perl').with({'name' => 'libnet-imap-simple-perl'}) 
      should contain_package('libnet-imap-simple-ssl-perl').with({'name' => 'libnet-imap-simple-ssl-perl'}) 
      should contain_package('libnet-ip-perl').with({'name' => 'libnet-ip-perl'}) 
      should contain_package('libnet-ldap-perl').with({'name' => 'libnet-ldap-perl'}) 
      should contain_package('libnet-ssleay-perl').with({'name' => 'libnet-ssleay-perl'}) 
      should contain_package('libparse-recdescent-perl').with({'name' => 'libparse-recdescent-perl'}) 
      should contain_package('libplrpc-perl').with({'name' => 'libplrpc-perl'}) 
      should contain_package('libsocket6-perl').with({'name' => 'libsocket6-perl'}) 
      should contain_package('liburi-perl').with({'name' => 'liburi-perl'}) 
      should contain_package('libwww-perl').with({'name' => 'libwww-perl'}) 
      should contain_package('libwww-robotrules-perl').with({'name' => 'libwww-robotrules-perl'}) 
    }
  end

end
