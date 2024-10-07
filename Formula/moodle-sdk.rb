require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class MoodleSdk < Formula
  homepage 'https://github.com/FMCorz/mdk/'
  url 'https://github.com/FMCorz/mdk/archive/v2.1.2.zip'
  sha256 '43689621a43a53b72fd55a2996689b4b98a63b8b7c323108b6f1b301e2abffd0'
  version '2.1.2'

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
