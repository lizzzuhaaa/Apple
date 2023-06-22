# For your convenience 
alias PlistBuddy=/usr/libexec/PlistBuddy
WORKSPACE=Networking.xcworkspace
SCHEME=CatAppSydorova
CONFIG=Release
DEST="generic/platform=iOS"
VERSION="v1.0.0"
ARCHIVE_PATH="./ARCHIVES/${VERSION}.xcarchive"
EXPORT_PATH="./Exported"
EXPORT_OPTIONS_PLIST="./exportOptionsTemplate.plist"
XCODE_INFO_PLIST="CatAppSydorova/CatAppSydorova/Info.plist"

# IMPLEMENT: 
# Read script input parameter and add it to your Info.plist. Values can either be CATS or DOGS

if [ "$1" == "CATS" ]; then
    PlistBuddy -c "Set :Input CATS" $XCODE_INFO_PLIST
    EXPORT_PATH="./Exported_CATS"
elif [ "$1" == "DOGS" ]; then
    PlistBuddy -c "Set :Input DOGS" $XCODE_INFO_PLIST
    EXPORT_PATH="./Exported_DOGS"
else
    echo "Trash..."
    exit 1
    
fi
    

    
# IMPLEMENT:
# Clean build folder
xcodebuild clean -workspace "${WORKSPACE}" -scheme "${SCHEME}" -configuration "${CONFIG}"

# IMPLEMENT:
# Create archive
xcodebuild archive \
-archivePath "${ARCHIVE_PATH}" \
-workspace "${WORKSPACE}" \
-scheme "${SCHEME}" \
-configuration "${CONFIG}" \
-destination "${DEST}"
# IMPLEMENT:
# Export archive
xcodebuild -exportArchive \
-archivePath "${ARCHIVE_PATH}" \
-exportPath "${EXPORT_PATH}" \
-exportOptionsPlist "${EXPORT_OPTIONS_PLIST}"




echo "Hello World"
