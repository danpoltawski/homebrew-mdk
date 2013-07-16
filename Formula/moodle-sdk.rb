require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class MoodleSdk < Formula
  homepage 'https://github.com/FMCorz/mdk/'
  url 'https://github.com/FMCorz/mdk/archive/v0.4.1.zip'
  sha1 '4e53ec5e1942c7d902a8889e258dc67acb841c45'
  version '0.4'

  def install
      dir = (libexec+'moodle-sdk')
      dir.mkpath
      dir.install 'mdk.py'
      dir.install 'version.py'
      dir.install 'config-dist.json'
      dir.install Dir['lib']
      dir.install Dir['scripts']
      bin.install_symlink dir+'mdk.py' => 'mdk'
      bash_completion.install  'extra/bash_completion'
  end

  def caveats; <<-EOS.undent
    You should install the keyring package, to do this run:
      $ sudo pip install keyring

    EOS
  end
end
