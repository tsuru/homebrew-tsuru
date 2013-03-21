require 'formula'

class Crane < Formula
  url 'https://s3.amazonaws.com/tsuru/dist-src/crane-0.3.1.tar.gz'
  homepage 'http://tsuru.io'
  sha256 '5f7e51e909bb948db19d05cf14ec3ee40c6cff0d569cc84ef3c9aacc4286e11d'

  depends_on 'go'
  depends_on 'bzr'

  def install
    system "bash", "-c", "GOPATH=\"\" go get -d ./cmd/crane"
    system "bash", "-c", "GOPATH=\"\" go build -o crane ./cmd/crane"
    bin.install "crane"
    bash_completion.install "misc/bash-completion.d/crane"
  end
end
