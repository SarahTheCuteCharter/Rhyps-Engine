# NKL-4ever Engine — Chart System

## 1. Overview

The NKL-4ever Chart System is an advanced chart architecture designed to improve chart organization, loading, note processing, compatibility, and performance. The system aims to preserve the original JS Engine functionality while introducing new chart management features.

## 2. Main Objectives

* Improve chart data organization.
* Introduce chart validation.
* Improve legacy chart compatibility.
* Support 4-lane and 8-lane gameplay.
* Improve custom note type management.
* Optimize large chart processing.
* Improve Chart Editor functionality.
* Preserve original JSON compatibility.

## 3. Original Engine Integration

The implementation will preserve and extend the original JS Engine systems.

Important files:

* Song.hx
* Section.hx
* Note.hx
* PlayState.hx
* Conductor.hx
* StrumNote.hx
* editors/ChartingState.hx
* backend/NoteTypesConfig.hx

Existing structures such as "SwagSong", "SwagSection", and "PreloadedChartNote" must be inspected before introducing replacements or modifications.

## 4. Chart Data

The chart architecture is planned to support:

* Song identification.
* BPM information.
* Difficulty information.
* Section organization.
* Note data.
* Events.
* Custom metadata.

The original chart JSON format must remain compatible.

## 5. Chart Loading and Validation

The loading system will introduce:

* JSON validation.
* Section validation.
* Invalid note detection.
* Missing data handling.
* Legacy chart compatibility.
* Psych Engine 1.0 compatibility.
* Event preservation.

"Song.loadFromJson()" will remain the original loading entry point unless integration testing demonstrates that a compatible extension is necessary.

## 6. Advanced Note System

Planned features:

* 4-lane support. (default note-lane)
* 8-lane support.
* Custom note types.
* Sustain management.
* Note processing.
* Note position organization.

## 7. Large Chart Support

The system aims to improve performance when processing large charts through:

* Time-based note organization.
* Note indexing.
* Chunk-based processing.
* Reduced unnecessary allocations.
* On-demand loading where applicable.
* Active note management.
* Chart statistics.

No arbitrary maximum note count will be established.

## 8. Chart Editor

The original Chart Editor will be preserved and improved.

Planned improvements:

* Multiple note selection.
* Undo/Redo improvements.
* Custom note editing.
* Large chart optimization.
* Grid improvements.
* Editing history organization.

Existing editor functionality must remain operational.

## 9. Compatibility

The implementation must preserve:

* Original chart JSON compatibility.
* Legacy charts.
* Original note types.
* Events. 
* Sustain behavior.
* Existing gameplay synchronization.

## The Last, 10. Testing

The following tests are planned:

* Legacy chart loading.
* New chart loading.
* JSON validation.
* 4-lane gameplay.
* 8-lane gameplay.
* Sustain functionality.
* Event preservation.
* Custom note types.
* Chart Editor saving and loading.
* Musical synchronization.
* Large chart performance.
* Memory usage.

## Development Status

Current Version: v0.4.0-alpha1

Status: In Development

This documentation describes planned architecture and features. A feature must not be considered implemented until its code is integrated and tested.

## Future Development

Further details will be documented after that integration.
