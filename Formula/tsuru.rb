require 'formula'

class Tsuru < Formula
  url 'https://s3.amazonaws.com/tsuru/dist-src/tsuru-0.6.tar.gz'
  homepage 'http://tsuru.io'
  sha256 '4f20c1cb3ce5df7a0d89142bd41baed57d1c327db2fc9a7d2acd157998997e4b'

  depends_on 'go'

  def install
    system "go", "build", "-o", "tsuru", "./cmd/tsuru/developer"
    bin.install "tsuru"
    bash_completion.install "misc/bash-completion.d/tsuru"
  end
end
