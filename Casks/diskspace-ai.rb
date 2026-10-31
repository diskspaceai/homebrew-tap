cask "diskspace-ai" do
  version "1.0.23"
  sha256 "27f2da6f9d12bfe192bd69fe7eadb42e541ce290896bc739294cb287cc399a04"

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
