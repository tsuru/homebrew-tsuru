require 'formula'

class TsuruAdmin < Formula
  url 'https://s3.amazonaws.com/tsuru/dist-src/tsuru-admin-0.1.tar.gz'
  homepage 'http://tsuru.io'
  sha256 '7a97528d168a3e93bbc9723d0e24cb01e8d78dc4f6200667498111e78a6e19af'

  depends_on 'go'

  def install
    system "bash", "-c", "GOPATH=\"$PWD\" go build -o tsuru-admin github.com/globocom/tsuru/cmd/tsuru-admin"
    bin.install "tsuru-admin"
  end
end
