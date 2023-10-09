require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class MoodleSdk < Formula
  homepage 'https://github.com/FMCorz/mdk/'
  url 'https://github.com/FMCorz/mdk/archive/v2.0.10.zip'
  sha256 'ce59d20ec2f6929934b2a9e5d6251b1ec3f497452739189b277414fd89722ba7'
  version '2.0.10'

  def install
      dir = (libexec+'moodle-sdk')
      dir.mkpath
      dir.install 'requirements.txt'
      dir.install 'mdk.py'
      dir.install Dir['mdk']
      bin.install_symlink dir+'mdk.py' => 'mdk'
      bash_completion.install  'extra/bash_completion'
  end

  def caveats; <<~EOS
    You will need to install the some pip dependencies for example, keyring. To do this run:
      $ sudo pip install -r /usr/local/opt/moodle-sdk/libexec/moodle-sdk/requirements.txt

    Check for missing dependencies by running:
      $ mdk doctor --dependencies

    EOS
  end
end
