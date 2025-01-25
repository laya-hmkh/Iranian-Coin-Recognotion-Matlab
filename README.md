# Iranian-Coin-Recognotion using Matlab

This MATLAB script implements a rule-based algorithm to identify and calculate the total value of Iranian coins present in an image.

## Overview

This project uses image processing techniques to:

1.  **Preprocess an input image:** This includes converting it to binary, filling holes, and removing noise.
2.  **Identify coin objects:** By detecting the regions that appear as coins in the image.
3.  **Classify coins by size:** The size (area in pixels) of each identified coin is used to classify it into specific Iranian coin denominations based on predefined area ranges.
4.  **Calculate the total value:** The corresponding value of each identified coin is added to a running total, which is then displayed.

This is a rule-based system, meaning that the detection and classification logic relies on predefined area ranges, rather than a trained machine learning model.

## How It Works

The algorithm works as follows:

1.  **Image Loading:**
    *   The script reads an input image (e.g., `1_4.png`).

2.  **Preprocessing:**
    *   **Binary Conversion:** The image is converted to a binary image using a threshold value.
    *   **Hole Filling:** Any enclosed holes within the coin regions are filled.
    *   **Noise Removal:** Small, spurious regions in the binary image are removed using `bwareaopen`.

3.  **Object Analysis:**
    *   The `regionprops` function extracts object properties such as centroid (center of the object), major axis length, minor axis length, and area (number of pixels) from each identified region.
    *   The average diameters and radii of the objects are calculated from the axis lengths.

4.  **Coin Classification and Value Calculation:**
    *   The area of each object is compared against predefined ranges.
    *   Based on these ranges, each object is assigned a value corresponding to a specific Iranian coin denomination:
       *   Areas between 15000 and 19000 pixels are identified as 1000 Rial coins.
       *   Areas between 19000 and 24000 pixels are identified as 2000 Rial coins.
       *   Areas between 24000 and 30000 pixels are identified as 5000 Rial coins.
    *   The total value of the identified coins is calculated by summing the values of each detected coin.

5.  **Visualization and Output:**
    *   The original image and the image with detected coins (circles) are displayed.
    *   The detected coins are labeled with their corresponding value.
    *   The final calculated total value is displayed below the processed image.

## Files

*   `main.m`: (Replace `main.m` with the actual name of your MATLAB script file) This is the main MATLAB script file that implements the coin recognition algorithm.
*   `1_4.png` : An example input image of coins.

## Usage

1.  Ensure you have MATLAB installed on your system.
2.  Place the MATLAB script file and the image(s) you want to process in the same directory.
3.  Run the MATLAB script from the MATLAB command window or by pressing the "Run" button in the editor.

## Dependencies

*   MATLAB Image Processing Toolbox (for functions like `imread`, `im2bw`, `imfill`, `bwareaopen`, `regionprops`, `viscircles`)

## Future Improvements

*   Incorporate more sophisticated image processing techniques (e.g., adaptive thresholding) to handle variations in image quality.
*   Train a Machine Learning model to identify coin denominations rather than relying on the area based detection.
*   Add handling for more coin denominations.
*   Explore methods for handling partially occluded or overlapping coins.
*   Add robustness to different lighting conditions.
*   Expand it for more coin types maybe from other countries
