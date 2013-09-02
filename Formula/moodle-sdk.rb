require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class MoodleSdk < Formula
  homepage 'https://github.com/FMCorz/mdk/'
  url 'https://github.com/FMCorz/mdk/archive/v0.4.2.zip'
  sha1 '590243ad17b7af037ce87da261f62fb9c6ec58f2'
  version '0.4.2'

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
