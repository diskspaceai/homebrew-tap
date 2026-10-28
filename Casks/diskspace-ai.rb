cask "diskspace-ai" do
  version "1.0.17"
  sha256 "e0a3b68c6ab2b33eb325491665d090856b5ba7bf73d245995fcdb3ed9ef767aa"

  url "https://diskspaceai.com/actualizaciones/DiskSpaceAI-#{version}.zip"
  name "DiskSpace AI"
  desc "Disk cleaner that explains each folder and what is safe to delete"
  homepage "https://diskspaceai.com/"

  livecheck do
    url "https://diskspaceai.com/actualizaciones/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sequoia

  app "DiskSpace AI.app"
  binary "#{appdir}/DiskSpace AI.app/Contents/MacOS/diskspace"

  uninstall quit: "com.diskspaceai.app"

  zap trash: [
    "~/Library/Application Support/DiskSpaceAI",
    "~/Library/Caches/com.diskspaceai.app",
    "~/Library/Caches/com.diskspaceai.app.sparkle",
    "~/Library/HTTPStorages/com.diskspaceai.app",
    "~/Library/Preferences/com.diskspaceai.app.plist",
    "~/Library/Saved Application State/com.diskspaceai.app.savedState",
  ]
end
