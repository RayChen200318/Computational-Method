% myf.m

function fx = myf(x)
    fx = 2*sin(x)./(2+cos(x)) - (2*sin(x).^3)./(2+cos(x)).^3 - (3*sin(x).*cos(x))./(2+cos(x)).^2;
end
