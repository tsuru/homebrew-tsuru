require 'formula'

class Tsuru < Formula
  url 'https://s3.amazonaws.com/tsuru/dist-src/tsuru-0.7.tar.gz'
  homepage 'http://tsuru.io'
  sha256 '91b6c8a7a1b203eb2bba54bb6819cb7610ed96d67997b8bef5513ce112814218'

  depends_on 'go'
  depends_on 'bzr'

  def install
    system "bash", "-c", "GOPATH=\"\" go get -d ./cmd/tsuru"
    system "bash", "-c", "GOPATH=\"\" go build -o tsuru ./cmd/tsuru"
    bin.install "tsuru"
    bash_completion.install "misc/bash-completion.d/tsuru"
  end
end
