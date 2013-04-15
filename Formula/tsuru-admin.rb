require 'formula'

class TsuruAdmin < Formula
  url 'https://s3.amazonaws.com/tsuru/dist-src/tsuru-admin-0.1.4.tar.gz'
  homepage 'http://tsuru.io'
  sha256 'a22eb9a7d41187d5d97d047680b264c887b4c37eb59977b40e034e5b5433867b'

  depends_on 'go'

  def install
    system "bash", "-c", "GOPATH=\"$PWD\" go build -o tsuru-admin github.com/globocom/tsuru/cmd/tsuru-admin"
    bin.install "tsuru-admin"
  end
end
