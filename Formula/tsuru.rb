require 'formula'

class Tsuru < Formula
  url 'https://s3.amazonaws.com/tsuru/dist-src/tsuru-0.7.7.tar.gz'
  homepage 'http://tsuru.io'
  sha256 'b8f2bc9447a52544cf1f67a0cc9569cc71f92c28de5fb2b779bb3e1329ea2369'

  depends_on 'go'

  def install
    system "bash", "-c", "GOPATH=\"$PWD\" go build -o tsuru github.com/globocom/tsuru/cmd/tsuru"
    bin.install "tsuru"
    bash_completion.install "src/github.com/globocom/tsuru/misc/bash-completion.d/tsuru"
  end
end
