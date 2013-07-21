function [IMG] = createImageMatrix

IMG = zeros(6,6,'uint8');
% row 1
IMG (1,1) = 0;
IMG (1,2) = 3;
IMG (1,3) = 5;
IMG (1,4) = 0;
IMG (1,5) = 2;
IMG (1,6) = 2;

% row 2
IMG (2,1) = 3;
IMG (2,2) = 1;
IMG (2,3) = 2;
IMG (2,4) = 1;
IMG (2,5) = 0;
IMG (2,6) = 3;

% row 3
IMG (3,1) = 1;
IMG (3,2) = 0;
IMG (3,3) = 3;
IMG (3,4) = 4;
IMG (3,5) = 2;
IMG (3,6) = 1;

% row 4
IMG (4,1) = 2;
IMG (4,2) = 5;
IMG (4,3) = 3;
IMG (4,4) = 2;
IMG (4,5) = 0;
IMG (4,6) = 3;

% row 5
IMG (5,1) = 5;
IMG (5,2) = 0;
IMG (5,3) = 4;
IMG (5,4) = 3;
IMG (5,5) = 1;
IMG (5,6) = 0;

% row 6
IMG (6,1) = 1;
IMG (6,2) = 5;
IMG (6,3) = 2;
IMG (6,4) = 4;
IMG (6,5) = 1;
IMG (6,6) = 5;

IMG;

