require 'formula'

class TsuruAdmin < Formula
  url 'https://s3.amazonaws.com/tsuru/dist-src/tsuru-admin-0.1.tar.gz'
  homepage 'http://tsuru.io'
  sha256 '4f20c1cb3ce5df7a0d89142bd41baed57d1c327db2fc9a7d2acd157998997e4b'

  depends_on 'go'

  def install
    system "go", "build", "-o", "tsuru-admin", "./cmd/tsuru/ops"
    bin.install "tsuru-admin"
  end
end
