cask "diskspace-ai" do
  version "1.0.24"
  sha256 "ca779e491b42d4eb223243b7aedf215a963876be6bdcd91c37d9de88427ffacd"

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
