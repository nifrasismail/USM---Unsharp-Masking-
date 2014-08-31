I=imread('lenna.JPG');

if length(size(I)) == 3
    I=rgb2gray(I);
end

[row,col]=size(I);
J=zeros(row+4,col+4);
J(3:row+2,3:col+2) = I;

% I*H
K=edge(J,'canny');

% M = I - (I*H)
M = [];
for i=1:row+4
    for j=1:col+4
        M(i,j)= J(i,j) - K(i,j);
    end
end

% I' = I + alpha*M
N = [];
for i=1:row+4
    for j=1:col+4
        N(i,j)= J(i,j) + (0.7)*M(i,j);
    end
end

J=uint8(J);
N=uint8(N);

subplot(1,2,1);imshow(J);
subplot(1,2,2);imshow(N);
