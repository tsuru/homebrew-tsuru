require 'formula'

class Crane < Formula
  url 'https://s3.amazonaws.com/tsuru/dist-src/crane-0.4.6.tar.gz'
  homepage 'http://tsuru.io'
  sha256 '38361fe0624bde732bcb7fede36c375433ee79a01c7f349f78b9d07783babbe8'

  depends_on 'go'

  def install
    system "bash", "-c", "GOPATH=\"$PWD\" go build -o crane github.com/globocom/tsuru/cmd/crane"
    bin.install "crane"
    bash_completion.install "src/github.com/globocom/tsuru/misc/bash-completion.d/crane"
  end
end
