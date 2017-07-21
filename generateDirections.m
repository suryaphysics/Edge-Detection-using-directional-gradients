%% This script simply shows how to generate different directional vectors using a single click
%% Run the script and click on the black image to see the results

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

plane = zeros(randi([300 500]),randi([400 650]));
imshow(plane);title('Input Image');
[rows,cols] = size(plane);
rect = getrect;
col = rect(1);
row = rect(2);
count = 1;
radius = max(rows,cols)/2;
points = zeros(10,1);
planeNew = plane;

for theta = 0:pi/32:2*pi
    for dist = 1:radius
        points(count,1) = dist*exp(1i*theta);
        a = round((row + round(real(points(count,1)))));
        b = round((col + round(imag(points(count,1)))));
        if (((a) < (rows)) && ((b) < cols) && ((a) > 0) && ((b) > 0))
            planeNew(a,b) = 255;
        end
        count = count + 1;        
    end
    imshow(planeNew,[]);
end

