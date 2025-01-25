clear all;
clc;
close all;

% Read image from file
photo_path = '1_4.png';
img = imread(photo_path);

% Convert image to binary
binary_img = im2bw(img, 0.4); % Threshold at 40% intensity

% Fill holes in the binary image
filled_img = imfill(binary_img,'holes');

% Remove noise by removing small areas
noise_removed = bwareaopen(filled_img, 10);

% Get region properties
stats = regionprops("table", noise_removed,"Centroid", ...
   "MajorAxisLength","MinorAxisLength", 'Area');

% Extract centers and radii
centers = stats.Centroid;
diameters = mean([stats.MajorAxisLength stats.MinorAxisLength],2);
radii = diameters/2;

% Initialize sum of values
total_sum = 0;

% Create figure and display images
figure;
subplot(1, 2, 1);
imshow(img);
title('Original Image');

subplot(1, 2, 2);
imshow(noise_removed);
title('Image with Circles and Labels');

% Add circles to the plot
viscircles(centers, radii, 'EdgeColor', 'red');

% Add labels based on area ranges and calculate the sum
for i = 1:size(centers, 1)
   switch true
       case (15000 < stats.Area(i) && stats.Area(i) < 19000)
           text(centers(i, 1), centers(i, 2), '1000', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'center', 'Color', 'red');
           total_sum = total_sum + 1000;
       case (19000 <= stats.Area(i) && stats.Area(i) < 24000)
           text(centers(i, 1), centers(i, 2), '2000', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'center', 'Color', 'red');
           total_sum = total_sum + 2000;
       case (24000 <= stats.Area(i) && stats.Area(i) < 30000)
           text(centers(i, 1), centers(i, 2), '5000', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'center', 'Color', 'red');
           total_sum = total_sum + 5000;
   end
end

% Display the sum below the noise_removed image
text(size(noise_removed, 2)/2, size(noise_removed, 1) + 20, ['Total Sum: ', num2str(total_sum)], ...
     'HorizontalAlignment', 'center', 'FontSize', 12, 'Color', 'blue');
