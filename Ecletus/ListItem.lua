
import "Turbine.UI";

ListItem = class( Turbine.UI.Control );

-- Essa classe existe para registar cada item na lista do main panel do Plugin
function ListItem:Constructor( item )
	Turbine.UI.Control.Constructor( self );

	self:SetBlendMode( Turbine.UI.BlendMode.Overlay );

	self.item = item;

	self.item.Started = function( sender, args )
		self.indicator:SetBackColor( Turbine.UI.Color( 1, 0, 1, 0 ) );
	end

	self.item.Stopped = function( sender, args )
		self.indicator:SetBackColor( Turbine.UI.Color( 1, 0, 0.1, 0 ) );
	end

	self.indicator = Turbine.UI.Control();
	self.indicator:SetParent( self );
	self.indicator:SetPosition( 2, 2 );
	self.indicator:SetSize( 16, 16 );
	self.indicator:SetBlendMode( Turbine.UI.BlendMode.Overlay );
	self.indicator:SetBackColorBlendMode( Turbine.UI.BlendMode.Multiply );
	self.indicator:SetBackColor( Turbine.UI.Color( 1, 0, 0.2, 0 ) );

	self.nameLabel = Turbine.UI.Label();
	self.nameLabel:SetParent( self );
	self.nameLabel:SetText( item:GetName() );
	self.nameLabel:SetPosition( 24, 5 );

	self:Layout();
end

function ListItem:GetExample()
	return self.item;
end

function ListItem:SetSelected( value )
	if ( value ) then
		self:SetBackColor( Turbine.UI.Color( 0.4, 0, 0.1, 1 ) )
	else
		self:SetBackColor( Turbine.UI.Color( 1, 0, 0, 0 ) )
	end
end

function ListItem:Layout()

	local width = self:GetWidth();
	self.nameLabel:SetSize( width - self.nameLabel:GetLeft(), 18 );
end

function ListItem:SizeChanged()
	self:Layout();
end
