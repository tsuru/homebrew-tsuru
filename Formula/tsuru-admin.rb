require 'formula'

class TsuruAdmin < Formula
  url 'https://s3.amazonaws.com/tsuru/tsuru-admin-1.0.0.tar.gz'
  homepage 'https://tsuru.io'
  sha256 'b0b15305aa73eb39080470230876e99da850381c87880acdc3f31e490a4eae3b'

  depends_on 'go'

  def install
    system "bash", "-c", "GOPATH=\"$PWD\" go build -o tsuru-admin github.com/tsuru/tsuru-admin"
    bin.install "tsuru-admin"
    bash_completion.install "src/github.com/tsuru/tsuru-admin/misc/bash-completion" => "tsuru-admin"
    zsh_completion.install "src/github.com/tsuru/tsuru-admin/misc/zsh-completion" => "tsuru-admin"
  end
end
