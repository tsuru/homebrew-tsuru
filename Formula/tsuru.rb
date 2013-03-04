require 'formula'

class Tsuru < Formula
  url 'https://s3.amazonaws.com/tsuru/dist-src/tsuru-src.tar.gz'
  version '0.6'
  homepage 'http://tsuru.io'
  md5 '1234567890ABCDEF1234567890ABCDEF'

  depends_on 'go'

  def install
    system "go", "build", "-o", "tsuru", "./cmd/tsuru/developer"
    bin.install "tsuru"
    bash_completion.install "misc/bash-completion.d/tsuru"
  end
end
