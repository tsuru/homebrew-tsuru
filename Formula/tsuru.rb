require 'formula'

class Tsuru < Formula
  url 'https://s3.amazonaws.com/tsuru/dist-src/tsuru-0.7.16.tar.gz'
  homepage 'http://tsuru.io'
  sha256 '36846581b2316115dc992c540baab40c4d29eb8bbc4f2215dc57c685b7231216'

  depends_on 'go'

  def install
    system "bash", "-c", "GOPATH=\"$PWD\" go build -o tsuru github.com/globocom/tsuru/cmd/tsuru"
    bin.install "tsuru"
    bash_completion.install "src/github.com/globocom/tsuru/misc/bash-completion.d/tsuru"
  end
end
