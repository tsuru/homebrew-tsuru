require 'formula'

class TsuruAdmin < Formula
  url 'https://s3.amazonaws.com/tsuru/dist-src/tsuru-admin-0.1.1.tar.gz'
  homepage 'http://tsuru.io'
  sha256 '91c1311914b8b18d30d614b3131544d0cda377fedab0c77569c41033b1649a5c'

  depends_on 'go'

  def install
    system "bash", "-c", "GOPATH=\"$PWD\" go build -o tsuru-admin github.com/globocom/tsuru/cmd/tsuru-admin"
    bin.install "tsuru-admin"
  end
end
