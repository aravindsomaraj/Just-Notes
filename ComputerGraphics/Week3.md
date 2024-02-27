# Class Notes

Working on what we established in the previous classes:
```Matlab
for i=1:10
    th1 = (i-1)/20*pi;
    for j=1:10
        th2 = (j-1)/20*pi;
        for k=1:10
            th3 = (k-1)/20*pi;
            % Body of the loop...
        end
    end
end
```
...computing '**th1**', '**th2**', '**th3**' to create rotations.

## Computation and Plotting

```Matlab
p2 = rotation1(th3)*p3+pt3;
p1 = rotation1(th2)*p2+pt2;
p_i = rotation1(th1)*p1+pt1;

pt3_1 = rotation1(th2)*pt3+pt2;
pt3_i = rotation1(th1)*pt3_1+pt1;

pt2_i = rotation1(th1)*pt2+pt1;

p_plot = [pt1 pt2_i pt3_i p_i];

plot(p_plot(1,:),p_plot(2,:)); axis equal; 
xlim([-6 6]); ylim([-6 6])
pause(0.5)
clf
```
...computing transformations based on rotation matrices and translation vectors. And plots them.

## Rotation Function Defn.

```Matlab
function R1 = rotation1(theta)

R1 = [cos(theta) -sin(theta); sin(theta) cos(theta)];
end
```
...returns a 2x2 rotation matrix based on the angle.

> [!IMPORTANT]
> The **ORDER** of points is very important. **Altering the order of points will change the plot in drastic ways!** So be careful of that.
