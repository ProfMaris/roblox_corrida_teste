
local parte = game.Workspace:WaitForChild("Bloco")

-- Obtém o Baseplate
local baseplate = game.Workspace.Baseplate

-- Define os limites da área de movimento
local limiteMinX = baseplate.Position.X - baseplate.Size.X/2 + baseplate.Size.X * 0.15
local limiteMaxX = baseplate.Position.X + baseplate.Size.X/2 - baseplate.Size.X * 0.15
local limiteMinZ = baseplate.Position.Z - baseplate.Size.Z/2 + baseplate.Size.Z * 0.15
local limiteMaxZ = baseplate.Position.Z + baseplate.Size.Z/2 - baseplate.Size.Z * 0.15

-- Define os limites da altura
local limiteMinY = 5 -- Altura mínima desejada
local limiteMaxY = 20 -- Altura máxima desejada

-- Função para gerar um número aleatório dentro de um intervalo
local function numeroAleatorio(min, max)
	return math.random() * (max - min) + min
end

-- Função para verificar se a parte está acima de outras partes
local function estaAcimaDasPartes(posicao)
	local partesNoLocal = workspace:FindPartsInRegion3(Region3.new(posicao, posicao), parte, math.huge)
	return #partesNoLocal == 0
end

-- Função para mover a parte aleatoriamente
local function moverParteAleatoriamente()
	local novaPosicao
	repeat
		novaPosicao = Vector3.new(
			numeroAleatorio(limiteMinX, limiteMaxX),
			numeroAleatorio(limiteMinY, limiteMaxY),
			numeroAleatorio(limiteMinZ, limiteMaxZ)
		)
	until estaAcimaDasPartes(novaPosicao)

	parte.Position = novaPosicao
end

-- Loop para mover a parte continuamente
while true do
	moverParteAleatoriamente()
	wait(1) -- Altere o valor do "wait" para definir o intervalo entre cada movimento
end
