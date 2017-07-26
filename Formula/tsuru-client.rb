class TsuruClient < Formula
  desc ""
  homepage ""
  url "https://github.com/tsuru/tsuru-client/releases/download/1.3.0/tsuru-client_1.3.0_macOS_amd64.tar.gz"
  version "1.3.0"
  sha256 "26c8957dfa0b121ae7e8ec284483e81f8fa612cfe0f30aad5983c776cd820717"

  def install
    bin.install "tsuru"
    bash_completion.install "misc/bash-completion" => "tsuru"
    zsh_completion.install "misc/zsh-completion" => "tsuru"
  end

  test do
    
  end
end
