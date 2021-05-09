import "Ecletus.Ecletus";

EcletusTranslator = class( Turbine.UI.Lotro.Window );

--Construtor principal da aplicação
function EcletusTranslator:Constructor()
	Turbine.UI.Lotro.Window.Constructor( self );

	self:SetText( "Ecletus" );
	self:SetSize( 600, 350 );

	self.textBox = Turbine.UI.Lotro.TextBox()
	self.textBox:SetParent(self)
	self.textBox:SetSize(450,22)
	self.textBox:SetPosition( 20, 40 );
	self.textBox:SetText("Pesquisar...")
	self.textBox:SetMouseVisible(true)

	self.startButton = Turbine.UI.Lotro.GoldButton();
	self.startButton:SetParent( self );
	self.startButton:SetPosition(490, 40);
	self.startButton:SetSize( 75, 30 );
	self.startButton:SetText( "Ver" );

	self.startButton.Click = function( sender, args )
		self.list:GetItem( self.selectedIndex ):GetExample():Start();
	end

	self.listVerticalScrollBar = Turbine.UI.Lotro.ScrollBar();
	self.listVerticalScrollBar:SetOrientation( Turbine.UI.Orientation.Vertical );
	self.listVerticalScrollBar:SetParent( self );

	self.list = Turbine.UI.ListBox();
	self.list:SetParent( self );
	self.list:SetPosition( 20, 67 );
	self.list:SetBackColor( Turbine.UI.Color( 1, 0, 0, 0.2) );
	self.list:SetVerticalScrollBar( self.listVerticalScrollBar );

	--Preenchendo lista
	for key, value in pairs( windows ) do
		local listItem = ListItem( value );
		self.list:AddItem( listItem );
	end

	self.selectedIndex = -1;

	self.list.SelectedIndexChanged = function( sender, args )
		if ( self.selectedIndex ~= -1 ) then
			self.list:GetItem( self.selectedIndex ):SetSelected( false );
		end

		self.selectedIndex = self.list:GetSelectedIndex();

		if ( self.selectedIndex ~= -1 ) then
			self.list:GetItem( self.selectedIndex ):SetSelected( true );
		end
	end

	self:Layout();

	-- Pesquisa de itens
	self.textBox.TextChanged = function (sender, args)

		self.list:ClearItems();
		
		for key, value in pairs( windows ) do

			if string.find(key, string.lower(self.textBox:GetText())) then

				local x = ListItem( value );
				self.list:AddItem( x );
			end
		end

		if self.textBox:GetText() == "" and self.list:GetItemCount() == 0 then
			for key, value in pairs( windows ) do
				local listItem = ListItem( value );
				self.list:AddItem( listItem );
			end
		end

		self:Layout();
	end
end

function EcletusTranslator:Layout()
	local width, height = self:GetSize();

	local listWidth = width - 48;
	local listHeight = height - 93;

	self.list:SetSize( listWidth, listHeight );

	self.listVerticalScrollBar:SetPosition( width - 25, 67 );
	self.listVerticalScrollBar:SetSize( 10, listHeight );

	local i;

	for i = 1, self.list:GetItemCount() do
		local exampleListItem = self.list:GetItem( i );
		exampleListItem:SetSize( listWidth, 20 );
	end
end

function EcletusTranslator:SizeChanged()
	self:Layout();
end


--Chamada principal da aplicação
ecletusTranslator = EcletusTranslator();
ecletusTranslator:SetVisible(true);