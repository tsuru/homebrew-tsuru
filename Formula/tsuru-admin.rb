require 'formula'

class TsuruAdmin < Formula
  url 'https://s3.amazonaws.com/tsuru/dist-src/tsuru-admin-0.1.6.tar.gz'
  homepage 'http://tsuru.io'
  sha256 '46410268aabdfcc5227d8ce21e57af6e0911a72b43cfadface4e7ae6496a01eb'

  depends_on 'go'

  def install
    system "bash", "-c", "GOPATH=\"$PWD\" go build -o tsuru-admin github.com/globocom/tsuru/cmd/tsuru-admin"
    bin.install "tsuru-admin"
  end
end
