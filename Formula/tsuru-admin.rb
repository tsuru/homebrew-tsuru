require 'formula'

class TsuruAdmin < Formula
  url 'https://s3.amazonaws.com/tsuru/dist-src/tsuru-admin-0.1.7.tar.gz'
  homepage 'http://tsuru.io'
  sha256 'ae76c5f5a4320442dccf9245f41da238c3650d6e5de59392bd6343d47bbfa57a'

  depends_on 'go'

  def install
    system "bash", "-c", "GOPATH=\"$PWD\" go build -o tsuru-admin github.com/globocom/tsuru/cmd/tsuru-admin"
    bin.install "tsuru-admin"
  end
end
