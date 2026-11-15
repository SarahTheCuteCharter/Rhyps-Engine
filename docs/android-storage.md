# Android Storage System

NKL-4ever Engine plans to introduce an improved file management system for Android devices. The goal is to make engine files easier to access, organize and manage without relying entirely on Android's restricted application directories.

## Sarah Charter Engine Directory

The planned default directory is:

"SarahCharterEngine/"

This directory is intended to contain user-accessible engine files.

## Directory Structure

* SarahCharterEngine/
* │
* ├── renders/
* ├── mods/
* ├── charts/
* ├── characters/
* ├── stages/
* ├── shaders/
* ├── songs/
* ├── screenshots-render/
* └── settings/

## Main Features

* Accessible storage for user files.
* Organized mod and chart directories.
* Render and screenshot management.
* Easier file transfers.
* Improved file organization.
* Android storage compatibility.

## Android Compatibility

The storage system is being designed with modern Android storage restrictions in mind, including Android 13 and newer versions. The implementation may use Android's Storage Access Framework (SAF) to request access to user-selected directories.

## User Accessibility

Users should be able to locate, manage and transfer their engine files using compatible file managers.

## Development Status

The Android Storage System is planned and under development. Directory access, permissions and compatibility depend on the final implementation.
