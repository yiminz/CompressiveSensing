function spy( x, mode )
global cvx___

%   SPY is not a computational function, so it can be applied to any  
%   CVX variables. 

switch nargin,
    case 0,
        cvx_throw( 'Not enough arguments.' );
    case 1,
        mode = '';
    case 2,
        if ~ischar( mode ) || size( mode, 1 ) > 1,
            cvx_throw( 'Second argument must be a string.' );
        end
end

b = x.basis_;
s = x.size_;

switch mode,
    case { '2-d', '2-D', '2d', '2D' },
        b = sum( b ~= 0, 1 );
        b = reshape( b, s );
    case { '', '3-d', '3-D', '3d', '3D' },
        p = length( cvx___.classes ) + 1;
        if size( b, 1 ) < p, b( p, end ) = 0; end
    otherwise,
        cvx_throw( 'Unknown spy mode: %s', mode );
end

spy( b );

% Copyright 2005-2014 CVX Research, Inc.
% See the file LICENSE.txt for full copyright information.
% The command 'cvx_where' will show where this file is located.
