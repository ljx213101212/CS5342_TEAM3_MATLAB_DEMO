function image_process = demo(a)

close all;

%% INTPUT
inputfolder = '/Users/jixiang/Documents/ISS/SEProject/team_git/webapp/resource/';
imagename = a;
inputpath = strcat(inputfolder,imagename);
disp(inputpath);

%% OUTPUT
myfolder= '/Users/jixiang/Documents/ISS/SEProject/team_git/webapp/';
%resfolder1 = 'intrinsic_result/';
resfolder2 = 'result/';
%outputPath1 = strcat(myfolder,resfolder1);
outputPath2 = strcat(myfolder,resfolder2);

%% Intrinsic Image Decomposition
% disp('Intrinsic Images Example');
% I1 = im2double(imread(inputpath)); 
% [R S] = Intrinsic_Relsmo(I1, 2);
% figure(1),
% subplot 131, imshow(I1), title('input');
% subplot 132, imshow(R); title('reflectace');
% subplot 133, imshow(S); title('shading');

% imwrite(I1, fullfile(outputPath1,'input.jpg'));
% imwrite(R, fullfile(outputPath1,'reflectace.jpg'));
% imwrite(S, fullfile(outputPath1,'shading.jpg'));



%% Reflection Separation Using Focus 
disp('Reflection Removal Example');
I2 = im2double(imread(inputpath)); 
[H W D] = size(I2);
[LB LR] = septRelSmo(I2, 50, zeros(H,W,D), I2);
% figure(2),
% subplot 131, imshow(I2) , title('input');
% subplot 132, imshow(LB*2), title('background'); 
% subplot 133, imshow(LR*2), title('reflection');

imwrite(I2, fullfile(outputPath2,'input.jpg'));
imwrite(LB*2, fullfile(outputPath2,'reflectace.jpg'));
imwrite(LR*2, fullfile(outputPath2,'shading.jpg'));


end
