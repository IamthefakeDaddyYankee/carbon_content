function [theta, Js] = GradientDescent(X, y, theta, alpha, iterations)
    % Prepare Variables
    m = length(y);
    Js = zeros(iterations, 1);
    
    for i = 1 : iterations,
        h = X * theta;
        t1 = theta(1) - (alpha * (1 / m) * sum(h - y));
        t2 = theta(2) - (alpha * (1 / m) * sum((h - y) .* X(:, 2)));
        t3 = theta(3) - (alpha * (1 / m) * sum((h - y) .* X(:, 3)));
        theta(1) = t1;
        theta(2) = t2;
        theta(3)=t3;
        
        Js(i) = ComputeCost(X, y, theta);
    end
end