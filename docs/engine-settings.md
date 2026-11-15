# NKL-4ever Engine — Engine Settings

« Documentation for the engine configuration system. »

## Overview

The Engine Settings menu provides additional configuration options that allow players and developers to customize certain aspects of the NKL-4ever Engine.

These settings focus on performance, debugging, interface customization, and gameplay presentation.

## Available Settings

1. FPS Rework

- Category: Performance
- Enables the FPS Rework system, designed to improve rendering performance and provide a smoother gameplay experience.
* Purpose:
- Improve rendering behavior.
- Reduce performance inconsistencies.
- Provide a smoother experience.

2. Debug Info

- Category: Diagnostics
- Enables additional debugging information to help developers monitor engine behavior and performance.
* Purpose:
- Display performance information.
- Assist with debugging.
- Help identify potential performance issues.

3. Enable ```"watermarkEngine.txt"```

- Category: Interface
Enables the engine watermark displayed in the center of the screen.
- The watermark text is configurable through an external text file:

```.NKL-4ever/data/watermarkText.txt```

Default example:
```@aen04fm```

* Purpose:
- Display a customizable engine watermark.
- Allow users to change the displayed text.
- Keep watermark customization separate from the engine source code.

4. Disable Notes Colors

- Category: Gameplay
- Disables the traditional colored note appearance, allowing notes to use a monochromatic or grayscale visual style.
* Purpose:
- Change the visual presentation of notes.
- Provide an alternative gameplay appearance.
- Customize the chart's visual experience.

## Configuration Summary

* Setting | Category
* FPS Rework | Performance
* Debug Info | Diagnostics
* Enable ```"watermarkEngine.txt"``` | Interface
* Disable Notes Colors | Gameplay

# Notes

* - Settings may affect gameplay presentation or engine behavior.
* - Some features may depend on platform compatibility.
* - Configuration behavior may change between engine versions.
