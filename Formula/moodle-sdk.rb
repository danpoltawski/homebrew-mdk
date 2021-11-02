require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class MoodleSdk < Formula
  homepage 'https://github.com/FMCorz/mdk/'
  url 'https://github.com/FMCorz/mdk/archive/v2.0.4.zip'
  sha256 'c0d1db905ceff9469b7477a5b2ca8d21594968640941e014a34374e59cc62f11'
  version '2.0.4'

  def install
      dir = (libexec+'moodle-sdk')
      dir.mkpath
      dir.install 'requirements.txt'
      dir.install 'mdk.py'
      dir.install Dir['mdk']
      bin.install_symlink dir+'mdk.py' => 'mdk'
      bash_completion.install  'extra/bash_completion'
  end

  def caveats; <<-EOS.undent
    You will need to install the some pip dependencies for example, keyring. To do this run:
      $ sudo pip install -r /usr/local/opt/moodle-sdk/libexec/moodle-sdk/requirements.txt

    Check for missing dependencies by running:
      $ mdk doctor --dependencies

    EOS
  end
end
