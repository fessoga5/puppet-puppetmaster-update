# vim: sts=4 ts=4 sw=4 expandtab autoindent
#
#INSTALL SKYPE ON DESKTOP
#
class puppet-puppetmaster-update ($source, $destination = "/root/puppetmaster.deb") {

    wget::fetch { 'puppetmaster.deb':
        source      => $source,
        destination => $destination,
        timeout     => 0,
        verbose     => false,
    }

    package {"puppetmaster":
        provider => dpkg,
        ensure   => latest,
        source   => $destination,
        require  => Wget::Fetch['puppetmaster.deb']
    }
}
