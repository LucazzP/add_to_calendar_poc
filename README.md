
# To add this to your project, you need to add the following permissions

AndroidManifest.xml

```XML
<uses-permission android:name="android.permission.WRITE_CALENDAR" />
<uses-permission android:name="android.permission.READ_CALENDAR" />
```

Info.plist

```plist
<key>NSCalendarsUsageDescription</key>
<string>INSERT_REASON_HERE</string>
<key>NSContactsUsageDescription</key>
<string>INSERT_REASON_HERE</string>
```
