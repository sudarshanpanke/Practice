function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples
n = length(theta);
% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));
% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
term1 = 0;
term2 = 0;
g1 = sigmoid(X*theta);
for i=1:m
	term1 = term1 + (y(i,1) * log(g1(i,1))) + ((1-y(i,1))*log(1 - g1(i,1)));
end;
for j = 2:n
	term2 = term2 + theta(j,1)*theta(j,1); 
end;
term2 = (term2*lambda) / 2;
J = (-term1 + term2)/m;

for i = 1:n
	var = 0;
	if( i != 1)
		for j = 1:m
			var = var + ( g1(j,1) - y(j,1))*X(j,i);
		end;
		var = var + lambda * theta(i,1);
	else
		for j = 1:m
			var = var + ( g1(j,1) - y(j,1))*X(j,i);
		end;
	endif;
	grad(i,1) = var / m;
end;




% =============================================================

end
