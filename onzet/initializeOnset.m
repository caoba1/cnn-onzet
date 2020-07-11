function net = initializeOnset(isRGB)
% 09.2016 Carlos de Obaldia

f=1/10 ;
net.layers = {} ;

net.layers{end+1} = struct('type', 'conv', ...
                           'filters', single(f*randn(7,3,3,10, 'single')), ...
                           'biases', zeros(1, 10, 'single'), ...
                           'stride', 1, ...
                           'pad', 0) ;
%net.layers{end+1} = struct('type', 'relu') ; %Comment out def
net.layers{end+1} = struct('type', 'pool', ...
                           'method', 'max', ...
                           'pool', [1 3], ...
                           'stride', [1 3], ...
                           'pad', 0) ;
net.layers{end+1} = struct('type', 'conv', ...
                           'filters', single(f*randn(3,3,10,20, 'single')),...
                           'biases', zeros(1,20,'single'), ...
                           'stride', 1, ...
                           'pad', 0) ;
%net.layers{end+1} = struct('type', 'relu') ; %Comment out def
net.layers{end+1} = struct('type', 'pool', ...
                           'method', 'max', ...
                           'pool', [1 3], ...
                           'stride', [1 3], ...
                           'pad', 0) ;
net.layers{end+1} = struct('type', 'conv', ...
                           'filters', single(f*randn(7,8,20,256, 'single')),...
                           'biases', zeros(1,256,'single'), ...
                           'stride', 1, ...
                           'pad', 0) ;
net.layers{end+1} = struct('type', 'conv', ...
                           'filters', single(f*randn(1,1,256,1, 'single')),...
                           'biases', zeros(1,1,'single'), ...
                           'stride', 1, ...
                           'pad', 0) ;
net.layers{end+1} = struct('type', 'relu') ;
%net.layers{end+1} = struct('type', 'softmaxloss') ;
net.layers{end+1} = struct('type'   , 'loss',...
                           'class'  , [1 0]) ;