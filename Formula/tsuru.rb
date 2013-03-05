require 'formula'

class Tsuru < Formula
  url 'https://s3.amazonaws.com/tsuru/dist-src/tsuru-0.6.tar.gz'
  homepage 'http://tsuru.io'
  sha256 '5f7e51e909bb948db19d05cf14ec3ee40c6cff0d569cc84ef3c9aacc4286e11d'

  depends_on 'go'
  depends_on 'bzr'

  def install
    system "go", "get", "-d", "./cmd/tsuru"
    system "go", "build", "-o", "tsuru", "./cmd/tsuru"
    bin.install "tsuru"
    bash_completion.install "misc/bash-completion.d/tsuru"
  end
end
