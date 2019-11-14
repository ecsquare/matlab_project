img = imread('bird-1.gif');

[n, m] = size(img);

bound = traceit(img);
bound=bound';
[a b]=size(bound);
newimg = zeros(n,m);

for j=1:b   
newimg(bound(2,j),bound(1,j)) = 255;
pause(0.000001);
imshow(newimg);
end