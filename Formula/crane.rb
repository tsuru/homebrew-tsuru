require 'formula'

class Crane < Formula
  url 'https://s3.amazonaws.com/tsuru/dist-src/crane-0.4.tar.gz'
  homepage 'http://tsuru.io'
  sha256 '91b6c8a7a1b203eb2bba54bb6819cb7610ed96d67997b8bef5513ce112814218'

  depends_on 'go'
  depends_on 'bzr'

  def install
    system "bash", "-c", "GOPATH=\"\" go get -d ./cmd/crane"
    system "bash", "-c", "GOPATH=\"\" go build -o crane ./cmd/crane"
    bin.install "crane"
    bash_completion.install "misc/bash-completion.d/crane"
  end
end
