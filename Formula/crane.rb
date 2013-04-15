require 'formula'

class Crane < Formula
  url 'https://s3.amazonaws.com/tsuru/dist-src/crane-0.4.2.tar.gz'
  homepage 'http://tsuru.io'
  sha256 'f5dbb78b1ed50adf6d089b207f0078cb58ef08c7ceb164f902239f8e44441798'

  depends_on 'go'

  def install
    system "bash", "-c", "GOPATH=\"$PWD\" go build -o crane github.com/globocom/tsuru/cmd/crane"
    bin.install "crane"
    bash_completion.install "src/github.com/globocom/tsuru/misc/bash-completion.d/crane"
  end
end
