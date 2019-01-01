# Overview

Helpful collection of shell scripts to keep different Macs development environments in sync.

## getXcodeConfig.command

Collects Mac settings by putting setting files into specific folders. Collects Xcode font and color Themes, custom keyboard layouts, Xcode templates, Xcode snippets and Xcode hotkeys.

## setupMac.command

Overrides existing Mac setting files with ones that were saved by `getXcodeConfig.command`.

## updateProject.command

Copies Carthage and Cocoapods scripts into `Scripts/` folder. 

## Finder: YOUR_PROJECT/Scripts/Carthage/carthageSetup.command

Execute `updateProject.command` first. Creates `_Carthage` folder inside `Frameworks` folder with `carthageAdd.command`, `carthageRemove.command` and `carthageUpdate.command` to easily manage Carthage dependencies by just right clicking on a command a select `Open with External Editor`.

Creates `Carthage Install` build phase to keep Carthage dependenciec in sync on each build if it wasn't created yet.

Creates `Carthage Copy` build phase to copy Carthage frameworks if it wasn't created yet. **If your target have this phase with other name - delete your one.**

Sets framework search path for Carthage frameworks if it wasn't set yet.

## Xcode: YOUR_PROJECT/Frameworks/_Carthage/carthageAdd.command

Execute `updateProject.command` first and `carthageSetup.command` after. Just right click on a command a select `Open with External Editor` then follow instructions to add new framework.

## Xcode: YOUR_PROJECT/Frameworks/_Carthage/carthageRemove.command

Execute `updateProject.command` first and `carthageSetup.command` after. Just right click on a command a select `Open with External Editor` then follow instructions to remove existing framework.

## Xcode: YOUR_PROJECT/Frameworks/_Carthage/carthageUpdate.command

Execute `updateProject.command` first and `carthageSetup.command` after. Just right click on a command a select `Open with External Editor` then follow instructions to update existing framework.

## Finder: YOUR_PROJECT/Scripts/Cocoapods/podSetup.command

Execute `updateProject.command` first. Tries to update Podfile so after first run of `YOUR_PROJECT/Scripts/Cocoapods/podInstall.command` or `YOUR_PROJECT/Scripts/Cocoapods/podUpdate.command` those files will be attached to Pods project for easy access.

## Xcode: PODS_PROJECT/podInstall.command

Execute `updateProject.command` first and `podSetup.command` after. Add new cocoapods framework into `Podfile` then right click on a command a select `Open with External Editor` to perform pods installation.

## Xcode: PODS_PROJECT/podUpdate.command

Execute `updateProject.command` first and `podSetup.command` after. Just right click on a command a select `Open with External Editor` then follow instructions to update existing framework.
