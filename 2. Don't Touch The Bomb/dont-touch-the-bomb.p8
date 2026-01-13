pico-8 cartridge // http://www.pico-8.com
version 43
__lua__
function _init() menu_init()
end

function menu_init()
	_update = menu_update
	_draw = menu_draw
	game_over=false
	time_up=false
	detonated=false
end

function menu_update()
	if (btnp(❎)) clock_init()
end

function menu_draw()
 cls(12)
 print("welcome",44,54,7)
 print("please do not let the game",10,64,7)
 print("explode",44,74,7)
 print("press ❎ to begin",24,84,8)
end


-->8
function clock_init()
	_update=clock_update
	_draw=clock_draw
end

function clock_update()
	if (not game_over) then
		run_t=time()
		countdown = 100-run_t
		time()
		bomb()
	else
		gameover_init()
	end
end

function clock_draw()
	cls(12)
	print("time left:", 50,54,7)
	print(countdown ,54,64,0)
	print("press ❎: detonate",34,74,8)
	
end

function bomb()
	if (countdown<=0) then
		time_up=true
		detonated=false
		game_over=true
	elseif (countdown>0 and btnp(❎)) then
		time_up=false
		detonated=true
		game_over=true
	end
end
-->8
function gameover_init()
	_update=gameover_update
	_draw=gameover_draw
end

function gameover_update()
	if (btnp(❎)) menu_init()
end

function gameover_draw()
	if (time_up) then
		cls(12)
		print("too bad!",54,64,7)
		print("x     try again?",34,74,8)
	elseif (detonated) then
		cls(8)
		print("what is your problem?",24,44,0)
		print("seriously",54,54,0)
		print("the instructions couldn't have",4,64,0)
		print("been more simple",44,74,0)
		print("❎     don't mess up this time",0,84,12)
	end
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
