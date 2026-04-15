class ClipUtility < Formula
  desc "Composable clipboard transformer for macOS — CLI, TUI, and Shortcuts"
  homepage "https://github.com/server-boss/clip-utility"
  url "https://github.com/server-boss/clip-utility/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "596050ff6b4a1e549dcb886772696e65fa7ab7f8bbcc07da10596bcda7e1b0d4"
  license "MIT"

  depends_on :macos
  depends_on "fzf" => :recommended
  depends_on "pandoc" => :recommended

  def install
    bin.install "bin/clip"
    bin.install "bin/clip-tui"
    bin.install "bin/clip-menu"
  end

  test do
    assert_match "clip", shell_output("#{bin}/clip --help")
  end
end
