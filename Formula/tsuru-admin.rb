require 'formula'

class TsuruAdmin < Formula
  url 'https://s3.amazonaws.com/tsuru/dist-src/tsuru-admin-0.1.tar.gz'
  homepage 'http://tsuru.io'
  sha256 '91b6c8a7a1b203eb2bba54bb6819cb7610ed96d67997b8bef5513ce112814218'

  depends_on 'go'
  depends_on 'bzr'

  def install
    system "bash", "-c", "GOPATH=\"\" go get -d ./cmd/tsuru-admin"
    system "bash", "-c", "GOPATH=\"\" go build -o tsuru-admin ./cmd/tsuru-admin"
    bin.install "tsuru-admin"
  end
end
