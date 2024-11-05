% Step 1: Image Acquisition
image = imread('Picture.jpeg'); % Use the provided sample image
imshow(image);
title('Original Image');


% Step 2: Conversion to Grayscale
grayImage = rgb2gray(image);
figure;
imshow(grayImage);
title('Grayscale Image');



% Step 3: Image Smoothing
smoothedImage = imgaussfilt(grayImage, 2); % Gaussian blur with sigma = 2
figure;
imshow(smoothedImage);
title('Smoothed Image');



% Step 4: Histogram Equalization
equalizedImage = histeq(smoothedImage);
figure;
imshow(equalizedImage);
title('Histogram Equalized Image');



% Step 5: Edge Detection
edges = edge(equalizedImage, 'Canny'); % Canny edge detection
figure;
imshow(edges);
title('Edge Detected Image');



% Step 6: Morphological Operations
se = strel('disk', 1); % Structuring element
morphedImage = imclose(edges, se); % Morphological closing
figure;
imshow(morphedImage);
title('Morphologically Processed Image');



% Step 7: Region of Interest (ROI) Selection
faceDetector = vision.CascadeObjectDetector();
bboxes = step(faceDetector, image);
figure;
imshow(image);
hold on;
for i = 1:size(bboxes, 1)
    rectangle('Position', bboxes(i, :), 'EdgeColor', 'r', 'LineWidth', 2);
end
title('Detected Faces');



% Step 8: Color Segmentation to Detect Mask
% Convert image to HSV color space
hsvImage = rgb2hsv(image);

% Define mask color range (light blue typical for surgical masks)
maskColorMin = [0.5, 0.2, 0.2]; % Adjust these values as needed
maskColorMax = [0.7, 1, 1]; % Adjust these values as needed

% Create a binary mask
mask = (hsvImage(:,:,1) >= maskColorMin(1) & hsvImage(:,:,1) <= maskColorMax(1)) & ...
       (hsvImage(:,:,2) >= maskColorMin(2) & hsvImage(:,:,2) <= maskColorMax(2)) & ...
       (hsvImage(:,:,3) >= maskColorMin(3) & hsvImage(:,:,3) <= maskColorMax(3));

% Step 9: Contour Detection
maskContours = bwboundaries(mask, 'noholes');

% Step 10: Feature Extraction and Classification Using Image Processing Techniques
for i = 1:size(bboxes, 1)
    faceROI = imcrop(mask, bboxes(i, :));
    
    % Detect contours in the face ROI
    faceContours = bwboundaries(faceROI, 'noholes');
    
    % Classify based on the presence of mask contours
    if ~isempty(faceContours)
        label = 'Mask Detected';
    else
        label = 'No Mask Detected';
    end
    
    % Display the classification result
    position = [bboxes(i, 1), bboxes(i, 2) - 10];
    annotation = [label, ' (Face ', num2str(i), ')'];
    text(position(1), position(2), annotation, 'Color', 'yellow', 'FontSize', 12);
end

hold off;
title('Facemask Detection Result');
