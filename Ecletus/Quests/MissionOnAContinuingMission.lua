
EldersladeMarchOnGundabadMissionForTheCause = class( Window );

function EldersladeMarchOnGundabadMissionForTheCause:GetName()
	return "Mission : On A Continuing Mission";
end

function EldersladeMarchOnGundabadMissionForTheCause:IsRunning()
	return ( self.window ~= nil );
end

function EldersladeMarchOnGundabadMissionForTheCause:Start()
	
	--Prvinindo criação duplicada
	if ( self.window ~= nil ) then
		return;
	end

	-- Create a test window to display a status icon.
	self.window = Turbine.UI.Lotro.Window();
	self.window:SetPosition( 100, 100 );
	self.window:SetSize( 600, 400 );
	self.window:SetText( "Missão : Em uma missão contínua" );
	self.window:SetVisible( true );

	self.window.Closed = function( sender, args )
		self:Stop();
	end

	-- Create a status icon and add it to the window.
	local label = Turbine.UI.Label();
	label:SetParent( self.window );
	label:SetText("\n Contexto geral : \n \n Complete missões : 0 / 45. \n As missões podem ser completas em torno da Terra-Média. \n Você precisa completar as missões." );
	label:SetPosition( 20, 40 );
	label:SetSize(560, 100 );
	label:SetBackColor( Turbine.UI.Color( 1, 0.2, 0.2, 0.2 ) );
	label:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter );
	label:SetTextAlignment(1)
	
	-- Create a status icon and add it to the window.
	local label1 = Turbine.UI.Label();
	label1:SetParent( self.window );
	label1:SetText("\n Contexto de Fundo : \n \n Bravos aventureiros foram convocados para completar missões na Terra-média." );
	label1:SetPosition( 20, 150 );
	label1:SetSize(560, 100 );
	label1:SetBackColor( Turbine.UI.Color( 1, 0.2, 0.2, 0.2 ) );
	label1:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter )
	label1:SetTextAlignment(1)

	-- Create a status icon and add it to the window.
	local label2 = Turbine.UI.Label();
	label2:SetParent( self.window );
	label2:SetText("\n Comentários e Pontos Importantes: \n \n Essa queste é repetitivel semanalmente." );
	label2:SetPosition( 20, 260 );
	label2:SetSize(560, 100 );
	label2:SetBackColor( Turbine.UI.Color( 1, 0.2, 0.2, 0.2 ) );
	label2:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter )
	label2:SetTextAlignment(1)
	
	label.MouseClick = function( sender, args )
		label:SetBackColor( Turbine.UI.Color( 1, math.random(), math.random(), math.random() ) );
	end

	Window.Start( self );
end

function EldersladeMarchOnGundabadMissionForTheCause:Stop()
	
	--Liberando memória da Janela.
	self.window = nil;
	Window.Stop( self );
end

-- Register an instance of this example.
RegisterWindow( EldersladeMarchOnGundabadMissionForTheCause() );
