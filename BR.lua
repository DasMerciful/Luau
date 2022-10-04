-- Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local uis = game:GetService("UserInputService")

--vars
local localp = Players.LocalPlayer
local mouse = localp:GetMouse()
local ViewPort = workspace.CurrentCamera.ViewportSize
local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)

local Library = {}


function Library:validate(defaults, options)
	for i, v in pairs(defaults) do
		if options[i] == nil then
			options[i] = v
		end
	end
	return options
end

function Library:Tween(object, goal, callback)
	local tween = TweenService:Create(object, tweenInfo, goal)
	tween.Completed:Connect(callback or function() end)
	tween:Play()
end

function dragify(Frame) -- credits: bloodball on github
	dragToggle = nil
	dragSpeed = 0.25
	dragInput = nil
	dragStart = nil
	dragPos = nil
	function updateInput(input)
		Delta = input.Position - dragStart
		Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
		game:GetService("TweenService"):Create(Frame, TweenInfo.new(.25), {
			Position = Position
		}):Play()
	end
	Frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
			dragToggle = true
			dragStart = input.Position
			startPos = Frame.Position
			input.Changed:Connect(function()
				if (input.UserInputState == Enum.UserInputState.End) then
					dragToggle = false
				end
			end)
		end
	end)
	Frame.InputChanged:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			dragInput = input
		end
	end)
	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if (input == dragInput and dragToggle) then
			updateInput(input)
		end
	end)
end

function Library:Init(options)
	options = Library:validate({
		name = "Ui Library Test";
		gamename = "Nil"
	}, options or {})
	
	local GUI = {
		CurrentTab = nil
	}
	-- Main Frame
	do
		GUI["1"] = Instance.new("ScreenGui", RunService:IsStudio() and Players.LocalPlayer:WaitForChild("PlayerGui") or CoreGui);
		GUI["1"]["Name"] = [[Hub]];
		GUI["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;

		-- StarterGui.Library.MAIN
		GUI["2"] = Instance.new("Frame", GUI["1"]);
		GUI["2"]["BackgroundColor3"] = Color3.fromRGB(26, 26, 26);
		GUI["2"]["AnchorPoint"] = Vector2.new(0,0);
		GUI["2"]["Size"] = UDim2.new(0, 425, 0, 283);
		GUI["2"]["Position"] = UDim2.fromOffset(GUI["2"].Position.X.Offset + GUI["2"].Size.X.Offset / 2, GUI["2"].Position.Y.Offset + GUI["2"].Size.Y.Offset / 2)
		GUI["2"]["Name"] = [[Main]];

		-- StarterGui.Library.Main.UICorner
		GUI["3"] = Instance.new("UICorner", GUI["2"]);
		GUI["3"]["CornerRadius"] = UDim.new(0, 5);

		-- StarterGui.Library.Main.TopBar
		GUI["4"] = Instance.new("Frame", GUI["2"]);
		GUI["4"]["BorderSizePixel"] = 0;
		GUI["4"]["BackgroundColor3"] = Color3.fromRGB(17, 17, 17);
		GUI["4"]["Size"] = UDim2.new(1.000000238418579, 0, 0.047744669020175934, 25);
		GUI["4"]["Position"] = UDim2.new(0, 0, -0.000872177304700017, 0);
		GUI["4"]["Name"] = [[TopBar]];

		-- StarterGui.Library.Main.TopBar.UICorner
		GUI["5"] = Instance.new("UICorner", GUI["4"]);
		GUI["5"]["CornerRadius"] = UDim.new(0, 5);

		-- StarterGui.Library.Main.TopBar.Extension
		GUI["6"] = Instance.new("Frame", GUI["4"]);
		GUI["6"]["BorderSizePixel"] = 0;
		GUI["6"]["BackgroundColor3"] = Color3.fromRGB(17, 17, 17);
		GUI["6"]["AnchorPoint"] = Vector2.new(0, 1);
		GUI["6"]["BackgroundTransparency"] = 1;
		GUI["6"]["Size"] = UDim2.new(1.0250520706176758, -12, 1, -12);
		GUI["6"]["Position"] = UDim2.new(0, 0, 0.9999998807907104, 0);
		GUI["6"]["Name"] = [[Extension]];

		-- StarterGui.Library.Main.TopBar.Name
		GUI["7"] = Instance.new("TextLabel", GUI["4"]);
		GUI["7"]["TextWrapped"] = true;
		GUI["7"]["BorderSizePixel"] = 0;
		GUI["7"]["TextXAlignment"] = Enum.TextXAlignment.Left;
		GUI["7"]["TextScaled"] = true;
		GUI["7"]["BackgroundColor3"] = Color3.fromRGB(17, 17, 17);
		GUI["7"]["TextSize"] = 14;
		GUI["7"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["7"]["Size"] = UDim2.new(0.22129446268081665, 0, 0, 25);
		GUI["7"]["Text"] = options["name"]
		GUI["7"]["Name"] = [[Name]];
		GUI["7"]["Font"] = Enum.Font.Unknown;
		GUI["7"]["Position"] = UDim2.new(0, 0, 0.006643501576036215, 0);

		-- StarterGui.Library.Main.TopBar.Name.UIPadding
		GUI["8"] = Instance.new("UIPadding", GUI["7"]);
		GUI["8"]["PaddingLeft"] = UDim.new(0, 8);

		-- StarterGui.Library.Main.TopBar.Name.UICorner
		GUI["9"] = Instance.new("UICorner", GUI["7"]);
		GUI["9"]["CornerRadius"] = UDim.new(0, 5);

		-- StarterGui.Library.Main.TopBar.Game
		GUI["a"] = Instance.new("TextLabel", GUI["4"]);
		GUI["a"]["TextWrapped"] = true;
		GUI["a"]["BorderSizePixel"] = 0;
		GUI["a"]["TextXAlignment"] = Enum.TextXAlignment.Left;
		GUI["a"]["TextScaled"] = true;
		GUI["a"]["BackgroundColor3"] = Color3.fromRGB(17, 17, 17);
		GUI["a"]["TextSize"] = 14;
		GUI["a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["a"]["Size"] = UDim2.new(0.6784968972206116, 0, -0.26857203245162964, 25);
		GUI["a"]["Text"] = options["gamename"];
		GUI["a"]["Name"] = [[Game]];
		GUI["a"]["Font"] = Enum.Font.Unknown;
		GUI["a"]["BackgroundTransparency"] = 1;
		GUI["a"]["Position"] = UDim2.new(0, 0, 0.6257084608078003, 0);

		-- StarterGui.Library.Main.TopBar.Game.UIPadding
		GUI["b"] = Instance.new("UIPadding", GUI["a"]);
		GUI["b"]["PaddingLeft"] = UDim.new(0, 8);

		-- StarterGui.Library.Main.TopBar.Game.UICorner
		GUI["c"] = Instance.new("UICorner", GUI["a"]);
		GUI["c"]["CornerRadius"] = UDim.new(0, 5);

		-- StarterGui.Library.Main.TopBar.Close
		GUI["d"] = Instance.new("ImageButton", GUI["4"]);
		GUI["d"]["BackgroundColor3"] = Color3.fromRGB(17, 17, 17);
		GUI["d"]["AnchorPoint"] = Vector2.new(1, 0.5);
		GUI["d"]["Image"] = [[rbxassetid://6236220207]];
		GUI["d"]["Size"] = UDim2.new(0, 22, 0, 22);
		GUI["d"]["Name"] = [[Close]];
		GUI["d"]["Position"] = UDim2.new(0.9791229963302612, 0, 0.4953668713569641, 0);
		GUI["d"]["BackgroundTransparency"] = 1;
		-- StarterGui.Library.Main.ContentContainer
		GUI["19"] = Instance.new("Frame", GUI["2"]);
		GUI["19"]["BorderSizePixel"] = 0;
		GUI["19"]["BackgroundColor3"] = Color3.fromRGB(43, 43, 43);
		GUI["19"]["AnchorPoint"] = Vector2.new(1, 0);
		GUI["19"]["BackgroundTransparency"] = 1;
		GUI["19"]["Size"] = UDim2.new(1, -132, 0.9750000238418579, -42);
		GUI["19"]["BorderColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["19"]["Position"] = UDim2.new(1, -6, 0, 44);
		GUI["19"]["Name"] = [[ContentContainer]];
		
		
	end
	
	-- Navigation
	do
		-- StarterGui.Library.Main.Navigation
		GUI["e"] = Instance.new("Frame", GUI["2"]);
		GUI["e"]["BorderSizePixel"] = 0;
		GUI["e"]["BackgroundColor3"] = Color3.fromRGB(44, 44, 44);
		GUI["e"]["Size"] = UDim2.new(0, 120, 1.0202150344848633, -45);
		GUI["e"]["Position"] = UDim2.new(0, 0, 0, 38);
		GUI["e"]["Name"] = [[Navigation]];

		-- StarterGui.Library.Main.Navigation.UICorner
		GUI["f"] = Instance.new("UICorner", GUI["e"]);
		GUI["f"]["CornerRadius"] = UDim.new(0, 5);

		-- StarterGui.Library.Main.Navigation.ButtonHolder
		GUI["10"] = Instance.new("Frame", GUI["e"]);
		GUI["10"]["BorderSizePixel"] = 0;
		GUI["10"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["10"]["BackgroundTransparency"] = 1;
		GUI["10"]["Size"] = UDim2.new(1, 0, 1, 0);
		GUI["10"]["Name"] = [[ButtonHolder]];

		-- StarterGui.Library.Main.Navigation.ButtonHolder.UIPadding
		GUI["11"] = Instance.new("UIPadding", GUI["10"]);
		GUI["11"]["PaddingTop"] = UDim.new(0, 5);
		GUI["11"]["PaddingBottom"] = UDim.new(0, 8);

		-- StarterGui.Library.Main.Navigation.ButtonHolder.UIListLayout
		GUI["12"] = Instance.new("UIListLayout", GUI["10"]);
		GUI["12"]["Padding"] = UDim.new(0, 1);
		GUI["12"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
		

	end
	
	function GUI:Tab(options)
		options = Library:validate({
			name = "Preview Tab";
			icon = "rbxassetid://11158110457"
		}, options or {})
		
		local Tab = {
			Hover = false,
			Active = false
		}
		
		--render
		do
			-- StarterGui.Library.Main.Navigation.ButtonHolder.Inactive
			Tab["16"] = Instance.new("TextLabel", GUI["10"]);
			Tab["16"]["TextWrapped"] = true;
			Tab["16"]["BorderSizePixel"] = 0;
			Tab["16"]["TextXAlignment"] = Enum.TextXAlignment.Left;
			Tab["16"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["16"]["TextSize"] = 12;
			Tab["16"]["TextColor3"] = Color3.fromRGB(128, 128, 128);
			Tab["16"]["Size"] = UDim2.new(1, 0, 0, 24);
			Tab["16"]["Text"] = options.name;
			Tab["16"]["Name"] = [[Inactive]];
			Tab["16"]["Font"] = Enum.Font.Ubuntu;
			Tab["16"]["BackgroundTransparency"] = 1;

			-- StarterGui.Library.Main.Navigation.ButtonHolder.Inactive.UIPadding
			Tab["17"] = Instance.new("UIPadding", Tab["16"]);
			Tab["17"]["PaddingLeft"] = UDim.new(0, 26);

			-- StarterGui.Library.Main.Navigation.ButtonHolder.Inactive.Icon
			Tab["18"] = Instance.new("ImageLabel", Tab["16"]);
			Tab["18"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["18"]["ImageColor3"] = Color3.fromRGB(128, 128, 128);
			Tab["18"]["AnchorPoint"] = Vector2.new(0, 0.25);
			Tab["18"]["Image"] = options.icon;
			Tab["18"]["Size"] = UDim2.new(0, 20, 0, 20);
			Tab["18"]["Name"] = [[Icon]];
			Tab["18"]["BackgroundTransparency"] = 1;
			Tab["18"]["Position"] = UDim2.new(-0.013000000268220901, -22, 0.2919999957084656, 0);
			
			-- StarterGui.Library.Main.ContentContainer.HomeTab
			Tab["1a"] = Instance.new("ScrollingFrame", GUI["19"]);
			Tab["1a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["1a"]["BackgroundTransparency"] = 1;
			Tab["1a"]["Size"] = UDim2.new(1, 0, 1, 0);
			Tab["1a"]["Selectable"] = false;
			Tab["1a"]["ScrollBarThickness"] = 0;
			Tab["1a"]["Name"] = [[HomeTab]];
			Tab["1a"]["SelectionGroup"] = false;
			Tab["1a"]["Visible"] = false;
			
			-- StarterGui.Library.Main.ContentContainer.HomeTab.UIListLayout
			GUI["22"] = Instance.new("UIListLayout", Tab["1a"]);
			GUI["22"]["Padding"] = UDim.new(0, 6);
			GUI["22"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

			-- StarterGui.Library.Main.ContentContainer.HomeTab.UIPadding
			GUI["21"] = Instance.new("UIPadding", Tab["1a"]);
			GUI["21"]["PaddingTop"] = UDim.new(0, 1);
			GUI["21"]["PaddingRight"] = UDim.new(0, 1);
			GUI["21"]["PaddingBottom"] = UDim.new(0, 1);
			GUI["21"]["PaddingLeft"] = UDim.new(0, 1);
		end
		
		--Methods
		function Tab:Activated()
			if not Tab.Active then
				if GUI.CurrentTab ~= nil then
					GUI.CurrentTab:Deactivated()
				end
				
				Tab.Active = true
				Library:Tween(Tab["16"], {BackgroundTransparency = .9})
				Library:Tween(Tab["16"], {TextColor3 = Color3.fromRGB(255,255,255)})
				Library:Tween(Tab["18"], {ImageColor3 = Color3.fromRGB(255,255,255)})
				Tab["1a"].Visible = true
				
				GUI.CurrentTab = Tab
			end
		end
		
		function Tab:Deactivated()
			if Tab.Active then
				Tab.Active = false
				Tab.Hover = false
				Library:Tween(Tab["16"], {BackgroundTransparency = 1})
				Library:Tween(Tab["16"], {TextColor3 = Color3.fromRGB(128, 128, 128)})
				Library:Tween(Tab["18"], {ImageColor3 = Color3.fromRGB(128, 128, 128)})
				Tab["1a"].Visible = false
			end
		end
		
		--Logic
		do
			Tab["16"].MouseEnter:Connect(function()
				Tab.Hover = true
				if not Tab.Active then
					Library:Tween(Tab["16"], {TextColor3 = Color3.fromRGB(255,255,255)})
					Library:Tween(Tab["18"], {ImageColor3 = Color3.fromRGB(255,255,255)})
				end
			end)

			Tab["16"].MouseLeave:Connect(function()
				Tab.Hover = false
				if not Tab.Active then
					Library:Tween(Tab["16"], {TextColor3 = Color3.fromRGB(128, 128, 128)})
					Library:Tween(Tab["18"], {ImageColor3 = Color3.fromRGB(128, 128, 128)})
				end
			end)

			uis.InputBegan:Connect(function(input, gpe)
				if gpe then return end

				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					if Tab.Hover then
						Tab:Activated()
					end
				end
			end)

			if GUI.CurrentTab == nil then
				Tab:Activated()
			end
		end
		
		function Tab:Button(options)
			options = Library:validate({
				name = "Preview Button";
				callback = function() end
			}, options or {})
			
			local Button = {
				Hover = false,
				MouseDown = false
			}
			
			--render
			do
				-- StarterGui.Library.Main.ContentContainer.HomeTab.Button
				Button["1b"] = Instance.new("Frame", Tab["1a"]);
				Button["1b"]["BackgroundColor3"] = Color3.fromRGB(48, 48, 48);
				Button["1b"]["Size"] = UDim2.new(0.9990000128746033, 0, 0, 32);
				Button["1b"]["Name"] = [[Button]];

				-- StarterGui.Library.Main.ContentContainer.HomeTab.Button.UICorner
				Button["1c"] = Instance.new("UICorner", Button["1b"]);
				Button["1c"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterGui.Library.Main.ContentContainer.HomeTab.Button.UIStroke
				Button["1d"] = Instance.new("UIStroke", Button["1b"]);
				Button["1d"]["Color"] = Color3.fromRGB(82, 82, 82);
				Button["1d"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.Library.Main.ContentContainer.HomeTab.Button.Title
				Button["1e"] = Instance.new("TextLabel", Button["1b"]);
				Button["1e"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Button["1e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Button["1e"]["TextSize"] = 14;
				Button["1e"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Button["1e"]["Size"] = UDim2.new(1, 0, 1, 0);
				Button["1e"]["Text"] = options.name;
				Button["1e"]["Name"] = [[Title]];
				Button["1e"]["Font"] = Enum.Font.Ubuntu;
				Button["1e"]["BackgroundTransparency"] = 1;

				-- StarterGui.Library.Main.ContentContainer.HomeTab.Button.UIPadding
				Button["1f"] = Instance.new("UIPadding", Button["1b"]);
				Button["1f"]["PaddingTop"] = UDim.new(0, 6);
				Button["1f"]["PaddingRight"] = UDim.new(0, 6);
				Button["1f"]["PaddingBottom"] = UDim.new(0, 6);
				Button["1f"]["PaddingLeft"] = UDim.new(0, 6);

				-- StarterGui.Library.Main.ContentContainer.HomeTab.Button.Icon
				Button["20"] = Instance.new("ImageLabel", Button["1b"]);
				Button["20"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Button["20"]["AnchorPoint"] = Vector2.new(1, 0);
				Button["20"]["Image"] = [[rbxassetid://11158242922]];
				Button["20"]["Size"] = UDim2.new(0, 20, 0, 20);
				Button["20"]["Name"] = [[Icon]];
				Button["20"]["BackgroundTransparency"] = 1;
				Button["20"]["Position"] = UDim2.new(1, 0, 0, 0);
			end
			
			--Methods
			function Button:SetText(text)
				Button["1e"].Text = text
				options.name = text
			end
			
			function Button:SetCallback(fn)
				options.callback = fn
			end
			
			
			--Logic
			do
				Button["1b"].MouseEnter:Connect(function()
					Button.Hover = true
					
					Library:Tween(Button["1d"], {Color = Color3.fromRGB(62,62,62)})
				end)
				
				Button["1b"].MouseLeave:Connect(function()
					Button.Hover = false
					
					if not Button.MouseDown then
						Library:Tween(Button["1d"], {Color = Color3.fromRGB(118, 118, 118)})
					end
				end)
				
				uis.InputBegan:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 and Button.Hover then
						Button.MouseDown = true
						Library:Tween(Button["1b"], {BackgroundColor3 = Color3.fromRGB(48, 48, 48)})
						Library:Tween(Button["1d"], {Color = Color3.fromRGB(200,200,200)})
						options.callback()
					end
				end)
				
				
				uis.InputEnded:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Button.MouseDown = false
						
						if Button.Hover then
							Library:Tween(Button["1b"], {BackgroundColor3 = Color3.fromRGB(57,57,57)})
							Library:Tween(Button["1d"], {Color = Color3.fromRGB(62,62,62)})
						else
							Library:Tween(Button["1b"], {BackgroundColor3 = Color3.fromRGB(57,57,57)})
							Library:Tween(Button["1d"], {Color = Color3.fromRGB(82, 82, 82)})
						end
					end
				end)
			end
			
			return Button
		end
		
		function Tab:Label(options)
			options = Library:validate({
				Message = "Preview label";
				colorstroke = Color3.fromRGB(135, 135, 135),
				colorframe = Color3.fromRGB(47, 47, 47),
				icon = "rbxassetid://10913767273"
			}, options or {})
			
			local label = {}
			
			--Render
			do
				-- StarterGui.Library.Main.ContentContainer.HomeTab.label
				label["23"] = Instance.new("Frame", Tab["1a"]);
				label["23"]["BackgroundColor3"] = options.colorframe;
				label["23"]["Size"] = UDim2.new(0.9990000128746033, 0, 0, 26);
				label["23"]["Name"] = [[label]];

				-- StarterGui.Library.Main.ContentContainer.HomeTab.label.UICorner
				label["24"] = Instance.new("UICorner", label["23"]);
				label["24"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterGui.Library.Main.ContentContainer.HomeTab.label.UIStroke
				label["25"] = Instance.new("UIStroke", label["23"]);
				label["25"]["Color"] = options.colorstroke;
				label["25"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
				
				-- StarterGui.Library.Main.ContentContainer.HomeTab.label.Title
				label["26"] = Instance.new("TextLabel", label["23"]);
				label["26"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				label["26"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				label["26"]["TextSize"] = 14;
				label["26"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				label["26"]["Size"] = UDim2.new(1, 0, 1, 0);
				label["26"]["Text"] = options.Message;
				label["26"]["Name"] = [[Title]];
				label["26"]["Font"] = Enum.Font.Ubuntu;
				label["26"]["BackgroundTransparency"] = 1;
				label["26"]["TextWrapped"] = true
				label["26"]["TextYAlignment"] = Enum.TextYAlignment.Top
				
				-- StarterGui.Library.Main.ContentContainer.HomeTab.label.UIPadding
				label["27"] = Instance.new("UIPadding", label["23"]);
				label["27"]["PaddingTop"] = UDim.new(0, 6);
				label["27"]["PaddingRight"] = UDim.new(0, 6);
				label["27"]["PaddingBottom"] = UDim.new(0, 6);
				label["27"]["PaddingLeft"] = UDim.new(0, 28);

				-- StarterGui.Library.Main.ContentContainer.HomeTab.label.Icon
				label["28"] = Instance.new("ImageLabel", label["23"]);
				label["28"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				label["28"]["AnchorPoint"] = Vector2.new(1, 0);
				label["28"]["Image"] = options.icon;
				label["28"]["Size"] = UDim2.new(0, 20, 0, 20);
				label["28"]["Name"] = [[Icon]];
				label["28"]["BackgroundTransparency"] = 1;
				label["28"]["Position"] = UDim2.new(0, -5, 0, -3);
			end
			
			--Methods
			function label:SetText(Text)
				options.Message = Text
				label:_update()
			end
			
			function label:_update()
				label["26"].Text = options.Message
				
				label["26"].Size = UDim2.new(label["26"].Size.X.Scale, label["26"].Size.X.Offset, 0, math.huge)
				label["26"].Size = UDim2.new(label["26"].Size.X.Scale, label["26"].Size.X.Offset, 0, label["26"].TextBounds.Y)
				label["23"].Size = UDim2.new(label["23"].Size.X.Scale, label["23"].Size.X.Offset,0, label["26"].TextBounds.Y + 12)
			end
			
			label:_update()
			return label
		end
		
		function Tab:Toggle(options)
			options = Library:validate({
				title = "Toggle",
				callback = function() end
			}, options or {})
			
			
			local Toggle = {
				MouseDown = false,
				Hover = false,
				State = false
			}
			
			--render
			do
				-- StarterGui.Library.Main.ContentContainer.HomeTab.ToggleInactive
				Toggle["51"] = Instance.new("Frame", Tab["1a"]);
				Toggle["51"]["BackgroundColor3"] = Color3.fromRGB(48, 48, 48);
				Toggle["51"]["Size"] = UDim2.new(0.9990000128746033, 0, 0, 32);
				Toggle["51"]["Name"] = [[ToggleInactive]];

				-- StarterGui.Library.Main.ContentContainer.HomeTab.ToggleInactive.UICorner
				Toggle["52"] = Instance.new("UICorner", Toggle["51"]);
				Toggle["52"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterGui.Library.Main.ContentContainer.HomeTab.ToggleInactive.UIStroke
				Toggle["53"] = Instance.new("UIStroke", Toggle["51"]);
				Toggle["53"]["Color"] = Color3.fromRGB(82, 82, 82);
				Toggle["53"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.Library.Main.ContentContainer.HomeTab.ToggleInactive.Title
				Toggle["54"] = Instance.new("TextLabel", Toggle["51"]);
				Toggle["54"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Toggle["54"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["54"]["TextSize"] = 14;
				Toggle["54"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["54"]["Size"] = UDim2.new(1, -26, 1, 0);
				Toggle["54"]["Text"] = options.title;
				Toggle["54"]["Name"] = [[Title]];
				Toggle["54"]["Font"] = Enum.Font.Ubuntu;
				Toggle["54"]["BackgroundTransparency"] = 1;

				-- StarterGui.Library.Main.ContentContainer.HomeTab.ToggleInactive.UIPadding
				Toggle["55"] = Instance.new("UIPadding", Toggle["51"]);
				Toggle["55"]["PaddingTop"] = UDim.new(0, 6);
				Toggle["55"]["PaddingRight"] = UDim.new(0, 6);
				Toggle["55"]["PaddingBottom"] = UDim.new(0, 6);
				Toggle["55"]["PaddingLeft"] = UDim.new(0, 6);

				-- StarterGui.Library.Main.ContentContainer.HomeTab.ToggleInactive.CheckmarkHolder
				Toggle["56"] = Instance.new("Frame", Toggle["51"]);
				Toggle["56"]["BackgroundColor3"] = Color3.fromRGB(82, 82, 82);
				Toggle["56"]["AnchorPoint"] = Vector2.new(1, 0.5);
				Toggle["56"]["Size"] = UDim2.new(0, 20, 0, 20);
				Toggle["56"]["Position"] = UDim2.new(1, -3, 0.5, 0);
				Toggle["56"]["Name"] = [[CheckmarkHolder]];

				-- StarterGui.Library.Main.ContentContainer.HomeTab.ToggleInactive.CheckmarkHolder.UICorner
				Toggle["57"] = Instance.new("UICorner", Toggle["56"]);
				Toggle["57"]["CornerRadius"] = UDim.new(0, 2);

				-- StarterGui.Library.Main.ContentContainer.HomeTab.ToggleInactive.CheckmarkHolder.UIStroke
				Toggle["58"] = Instance.new("UIStroke", Toggle["56"]);
				Toggle["58"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.Library.Main.ContentContainer.HomeTab.ToggleInactive.CheckmarkHolder.Checkmark
				Toggle["59"] = Instance.new("ImageLabel", Toggle["56"]);
				Toggle["59"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["59"]["ImageTransparency"] = 1;
				Toggle["59"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
				Toggle["59"]["Image"] = [[rbxassetid://11158981609]];
				Toggle["59"]["Size"] = UDim2.new(1, -2, 1, -2);
				Toggle["59"]["Name"] = [[Checkmark]];
				Toggle["59"]["BackgroundTransparency"] = 1;
				Toggle["59"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
			end
			
			--Methods
			do
				function Toggle:Par(b)
					if b == nil then
						Toggle.State = not Toggle.State
					else
						Toggle.State = b
					end
					
					if Toggle.State then
						Library:Tween(Toggle["56"], {BackgroundColor3 = Color3.fromRGB(3, 206, 0)})
						Library:Tween(Toggle["59"], {ImageTransparency = 0})

					else
						Library:Tween(Toggle["56"], {BackgroundColor3 = Color3.fromRGB(82, 82, 82)})
						Library:Tween(Toggle["59"], {ImageTransparency = 1})
					end
					
					options.callback(Toggle.State)
				end
			end
			
			--logic
			do
				Toggle["51"].MouseEnter:Connect(function()
					Toggle.Hover = true

					Library:Tween(Toggle["53"], {Color = Color3.fromRGB(62,62,62)})
				end)

				Toggle["51"].MouseLeave:Connect(function()
					Toggle.Hover = false

					if not Toggle.MouseDown then
						Library:Tween(Toggle["53"], {Color = Color3.fromRGB(118, 118, 118)})
					end
				end)

				uis.InputBegan:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 and Toggle.Hover then
						Toggle.MouseDown = true
						Library:Tween(Toggle["51"], {BackgroundColor3 = Color3.fromRGB(83, 83, 83)})
						Library:Tween(Toggle["53"], {Color = Color3.fromRGB(200,200,200)})
						Toggle:Par()
					end
				end)


				uis.InputEnded:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Toggle.MouseDown = false

						if Toggle.Hover then
							Library:Tween(Toggle["51"], {BackgroundColor3 = Color3.fromRGB(48, 48, 48)})
							Library:Tween(Toggle["53"], {Color = Color3.fromRGB(118, 118, 118)})
						else
							Library:Tween(Toggle["51"], {BackgroundColor3 = Color3.fromRGB(48, 48, 48)})
							Library:Tween(Toggle["53"], {Color = Color3.fromRGB(82, 82, 82)})
						end
					end
				end)
			end
		end
		
		function Tab:Slider(options)
			options = Library:validate({
				title = "Preview Slider";
				min = 0;
				max = 100;
				default = 50;
				callback = function(v) print(v) end
			}, options or {})
			
			local Slider = {
				MouseDown = false,
				Hover = false,
				Connection = nil
			}
			
			--render
			do
				-- StarterGui.Library.Main.ContentContainer.HomeTab.Slider
				Slider["35"] = Instance.new("Frame", Tab["1a"]);
				Slider["35"]["BackgroundColor3"] = Color3.fromRGB(48, 48, 48);
				Slider["35"]["Size"] = UDim2.new(0.9990000128746033, 0, 0, 36);
				Slider["35"]["Name"] = [[Slider]];

				-- StarterGui.Library.Main.ContentContainer.HomeTab.Slider.UICorner
				Slider["36"] = Instance.new("UICorner", Slider["35"]);
				Slider["36"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterGui.Library.Main.ContentContainer.HomeTab.Slider.UIStroke
				Slider["37"] = Instance.new("UIStroke", Slider["35"]);
				Slider["37"]["Color"] = Color3.fromRGB(82, 82, 82);
				Slider["37"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.Library.Main.ContentContainer.HomeTab.Slider.Title
				Slider["38"] = Instance.new("TextLabel", Slider["35"]);
				Slider["38"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Slider["38"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["38"]["TextSize"] = 14;
				Slider["38"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["38"]["Size"] = UDim2.new(1, -24, 0.9333333373069763, -10);
				Slider["38"]["Text"] = options.title;
				Slider["38"]["Name"] = [[Title]];
				Slider["38"]["Font"] = Enum.Font.Ubuntu;
				Slider["38"]["BackgroundTransparency"] = 1;

				-- StarterGui.Library.Main.ContentContainer.HomeTab.Slider.UIPadding
				Slider["39"] = Instance.new("UIPadding", Slider["35"]);
				Slider["39"]["PaddingTop"] = UDim.new(0, 6);
				Slider["39"]["PaddingRight"] = UDim.new(0, 6);
				Slider["39"]["PaddingBottom"] = UDim.new(0, 6);
				Slider["39"]["PaddingLeft"] = UDim.new(0, 6);

				-- StarterGui.Library.Main.ContentContainer.HomeTab.Slider.Value
				Slider["3a"] = Instance.new("TextLabel", Slider["35"]);
				Slider["3a"]["TextXAlignment"] = Enum.TextXAlignment.Right;
				Slider["3a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["3a"]["TextSize"] = 14;
				Slider["3a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["3a"]["AnchorPoint"] = Vector2.new(1, 0);
				Slider["3a"]["Size"] = UDim2.new(0, 24, 1, -10);
				Slider["3a"]["Text"] = tostring(options.default);
				Slider["3a"]["Name"] = [[Value]];
				Slider["3a"]["Font"] = Enum.Font.Ubuntu;
				Slider["3a"]["BackgroundTransparency"] = 1;
				Slider["3a"]["Position"] = UDim2.new(1, 0, -0.03333333507180214, 0);

				-- StarterGui.Library.Main.ContentContainer.HomeTab.Slider.SliderBack
				Slider["3b"] = Instance.new("Frame", Slider["35"]);
				Slider["3b"]["BackgroundColor3"] = Color3.fromRGB(32, 32, 32);
				Slider["3b"]["AnchorPoint"] = Vector2.new(0, 1);
				Slider["3b"]["Size"] = UDim2.new(1, 0, 0, 4);
				Slider["3b"]["Position"] = UDim2.new(0, 0, 1, 0);
				Slider["3b"]["Name"] = [[SliderBack]];

				-- StarterGui.Library.Main.ContentContainer.HomeTab.Slider.SliderBack.UICorner
				Slider["3c"] = Instance.new("UICorner", Slider["3b"]);


				-- StarterGui.Library.Main.ContentContainer.HomeTab.Slider.SliderBack.UIStroke
				Slider["3d"] = Instance.new("UIStroke", Slider["3b"]);
				Slider["3d"]["Color"] = Color3.fromRGB(10, 10, 10);

				-- StarterGui.Library.Main.ContentContainer.HomeTab.Slider.SliderBack.Draggable
				Slider["3e"] = Instance.new("Frame", Slider["3b"]);
				Slider["3e"]["BackgroundColor3"] = Color3.fromRGB(58, 58, 58);
				Slider["3e"]["Size"] = UDim2.new(0.5, 0, 1, 0);
				Slider["3e"]["Name"] = [[Draggable]];

				-- StarterGui.Library.Main.ContentContainer.HomeTab.Slider.SliderBack.Draggable.UICorner
				Slider["3f"] = Instance.new("UICorner", Slider["3e"]);


				-- StarterGui.Library.Main.ContentContainer.HomeTab.Dropdown
				Slider["40"] = Instance.new("Frame", Slider["1a"]);
				Slider["40"]["BackgroundColor3"] = Color3.fromRGB(48, 48, 48);
				Slider["40"]["Size"] = UDim2.new(0.9990000128746033, 0, 0, 30);
				Slider["40"]["ClipsDescendants"] = true;
				Slider["40"]["Name"] = [[Dropdown]];
			end
			
			--Methods
			function Slider:SetValue(v)
				if v == nil then
				local percentage = math.clamp((mouse.X - Slider["35"].AbsolutePosition.X) / (Slider["35"].AbsoluteSize.X), 0, 1)
				local value = math.floor(((options.max - options.min) * percentage) + options.min)
					
				Slider["3a"].Text = tostring(value)
				Slider["3e"].Size = UDim2.fromScale(percentage, 1)
				else
					Slider["3a"].Text = tostring(v)
					Slider["3e"].Size = UDim2.fromScale(((v - options.min) / (options.max - options.min)), 1)
				end
				options.callback(Slider:GetValue())
			end
			
			function Slider:GetValue()
				return tonumber(Slider["3a"].Text)
			end
			
			--Logic
			do
				Slider["35"].MouseEnter:Connect(function()
					Slider.Hover = true

					Library:Tween(Slider["37"], {Color = Color3.fromRGB(0, 59, 136)})
					Library:Tween(Slider["3d"], {Color = Color3.fromRGB(0, 59, 136)})
					Library:Tween(Slider["3e"], {BackgroundColor3 = Color3.fromRGB(184, 184, 184)})
				end)

				Slider["35"].MouseLeave:Connect(function()
					Slider.Hover = false

					if not Slider.MouseDown then
						Library:Tween(Slider["37"], {Color = Color3.fromRGB(118, 118, 118)})
						Library:Tween(Slider["3d"], {Color = Color3.fromRGB(118, 118, 118)})
						Library:Tween(Slider["3e"], {BackgroundColor3 = Color3.fromRGB(149, 149, 149)})
					end
				end)

				uis.InputBegan:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 and Slider.Hover then
						Slider.MouseDown = true
						Library:Tween(Slider["35"], {BackgroundColor3 = Color3.fromRGB(48, 48, 48)})
						Library:Tween(Slider["37"], {Color = Color3.fromRGB(200,200,200)})
						Library:Tween(Slider["3d"], {Color = Color3.fromRGB(200,200,200)})
						Library:Tween(Slider["3e"], {BackgroundColor3 = Color3.fromRGB(200, 200, 200)})
						if not Slider.Connection then
							Slider.Connection = RunService.RenderStepped:Connect(function()
								Slider:SetValue()
							end)
						end
					end
				end)


				uis.InputEnded:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Slider.MouseDown = false

						if Slider.Hover then
							Library:Tween(Slider["35"], {BackgroundColor3 = Color3.fromRGB(57,57,57)})
							Library:Tween(Slider["37"], {Color = Color3.fromRGB(103, 103, 103)})
							Library:Tween(Slider["3d"], {Color = Color3.fromRGB(103, 103, 103)})
							Library:Tween(Slider["3e"], {BackgroundColor3 = Color3.fromRGB(103, 103, 103)})
						else
							Library:Tween(Slider["35"], {BackgroundColor3 = Color3.fromRGB(57,57,57)})
							Library:Tween(Slider["37"], {Color = Color3.fromRGB(82, 82, 82)})
							Library:Tween(Slider["3d"], {Color = Color3.fromRGB(82, 82, 82)})
							Library:Tween(Slider["3e"], {BackgroundColor3 = Color3.fromRGB(62, 62, 62)})
						end
						
						if Slider.Connection then Slider.Connection:Disconnect() end
						Slider.Connection = nil
					end
				end)
			end
			
		end
		
		return Tab
	end
	dragify(GUI["2"])
	return GUI
end
