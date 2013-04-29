require 'formula'

class TsuruAdmin < Formula
  url 'https://s3.amazonaws.com/tsuru/dist-src/tsuru-admin-0.1.8.tar.gz'
  homepage 'http://tsuru.io'
  sha256 '091fd508b6518931da7a8114cdd58b291217e3d9eeb5a19140fd4ab33ff2a797'

  depends_on 'go'

  def install
    system "bash", "-c", "GOPATH=\"$PWD\" go build -o tsuru-admin github.com/globocom/tsuru/cmd/tsuru-admin"
    bin.install "tsuru-admin"
  end
end
