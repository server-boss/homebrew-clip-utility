class ClipUtility < Formula
  desc "Composable clipboard transformer for macOS — CLI, TUI, and Shortcuts"
  homepage "https://github.com/server-boss/clip-utility"
  url "https://github.com/server-boss/clip-utility/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "dc92d85da980bc11a45add0f954ec1447079623e9febdef0fbef85abf129fb41"
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
