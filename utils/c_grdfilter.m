function [Zout, hdr] = c_grdfilter(Zin, head, varargin)
% Temporary function to easy up transition from GMT4 to GMT5.2

% $Id: c_grdfilter.m 10230 2018-01-26 01:34:32Z j $

	G = fill_grid_struct(Zin, head);
	cmd = 'grdfilter';
	for (k = 1:numel(varargin))
		cmd = sprintf('%s %s', cmd, varargin{k});
	end
	Zout = gmtmex(cmd, G);
	gmtmex('destroy')
	if (nargout == 1)
		Zout = Zout.z;
	else
		hdr = [Zout.range Zout.registration Zout.inc];
		Zout = Zout.z;
	end
