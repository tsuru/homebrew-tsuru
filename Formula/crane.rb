require 'formula'

class Crane < Formula
  url 'https://s3.amazonaws.com/tsuru/dist-src/crane-0.4.5.tar.gz'
  homepage 'http://tsuru.io'
  sha256 'e6a9a4472a5b06c50ae77fee800b77e1d6623e9e12a3a15604620db072a97005'

  depends_on 'go'

  def install
    system "bash", "-c", "GOPATH=\"$PWD\" go build -o crane github.com/globocom/tsuru/cmd/crane"
    bin.install "crane"
    bash_completion.install "src/github.com/globocom/tsuru/misc/bash-completion.d/crane"
  end
end
