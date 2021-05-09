--Declare window tipe
Window = class();

function Window:GetName()
	return "<Unnamed>";
end

function Window:IsRunning()
	return false;
end

function Window:Start()
	if ( ( self.Started ~= nil ) and ( type( self.Started ) == "function" ) ) then
		self.Started( self, { } );
	end
end

function Window:Stop()
	if ( ( self.Stopped ~= nil ) and ( type( self.Stopped ) == "function" ) ) then
		self.Stopped( self, { } );
	end
end

-- Create a table that maps windows names to function used to execute them.
windows = { }

-- Function to register window itens
function RegisterWindow( window )
	local name = string.lower( window:GetName() );
	windows[name] = window;
end
