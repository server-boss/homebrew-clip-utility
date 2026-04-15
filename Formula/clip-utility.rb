class ClipUtility < Formula
  desc "Composable clipboard transformer for macOS — CLI, TUI, and Shortcuts"
  homepage "https://github.com/server-boss/clip-utility"
  url "https://github.com/server-boss/clip-utility/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "20b0f7f118891f24b47083e97b970bc74f7b9b33ccf5a5c82daff12c855a517d"
  license "MIT"

  depends_on :macos
  depends_on "fzf" => :recommended
  depends_on "pandoc" => :recommended

  def install
    bin.install "bin/clip"
    bin.install "bin/clip-tui"
    bin.install "bin/clip-menu"
  end

  def caveats
    <<~EOS
      To set up an Apple Shortcut for clip-menu:

      1. Open Shortcuts.app → create a new shortcut
      2. Add the "Run Shell Script" action
      3. Set the command to: #{opt_bin}/clip-menu
      4. Configure the action:
         - Shell: /bin/bash
         - Input: Clipboard
         - Pass Input: to stdin
      5. Click the (i) icon → "Add Keyboard Shortcut" (e.g. ⌥⇧C)
      6. Ensure shell/clipboard access is enabled:
         System Settings → Privacy & Security → Automation → Shortcuts
    EOS
  end

  test do
    assert_match "clip", shell_output("#{bin}/clip --help")
  end
end
