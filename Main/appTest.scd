// TO PREPARE, CHECK YOUR CURRENT config in Preferences->Interpreter:
// you should be using the internal SCClassLibrary and HelpSource,
// not an external git repository!
// To test exporting extensions, it is best to have some quarks
// or other extensions installed, as seen in the includePaths.

// 0 - define name and location of new app + helper functions
(
// define the name for the new app and its location:
~newAppName = "pThreeTestBuild";
~newAppLocation = "~/Desktop".standardizePath;

// --- nothing to be changed below this line --- \\
// some helper functions
~readText = { |path| File.readAllString(path); };
~writeText = { |path, string| File(path, "w").write(string).close; };
~copyFolder = { |orig, dest|
    var str = "cp -ir" + quote(orig) + quote(dest);
    str.postcs;
    unixCmd(str);
};

// make some needed paths and folders
~pathToThisApp = Platform.resourceDir.dirname.dirname;
~thisAppName = ~pathToThisApp.basename.splitext.first;
~pathToNewApp = ~newAppLocation +/+ ~newAppName ++ ".app";
~newAppResDir = ~pathToNewApp +/+ "Contents/Resources";
~newAppSupportDir = Platform.userConfigDir.dirname +/+ ~newAppName;
);


(
// 1. make a copy of thisApp with the newAppName:
// can take a while on slow harddisks.
// wait for RESULT = 0 to show!

if (File.exists(~pathToNewApp).not) {
    ~copyFolder.(~pathToThisApp, ~pathToNewApp);
    File.mkdir(~newAppSupportDir);
} { warn("supportDir % already exists.".format(~pathToNewApp)) };
);

(
// 2. fixups in the new app:
// a. fix the Info.plist file by replacing the name:
~infoPlistPath = ~pathToNewApp +/+ "Contents/Info.plist";
// get its string, replace the SC names, write again
~infoString = ~readText.(~infoPlistPath);
~executableIndex = ~infoString.find("<key>CFBundleExecutable</key>");
~nameToReplace = ~infoString.copyRange(
    ~infoString.find("<string>", offset: ~executableIndex) + 8,
    ~infoString.find("</string>", offset: ~executableIndex) - 1
);

"replacing bundleName % in plist file at these locations: "
.postf(~nameToReplace.cs);
~foundNameLocs = ~infoString.findAll(~nameToReplace).postln;

~newInfoString = ~infoString.replace(~nameToReplace, ~newAppName );
~writeText.(~infoPlistPath, ~newInfoString);
// ~readText.(~infoPlistPath);

// b. rename the binary file:
"renaming macos binary to: ".post;
// fixups in the new app - 2. rename the binary inside the app folder
unixCmd("mv -i"
    + quote(~pathToNewApp +/+ "Contents/MacOS/" +/+ ~nameToReplace)
    + quote(~pathToNewApp +/+ "Contents/MacOS/" ++ ~newAppName).postln
);
);


// 3. *** time for the first wakeup kiss *** //
unixCmd("open" + ~pathToNewApp);

// ... and independence test:
// IN THE NEW APP, run this code:
Platform.userAppSupportDir.postcs;