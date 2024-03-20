clc; clear; close all;

x = linspace(-2, 2);
y1 = sqrt(4-x.^2);
y2 = -y1;

% plot(x, y1, x, y2)
area(x, min([y1; y2]), 'FaceColor', 'y')
hold on
area(x, max([y1; y2]), 'FaceColor', 'y')
axis([-2.5,2.5,-2.5,2.5])
axis equal
title("$1) \ x,y\in \mathcal{S} ,\mathcal{S} = \{ x,y \in \mathbf{R} , x^2+y^2 \leq 4 \}$", Interpreter="latex")
hold off
