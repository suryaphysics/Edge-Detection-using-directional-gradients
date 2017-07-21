%% Run this code to see the cross-section along the directional vector but uncommenting 'plot of diff'. 
%% There will be a sharp change where edges are present 

MIT License

Copyright (c) 2017 Surya Kamal

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

I = imread('cell.png');
Z = I(189:488,369:668); 
[a,b] = size(Z);

K = zeros(a);

Z(round(a/2),round(b/2))=255;
figure;imshow(Z,[]);  
rect = getrect;
count = 1;
center = zeros(10,1);
line = zeros(a,b,1);
for theta=0:pi/64:2*pi
    for radius=1:70
        center(count,1) = radius*exp(1i*theta); % Generating the coordinates of center of the masks
        line(round(real(center(count,1))+rect(2)),round(imag(center(count,1))+rect(1)),count) = 1 ;
%       imshow(line(:,:,count),[]);
    end
    index = find(squeeze(line(:,:,count)));
    Z1 = Z;
    Z1(index) = 255;
    diff = Z1(index)-Z(index);
%   plot(diff);
    imshow(Z1,[]);
    count = count + 1;
end
