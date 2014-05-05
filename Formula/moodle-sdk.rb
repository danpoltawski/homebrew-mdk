require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class MoodleSdk < Formula
  homepage 'https://github.com/FMCorz/mdk/'
  url 'https://github.com/FMCorz/mdk/archive/394f5adca4e7750674d9bf9bfa95434d39c1a0a1.zip'
  sha1 '17831754263cb227ff3bf93564227d7cc878eac8'
  version '1.2-brewdev1'

  def install
      dir = (libexec+'moodle-sdk')
      dir.mkpath
      dir.install 'requirements.txt'
      dir.install 'mdk.py'
      dir.install 'version.py'
      dir.install 'config-dist.json'
      dir.install Dir['lib']
      dir.install Dir['scripts']
      bin.install_symlink dir+'mdk.py' => 'mdk'
      bash_completion.install  'extra/bash_completion'
  end

  def caveats; <<-EOS.undent
    You will need to install the some pip depdencies for example, keyring. To do this run:
      $ sudo pip install keyring

    Check for missing depencies by running:
      $ brew doctor --dependencies

    EOS
  end
end
