# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Tsuru < Formula
  desc "tsuru-client is a tsuru command line tool for application developers."
  homepage "https://docs.tsuru.io/stable/"
  version "1.21.0"

  on_macos do
    on_intel do
      url "https://github.com/tsuru/tsuru-client/releases/download/1.21.0/tsuru_1.21.0_macOS_amd64.tar.gz"
      sha256 "6483cbbea8e2f4190509572592fe33458c5db5789829ce4ee39c85a6567dbbea"

      def install
        bin.install "tsuru"
        bash_completion.install "misc/bash-completion" => "tsuru"
        zsh_completion.install "misc/zsh-completion" => "tsuru"
      end
    end
    on_arm do
      url "https://github.com/tsuru/tsuru-client/releases/download/1.21.0/tsuru_1.21.0_macOS_arm64.tar.gz"
      sha256 "ec2295b46aacf0b347b99eb625df64365cb04b32088bc149da3ad36a3919e9ae"

      def install
        bin.install "tsuru"
        bash_completion.install "misc/bash-completion" => "tsuru"
        zsh_completion.install "misc/zsh-completion" => "tsuru"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/tsuru/tsuru-client/releases/download/1.21.0/tsuru_1.21.0_linux_amd64.tar.gz"
        sha256 "84c77cf6259cd2e38e612615a43f68d1b4bf78fafeef675f57f2dd28cf5c3c15"

        def install
          bin.install "tsuru"
          bash_completion.install "misc/bash-completion" => "tsuru"
          zsh_completion.install "misc/zsh-completion" => "tsuru"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/tsuru/tsuru-client/releases/download/1.21.0/tsuru_1.21.0_linux_arm64.tar.gz"
        sha256 "93d9991a680c7fb24e4b9556530d3622d7adfe3cf864c82a5d63e7b5d2df84a2"

        def install
          bin.install "tsuru"
          bash_completion.install "misc/bash-completion" => "tsuru"
          zsh_completion.install "misc/zsh-completion" => "tsuru"
        end
      end
    end
  end
end
