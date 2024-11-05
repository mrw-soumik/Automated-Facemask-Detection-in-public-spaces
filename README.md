
# Industrial Machine Vision - Automated Facemask Detection

## Project Overview
This project aims to develop an automated system to detect face masks in public spaces, enhancing public health safety in response to the COVID-19 pandemic. The detection system leverages traditional image processing techniques without relying on machine learning, making it suitable for resource-constrained environments.

## Table of Contents
- [Objective](#objective)
- [Technologies Used](#technologies-used)
- [Project Structure](#project-structure)
- [Installation and Setup](#installation-and-setup)
- [Usage](#usage)
- [Results](#results)
- [Future Work](#future-work)
- [Contributors](#contributors)

## Objective
The primary goal of this project is to implement an efficient face-mask detection system that does not require advanced machine learning techniques. This project utilizes traditional image processing methods to reduce computational demands and facilitate deployment on low-resource devices.

## Technologies Used
- **MATLAB**: Used for the implementation of the detection algorithms and image processing tasks.
- **Image Processing Techniques**:
  - Grayscale Conversion
  - Gaussian Smoothing
  - Histogram Equalization
  - Canny Edge Detection
  - HSV Color Segmentation
- **Viola-Jones Algorithm**: For efficient face detection, focusing on detecting relevant regions in each image.

## Project Structure
The project is organized as follows:
```
Industrial_Machine_Vision_Facemask_Detection_Project/
├── code/
│   └── FacemaskDetection.m          # Main MATLAB script for face-mask detection
├── docs/
│   └── markdown_files/
│       ├── Automated_Facemask_Detection_Project.md   # Project details in Markdown format
│       └── Project_Summary.md                        # One-liner project summary
└── README.md                 # Project README file
```

## Installation and Setup
1. Ensure MATLAB is installed on your system.
2. Clone the repository:
   ```bash
   git clone https://github.com/your-username/Industrial_Machine_Vision_Facemask_Detection_Project.git
   ```
3. Open the `FacemaskDetection.m` file in MATLAB and execute it to run the face-mask detection algorithm.

## Usage
The `FacemaskDetection.m` script processes a dataset of images to detect the presence of face masks. It applies a sequence of image processing steps to identify face regions and determine mask status:
1. Convert images to grayscale.
2. Apply Gaussian smoothing to reduce noise.
3. Enhance contrast using histogram equalization.
4. Detect edges with the Canny edge detector.
5. Use the Viola-Jones algorithm to detect faces.
6. Apply HSV color segmentation to identify mask-like regions.
7. Detect and classify contours to determine mask presence.

### Sample Dataset
The project uses a sample dataset with images containing both masked and unmasked faces, available on Kaggle or other public image datasets. You may need to download and specify your image path in the script.

## Results
The detection system achieved an accuracy of **50.66%** on a dataset of 200 images, equally split between masked and unmasked faces. Although effective, the system's sensitivity to lighting conditions and angles highlights the limitations of traditional image processing for this task, suggesting a need for machine learning methods for enhanced performance.

## Future Work
To improve the model's accuracy and robustness, the following enhancements could be considered:
- Integrating deep learning models such as Convolutional Neural Networks (CNNs) for feature extraction and classification.
- Increasing dataset diversity to improve model generalization across varying conditions.
- Developing a mobile or web-based application for real-time deployment.

## Contributors
- **Mostafa Rafiur Wasib**
- **Sanjana Khan Shammi**

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
