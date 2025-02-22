# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Tsuru < Formula
  desc "tsuru-client is a tsuru command line tool for application developers."
  homepage "https://docs.tsuru.io/stable/"
  version "1.25.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/tsuru/tsuru-client/releases/download/1.25.0/tsuru_1.25.0_macOS_amd64.tar.gz"
      sha256 "f24c9141f07cf3cc7a54dfbe72ba2fbe2da2bf6b3b493636765fb66602112c8f"

      def install
        bin.install "tsuru"
        bash_completion.install "misc/bash-completion" => "tsuru"
        zsh_completion.install "misc/zsh-completion" => "tsuru"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/tsuru/tsuru-client/releases/download/1.25.0/tsuru_1.25.0_macOS_arm64.tar.gz"
      sha256 "11ece472cf6c8e7dd6e25011847913a0a021dc1416fcc2b3bc13f45b2bcf0967"

      def install
        bin.install "tsuru"
        bash_completion.install "misc/bash-completion" => "tsuru"
        zsh_completion.install "misc/zsh-completion" => "tsuru"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/tsuru/tsuru-client/releases/download/1.25.0/tsuru_1.25.0_linux_amd64.tar.gz"
        sha256 "5a0922423880e9d955c5f7a2f023135cbada5fab25627f03c1728346206f15d2"

        def install
          bin.install "tsuru"
          bash_completion.install "misc/bash-completion" => "tsuru"
          zsh_completion.install "misc/zsh-completion" => "tsuru"
        end
      end
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/tsuru/tsuru-client/releases/download/1.25.0/tsuru_1.25.0_linux_arm64.tar.gz"
        sha256 "39b4eb34e859cdd011314512ee21bf647c05abcc82915187ae54bee86b05a2ea"

        def install
          bin.install "tsuru"
          bash_completion.install "misc/bash-completion" => "tsuru"
          zsh_completion.install "misc/zsh-completion" => "tsuru"
        end
      end
    end
  end
end
