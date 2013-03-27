require 'formula'

class TsuruAdmin < Formula
  url 'https://s3.amazonaws.com/tsuru/dist-src/tsuru-admin-0.1.tar.gz'
  homepage 'http://tsuru.io'
  sha256 '1623aeee2188a1c76d71c35373f783f4470ededfeb36b96f72fbc71137e9fc72'

  depends_on 'go'

  def install
    system "bash", "-c", "GOPATH=\"$PWD\" go build -o tsuru-admin github.com/globocom/tsuru/cmd/tsuru-admin"
    bin.install "tsuru-admin"
  end
end
