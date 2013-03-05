require 'formula'

class TsuruAdmin < Formula
  url 'https://s3.amazonaws.com/tsuru/dist-src/tsuru-admin-0.1.tar.gz'
  homepage 'http://tsuru.io'
  sha256 '5f7e51e909bb948db19d05cf14ec3ee40c6cff0d569cc84ef3c9aacc4286e11d'

  depends_on 'go'
  depends_on 'bzr'

  def install
    system "go", "get", "-d", "./cmd/tsuru-admin"
    system "go", "build", "-o", "tsuru-admin", "./cmd/tsuru-admin"
    bin.install "tsuru-admin"
  end
end
