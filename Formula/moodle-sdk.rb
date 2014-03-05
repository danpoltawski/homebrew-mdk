require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class MoodleSdk < Formula
  homepage 'https://github.com/FMCorz/mdk/'
  url 'https://github.com/FMCorz/mdk/archive/37b8ce88bd3bddc9a8df5fc5b2c798889acd3b53.zip'
  sha1 'bbcee06cff539a29e8086265a8c0694fd8b91aba'
  version '0.6-brewdev1'

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
