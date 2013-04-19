require 'formula'

class TsuruAdmin < Formula
  url 'https://s3.amazonaws.com/tsuru/dist-src/tsuru-admin-0.1.5.tar.gz'
  homepage 'http://tsuru.io'
  sha256 '84f3338161b63d4e282fc0be716ab2e975e62df94ec77b416ccc3b58be0e48ef'

  depends_on 'go'

  def install
    system "bash", "-c", "GOPATH=\"$PWD\" go build -o tsuru-admin github.com/globocom/tsuru/cmd/tsuru-admin"
    bin.install "tsuru-admin"
  end
end
