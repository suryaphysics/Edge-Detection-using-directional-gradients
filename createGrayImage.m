%% This script simply creates a gray image with simple shapes for testing !

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

I = zeros(1000);
J = im2uint8(I);
radius = 50;

J(100:250,100:250) = 120;
J(650:800,650:900) = 130;
for i=400:600
    for j=400:600
        if i<j
            J(i,j) = 70;
        end
    end
end
for i=100:300
    for j=600:900
        if sqrt((i-200).^2+(j-750).^2)<2*radius
            J(i,j) = 20;
        end
    end
end

for j=100:300
    for i=600:900
        if sqrt((j-200).^2+(i-750).^2)<2*radius
            J(i,j) = 100;
        end
    end
end

figure;imshow(J,[]);
JJ = imresize(J,[32 32]);
figure;imshow(JJ,[]);
