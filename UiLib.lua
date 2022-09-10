--The Hub Has been created By Hold
--Bug Fixes And More Features: DasMerciful
local Library = {}
local CoreGui = game:GetService("CoreGui")
local TS = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local mouse = game.Players.LocalPlayer:GetMouse()
do
	if CoreGui:FindFirstChild("Hub") then
		CoreGui:FindFirstChild("Hub"):Destroy()
	end
end
function Library:Create(hubname, gamename, presetColor)

	local Hub = Instance.new("ScreenGui")
  Hub.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	local MainFrame = Instance.new("Frame")
	local TabHolder = Instance.new("ScrollingFrame")
	local UICorner = Instance.new("UICorner")

	local UIListLayout = Instance.new("UIListLayout")
	local UICorner_4 = Instance.new("UICorner")
	local CloseButton = Instance.new("ImageButton")
	local Hubname = Instance.new("TextLabel")
	local Gamename = Instance.new("TextLabel")
	local Pages = Instance.new("Folder")

	Hub.Name = "Hub"
	Hub.Parent = CoreGui

	MainFrame.Name = "MainFrame"
	MainFrame.Parent = Hub
	MainFrame.Active = true
	MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	MainFrame.BorderSizePixel = 0
	MainFrame.Draggable = true
	MainFrame.Position = UDim2.new(0.407627165, -269, 0.602050781, -175)
	MainFrame.Size = UDim2.new(0, 638, 0, 324)

	TabHolder.Name = "TabHolder"
	TabHolder.Parent = MainFrame
	TabHolder.Active = true
	TabHolder.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
	TabHolder.BorderSizePixel = 0
	TabHolder.Position = UDim2.new(0.015673982, 0, 0.163090676, 0)
	TabHolder.Size = UDim2.new(0, 147, 0, 253)
	TabHolder.CanvasSize = UDim2.new(0, 0, 0.600000024, 110)
	TabHolder.ScrollBarThickness = 2
	UICorner.Parent = TabHolder

	UIListLayout.Parent = TabHolder
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 4)
    TabHolder.CanvasSize = TabHolder.CanvasSize + UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y)
	UICorner_4.CornerRadius = UDim.new(0, 5)
	UICorner_4.Parent = MainFrame

	CloseButton.Name = "CloseButton"
	CloseButton.Parent = MainFrame
	CloseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	CloseButton.BackgroundTransparency = 1.000
	CloseButton.BorderSizePixel = 0
	CloseButton.Position = UDim2.new(0.949843228, 0, 0.016091954, 0)
	CloseButton.Size = UDim2.new(0, 25, 0, 25)
	CloseButton.Image = "rbxassetid://6236220207"

	Hubname.Name = "Hubname"
	Hubname.Parent = MainFrame
	Hubname.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Hubname.BackgroundTransparency = 1.000
	Hubname.BorderSizePixel = 0
	Hubname.Position = UDim2.new(0.015673982, 0, 0, 0)
	Hubname.Size = UDim2.new(0, 255, 0, 32)
	Hubname.Font = Enum.Font.SourceSansLight
	
	Hubname.Text = hubname or "Hub-name"
	Hubname.TextColor3 = Color3.fromRGB(255, 255, 255)
	Hubname.TextSize = 28.000
	Hubname.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
	Hubname.TextStrokeTransparency = 0.740
	Hubname.TextXAlignment = Enum.TextXAlignment.Left

	Gamename.Name = "Gamename"
	Gamename.Parent = MainFrame
	Gamename.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Gamename.BackgroundTransparency = 1.000
	Gamename.BorderSizePixel = 0
	Gamename.Position = UDim2.new(0.015673982, 0, 0.0734795034, 0)
	Gamename.Size = UDim2.new(0, 235, 0, 22)
	Gamename.Font = Enum.Font.SourceSansLight
	Gamename.Text = gamename or "Game-name"
	Gamename.TextColor3 = Color3.fromRGB(209, 209, 209)
	Gamename.TextSize = 16.000
	Gamename.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
	Gamename.TextStrokeTransparency = 0.900
	Gamename.TextXAlignment = Enum.TextXAlignment.Left
	

	CloseButton.MouseButton1Click:connect(function() Hub:Destroy() end)

	Pages.Name = "Pages"
	Pages.Parent = MainFrame

	local Win = {}

	function Win:Page(pagename, default)

		local Page = Instance.new("ScrollingFrame")
		local UICorner_5 = Instance.new("UICorner")
		local PageButton = Instance.new("TextButton")
		local UICorner_2 = Instance.new("UICorner")
		local UIListLayout_2 = Instance.new("UIListLayout")

		
		PageButton.Name = "PageButton"
		PageButton.Parent = TabHolder
		PageButton.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
		PageButton.BorderSizePixel = 0
		PageButton.Position = UDim2.new(0.0408163257, 0, 0.0355731212, 0)
		PageButton.Size = UDim2.new(0, 135, 0, 30)
		PageButton.AutoButtonColor = false
		PageButton.Font = Enum.Font.SourceSansLight
		PageButton.Text = pagename or "Page"
		PageButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		PageButton.TextSize = 22.000
		PageButton.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
		PageButton.TextStrokeTransparency = 0.960
		UICorner_2.Parent = PageButton
		
    
		PageButton.MouseButton1Click:Connect(function()
			for i, v in pairs(Pages:GetChildren()) do
				v.Visible = false
			end
			Page.Visible = true
		end)
		Page.Visible = true
		PageButton.TextTransparency = 0
		Page.Name = pagename or "Page"
		Page.Parent = Pages
		Page.Active = true
		--Page.Visible = false
		Page.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
		Page.BorderSizePixel = 0
		Page.Position = UDim2.new(0.260188043, 0, 0.163090736, 0)
		Page.Size = UDim2.new(0, 465, 0, 253)
		Page.CanvasSize = UDim2.new(0, 0, 0.600000024, 142)
		Page.ScrollBarThickness = 2
    
		if default == true then
			Page.Visible = true
		end
		if default == false then
			Page.Visible = false
		end

		UIListLayout_2.Parent = Page
		UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_2.Padding = UDim.new(0, 6)
        Page.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_2.AbsoluteContentSize.Y)
		UICorner_5.Parent = Page

		local PageItems = {} 

		function PageItems:Button(buttonname, callback)

			local callback = callback or function() end

			local Button = Instance.new("Frame")
			local TextButton = Instance.new("TextButton")
			local UICorner_6 = Instance.new("UICorner")

			Button.Name = "Button"
			Button.Parent = Page
			Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Button.BackgroundTransparency = 1.000
			Button.BorderSizePixel = 0
			Button.Size = UDim2.new(0, 465, 0, 46)

			TextButton.Parent = Button
			TextButton.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
			TextButton.BorderSizePixel = 0
			TextButton.Size = UDim2.new(0, 465, 0, 46)
			TextButton.Font = Enum.Font.SourceSans
			TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextButton.TextSize = 18.000
			TextButton.Text = buttonname or "Button"

			UICorner_6.Parent = TextButton

			TextButton.MouseButton1Click:Connect(function()
				pcall(callback)
			end)

			Page.CanvasSize = Page.CanvasSize + UDim2.new(0,0,0,UIListLayout_2.AbsoluteContentSize.Y)

		end

		function PageItems:Toggle(togglename, callback)

			local callback = callback or function() end

			local Toggle = Instance.new("Frame")
			local TextLabel_2 = Instance.new("TextLabel")
			local UICorner_8 = Instance.new("UICorner")
			local TextButton_2 = Instance.new("TextButton")
			local TextButton_Roundify_8px = Instance.new("ImageLabel")
			local TextButton_3 = Instance.new("TextButton")
			local TextButton_Roundify_8px_2 = Instance.new("ImageLabel")
			local ToggleFire = Instance.new("TextButton")

			Toggle.Name = "Toggle"
			Toggle.Parent = Page
			Toggle.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
			Toggle.BorderSizePixel = 0
			Toggle.Size = UDim2.new(0, 465, 0, 44)

			TextLabel_2.Parent = Toggle
			TextLabel_2.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
			TextLabel_2.BorderSizePixel = 0
			TextLabel_2.Position = UDim2.new(0.0430107526, 0, 0, 0)
			TextLabel_2.Size = UDim2.new(0, 354, 0, 44)
			TextLabel_2.Font = Enum.Font.SourceSans
			TextLabel_2.Text = togglename or "Toggle"
			TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel_2.TextSize = 18.000
			TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left

			UICorner_8.Parent = Toggle

			TextButton_2.Parent = Toggle
			TextButton_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextButton_2.BackgroundTransparency = 1.000
			TextButton_2.BorderSizePixel = 0
			TextButton_2.Position = UDim2.new(0.374193549, 0, 0.363636374, 0)
			TextButton_2.Size = UDim2.new(0, 200, 0, 50)
			TextButton_2.Font = Enum.Font.SourceSans
			TextButton_2.Text = ""
			TextButton_2.TextColor3 = Color3.fromRGB(0, 0, 0)
			TextButton_2.TextSize = 14.000

			TextButton_Roundify_8px.Name = "TextButton_Roundify_8px"
			TextButton_Roundify_8px.Parent = TextButton_2
			TextButton_Roundify_8px.Active = true
			TextButton_Roundify_8px.AnchorPoint = Vector2.new(0.5, 0.5)
			TextButton_Roundify_8px.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextButton_Roundify_8px.BackgroundTransparency = 1.000
			TextButton_Roundify_8px.Position = UDim2.new(1.27250004, 0, 0.109999999, 0)
			TextButton_Roundify_8px.Selectable = true
			TextButton_Roundify_8px.Size = UDim2.new(0.264999986, 0, 0.5, 0)
			TextButton_Roundify_8px.Image = "rbxassetid://3570695787"
			TextButton_Roundify_8px.ImageColor3 = Color3.fromRGB(27, 27, 27)
			TextButton_Roundify_8px.ScaleType = Enum.ScaleType.Slice
			TextButton_Roundify_8px.SliceCenter = Rect.new(100, 100, 100, 100)
			TextButton_Roundify_8px.SliceScale = 0.667

			ToggleFire.Name = "ToggleFire"
			ToggleFire.Parent = Toggle
			ToggleFire.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ToggleFire.BackgroundTransparency = 1.000
			ToggleFire.Size = UDim2.new(0, 464, 0, 44)
			ToggleFire.Font = Enum.Font.SourceSans
			ToggleFire.Text = ""
			ToggleFire.TextColor3 = Color3.fromRGB(0, 0, 0)
			ToggleFire.TextSize = 14.000

			TextButton_3.Parent = TextButton_Roundify_8px
			TextButton_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextButton_3.BackgroundTransparency = 1.000
			TextButton_3.BorderSizePixel = 0
			TextButton_3.Position = UDim2.new(0.490566254, 0, 0.280000091, 0)
			TextButton_3.Size = UDim2.new(0, 20, 0, 21)
			TextButton_3.Font = Enum.Font.SourceSans
			TextButton_3.Text = ""
			TextButton_3.TextColor3 = Color3.fromRGB(0, 0, 0)
			TextButton_3.TextSize = 14.000

			TextButton_Roundify_8px_2.Name = "TextButton_Roundify_8px"
			TextButton_Roundify_8px_2.Parent = TextButton_3
			TextButton_Roundify_8px_2.Active = true
			TextButton_Roundify_8px_2.AnchorPoint = Vector2.new(0.5, 0.5)
			TextButton_Roundify_8px_2.BackgroundColor3 = Color3.fromRGB(148, 148, 148)
			TextButton_Roundify_8px_2.BackgroundTransparency = 1.000
			TextButton_Roundify_8px_2.Position = UDim2.new(-0.649999976, 0, 0.285714298, 0)
			TextButton_Roundify_8px_2.Selectable = true
			TextButton_Roundify_8px_2.Size = UDim2.new(0.699999988, 0, 0.666666687, 0)
			TextButton_Roundify_8px_2.Image = "rbxassetid://3570695787"
			TextButton_Roundify_8px_2.ScaleType = Enum.ScaleType.Slice
			TextButton_Roundify_8px_2.SliceCenter = Rect.new(100, 100, 100, 100)
			TextButton_Roundify_8px_2.SliceScale = 0.667

			local toggled = false

			ToggleFire.MouseButton1Down:Connect(function()

				if toggled == false then

					TS:Create(TextButton_Roundify_8px_2, TweenInfo.new(0.2), {Position = UDim2.new(0.65, 0,0.286, 0)}):Play()
					TS:Create(TextButton_Roundify_8px, TweenInfo.new(0.2), {ImageColor3 = presetColor}):Play()

				else

					TS:Create(TextButton_Roundify_8px_2, TweenInfo.new(0.2), {Position = UDim2.new(-0.65, 0, 0.286, 0)}):Play()
					TS:Create(TextButton_Roundify_8px, TweenInfo.new(0.2), {ImageColor3 = Color3.fromRGB(27, 27, 27)}):Play()

				end

				toggled = not toggled
				pcall(callback, toggled)

			end)

			Page.CanvasSize = Page.CanvasSize + UDim2.new(0,0,0,UIListLayout_2.AbsoluteContentSize.Y)

		end

		function PageItems:Section(SecName)
			local SectionLabel = Instance.new("TextLabel")
			local UICorner_6 = Instance.new("UICorner")
			local UITextSizeConstraint = Instance.new("UITextSizeConstraint")

			SectionLabel.Name = "Section"
			SectionLabel.Parent = Page
			SectionLabel.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
			SectionLabel.BorderSizePixel = 0
			SectionLabel.Size = UDim2.new(0, 465, 0, 46)
			SectionLabel.Font = Enum.Font.SourceSans
			SectionLabel.TextWrapped = true
			SectionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			SectionLabel.TextSize = 18.000
			SectionLabel.Text = SecName
			UICorner_6.Parent = SectionLabel
			UITextSizeConstraint.Parent = SectionLabel
			UITextSizeConstraint.MaxTextSize = 18
            Page.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_2.AbsoluteContentSize.Y)
		end

		function PageItems:Slider(slidername, minvalue, maxvalue, callback)

			local callback = callback or function() end
			local Value

			local Slider = Instance.new("Frame")
			local TextLabel_5 = Instance.new("TextLabel")
			local UICorner_11 = Instance.new("UICorner")
			local TextLabel_6 = Instance.new("TextLabel")
			local OuterSlider = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local InnerSlider = Instance.new("Frame")
			local UICorner_2 = Instance.new("UICorner")
			local SliderFire = Instance.new("TextButton")

			Slider.Name = "Slider"
			Slider.Parent = Page
			Slider.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
			Slider.BorderSizePixel = 0
			Slider.Size = UDim2.new(0, 465, 0, 44)

			TextLabel_5.Parent = Slider
			TextLabel_5.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
			TextLabel_5.BorderSizePixel = 0
			TextLabel_5.Position = UDim2.new(0.0430107526, 0, 0, 0)
			TextLabel_5.Size = UDim2.new(0, 354, 0, 25)
			TextLabel_5.Font = Enum.Font.SourceSans
			TextLabel_5.Text = slidername or "Slider"
			TextLabel_5.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel_5.TextSize = 18.000
			TextLabel_5.TextXAlignment = Enum.TextXAlignment.Left

			UICorner_11.Parent = Slider

			TextLabel_6.Parent = Slider
			TextLabel_6.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
			TextLabel_6.BorderSizePixel = 0
			TextLabel_6.Position = UDim2.new(0.752688169, 0, 0, 0)
			TextLabel_6.Size = UDim2.new(0, 98, 0, 25)
			TextLabel_6.Font = Enum.Font.SourceSans
			TextLabel_6.Text = minvalue or "0"
			TextLabel_6.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel_6.TextSize = 18.000
			TextLabel_6.TextXAlignment = Enum.TextXAlignment.Right

			OuterSlider.Name = "OuterSlider"
			OuterSlider.Parent = Slider
			OuterSlider.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
			OuterSlider.Position = UDim2.new(0.0215053763, 0, 0.568181813, 0)
			OuterSlider.Size = UDim2.new(0, 444, 0, 9)

			UICorner.Parent = OuterSlider

			InnerSlider.Name = "InnerSlider"
			InnerSlider.Parent = OuterSlider
			InnerSlider.BackgroundColor3 = presetColor
			InnerSlider.Size = UDim2.new(0, 0, 0, 9)
			InnerSlider.BorderSizePixel = 0

			UICorner_2.Parent = InnerSlider

			SliderFire.Name = "SliderFire"
			SliderFire.Parent = OuterSlider
			SliderFire.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SliderFire.BackgroundTransparency = 1.000
			SliderFire.Size = UDim2.new(0, 444, 0, 9)
			SliderFire.Font = Enum.Font.SourceSans
			SliderFire.Text = ""
			SliderFire.TextColor3 = Color3.fromRGB(0, 0, 0)
			SliderFire.TextSize = 14.000

			SliderFire.MouseButton1Down:Connect(function()
				Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 444) *InnerSlider.AbsoluteSize.X) + tonumber(minvalue)) or 0
				pcall(function()
					callback(Value)
				end)
				InnerSlider.Size = UDim2.new(0, math.clamp(mouse.X -InnerSlider.AbsolutePosition.X, 0, 444), 0, 9)
				moveconnection = mouse.Move:Connect(function()
					TextLabel_6.Text = Value
					Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 444) *InnerSlider.AbsoluteSize.X) + tonumber(minvalue))
					pcall(function()
						callback(Value)
					end)
					InnerSlider.Size = UDim2.new(0, math.clamp(mouse.X -InnerSlider.AbsolutePosition.X, 0, 444), 0, 9)
				end)
				releaseconnection = UIS.InputEnded:Connect(function(Mouse)
					if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
						Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 444) *InnerSlider.AbsoluteSize.X) + tonumber(minvalue))
						TextLabel_6.Text = Value						
						pcall(function()
							callback(Value)
						end)
						InnerSlider.Size = UDim2.new(0, math.clamp(mouse.X -InnerSlider.AbsolutePosition.X, 0, 444), 0, 9)
						moveconnection:Disconnect()
						releaseconnection:Disconnect()
					end
				end)
			end)

			Page.CanvasSize = Page.CanvasSize + UDim2.new(0,0,0,UIListLayout_2.AbsoluteContentSize.Y)

		end

		function PageItems:Dropdown(dropdownname, itemlist, callback)

			local callback = callback or function() end
			
			local itemnumber = 0
			local pagesize = 0
			local dropopened = false
			
			local Dropdown = Instance.new("Frame")
			local Dropname = Instance.new("TextLabel")
			local FireButton = Instance.new("TextButton")
			local UICorner = Instance.new("UICorner")
			local UICorner_2 = Instance.new("UICorner")
			local UICorner_3 = Instance.new("UICorner")
			local UIListLayout = Instance.new("UIListLayout")
			local UICorner_4 = Instance.new("UICorner")
			
			Dropdown.Name = "Dropdown"
			Dropdown.Parent = Page
			Dropdown.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
			Dropdown.BorderSizePixel = 0
			Dropdown.ClipsDescendants = true
			Dropdown.Size = UDim2.new(0, 465, 0, 37)

			Dropname.Name = "Dropname"
			Dropname.Parent = Dropdown
			Dropname.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
			Dropname.BorderSizePixel = 0
			Dropname.Position = UDim2.new(0.0107526882, 0, 0, 0)
			Dropname.Size = UDim2.new(0, 455, 0, 38)
			Dropname.Font = Enum.Font.SourceSans
			Dropname.Text = "Dropdown - Nil"
			Dropname.TextColor3 = Color3.fromRGB(255, 255, 255)
			Dropname.TextSize = 18.000
			Dropname.TextXAlignment = Enum.TextXAlignment.Left

			FireButton.Name = "FireButton"
			FireButton.Parent = Dropname
			FireButton.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
			FireButton.BackgroundTransparency = 0.450
			FireButton.BorderSizePixel = 0
			FireButton.Position = UDim2.new(0.830215156, 0, 0.250504941, 0)
			FireButton.Size = UDim2.new(0, 71, 0, 21)
			FireButton.Font = Enum.Font.SourceSans
			FireButton.Text = "Open"
			FireButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			FireButton.TextSize = 14.000
			
			UICorner.CornerRadius = UDim.new(0, 4)
			UICorner.Parent = FireButton

			UICorner_2.Parent = Dropname

			UICorner_3.Parent = Dropdown

			UIListLayout.Parent = Dropdown
			UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			UIListLayout.Padding = UDim.new(0, 2)
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			
			for i,v in next, itemlist do
				
				itemnumber = itemnumber + 1
				
				pagesize = pagesize + 30
				
				local Item = Instance.new("TextButton")
				Item.Name = "Item"
				Item.Parent = Dropdown
				Item.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
				Item.BorderColor3 = Color3.fromRGB(21, 21, 21)
				Item.BorderSizePixel = 0
				Item.Position = UDim2.new(-0.0516129062, 0, -0.118346259, 0)
				Item.Size = UDim2.new(0, 456, 0, 25)
				Item.Font = Enum.Font.SourceSans
				Item.Text = v or "item"
				Item.TextColor3 = Color3.fromRGB(231, 231, 231)
				Item.TextSize = 14.000

				UICorner_4.Parent = Item
				
				
				Item.MouseButton1Click:Connect(function()
					Dropdown.Size = UDim2.new(0, 465, 0, 37)
					Dropname.Text = dropdownname.." - ".. v
					
					pcall(callback, v)
					dropopened = false
				end)
			end
			
			FireButton.MouseButton1Click:Connect(function()
				if dropopened then
					Dropdown.Size = UDim2.new(0, 465, 0, 37)
					
				else
					Dropdown.Size = UDim2.new(0, 465, 0, 37 + pagesize)
					
				end
				dropopened = not dropopened
			end)
		end
		
		return PageItems

	end

	return Win

end

return Library
