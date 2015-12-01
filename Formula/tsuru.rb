require 'formula'

class Tsuru < Formula
  url "https://s3.amazonaws.com/tsuru/dist-src/tsuru-0.17.1.tar.gz"
  homepage "https://tsuru.io"
  sha256 "3aa64812c23267967f91087e412ae4952cc682d2b9783c2077517122bc36f70d"

  depends_on 'go'

  devel do
    url "https://s3.amazonaws.com/tsuru/dist-src/tsuru-0.18.0.tar.gz"
    sha256 "e69c92fa046f216b33051e60ae2ba018d70e8639f80ac7dd08aed9f3f9e41f74"
  end

  def install
    system "bash", "-c", "test $( go version|awk '{print \$3}' | sed 's/^[^0-9]*\\([0-9]\\)[^0-9]*\\([0-9]\\).*/\\1\\2/') -lt 14 && echo ERROR: tsuru requires Go 1.4 or later, your version is: $(go version) && exit 1 || echo proceeding ..."
    system "bash", "-c", "GOPATH=\"$PWD\" go build -o tsuru github.com/tsuru/tsuru-client/tsuru"
    ENV['TSURU_PATH'] = "./tsuru"
    system "python", "src/github.com/tsuru/tsuru-client/docs/source/exts/man_pages.py"
    bin.install "tsuru"
    man8.install "src/github.com/tsuru/tsuru-client/docs/source/exts/tsuru.8"
    bash_completion.install "src/github.com/tsuru/tsuru-client/misc/bash-completion" => "tsuru"
    zsh_completion.install "src/github.com/tsuru/tsuru-client/misc/zsh-completion" => "tsuru"
  end
end
