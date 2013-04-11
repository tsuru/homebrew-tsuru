require 'formula'

class TsuruAdmin < Formula
  url 'https://s3.amazonaws.com/tsuru/dist-src/tsuru-admin-0.1.3.tar.gz'
  homepage 'http://tsuru.io'
  sha256 '97c52807f82f9f3b003bc7bb0b627e26ef66dd9839f1d534c0f1da00f992f57e'

  depends_on 'go'

  def install
    system "bash", "-c", "GOPATH=\"$PWD\" go build -o tsuru-admin github.com/globocom/tsuru/cmd/tsuru-admin"
    bin.install "tsuru-admin"
  end
end
