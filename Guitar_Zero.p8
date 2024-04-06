pico-8 cartridge // http://www.pico-8.com
version 38
__lua__
--general  

timer = 0.7
eccart = 1
timermax = 120*eccart
combo = 0

parts={}

--btn sprites
local redspr
local bluspr
local grespr
local yelspr
 
 --musique
 
music(0)


function _init()


clock = flr((time()))

 --notes_r_spawn = {1,0,0,0,0,1,0,0,0}
	notes_r = {}
 notes_b = {}
 notes_g = {}
 notes_y = {}
 
 explosions_r = {}
 explosions_b = {}
 explosions_g = {}
 explosions_y = {}


 
end

function _update60()

--timing de spawn

 timer += 1
 if timer >= 120 then 
     timer = 0
   
--spawn notes  
    
--red
 	 note_r = {
 	 x = 20,
 	 y = -14,
 	 }
 	  	  	 
--blue
 	 note_b = {
 	 x = 44,
 	 y =-14,
 	 }

--green
			note_g = {
 	 x = 68,
 	 y =-14,
 	 }

--yellow
   note_y = {
 	 x = 92,
 	 y =-14,
 	 }
 	 
	 arrow = flr(rnd(4))
  if (arrow == 0)	add(notes_r, note_r)
 	if (arrow == 1)	add(notes_b, note_b)
 	if (arrow == 2)	add(notes_g, note_g)
 	if (arrow == 3)	add(notes_y, note_y)
 --	if (flr(rnd(2))==0)  add(notes_r, note_r)
 --	if (flr(rnd(2))==0)  add(notes_b, note_b)
 --	if (flr(rnd(2))==0)  add(notes_g, note_g)
 --	if (flr(rnd(2))==0)  add(notes_y, note_y)

 
 
 end 
 	
 	
--vitesse defilement
 	
 for nr in all(notes_r) do
	nr.y+=1.7
	end
		
 for nb in all(notes_b) do
	nb.y+=1.7
	end
	
	for ng in all(notes_g) do
	ng.y+=1.7
	end
	
	for ny in all(notes_y) do
	 ny.y+=1.7
	end
	
	btn_animation()
	btn_press()
 update_explosions_r()
 update_explosions_b()
 update_explosions_g()
 update_explosions_y()

	
end


function _draw() 
 cls()
 --print("frame")
 --print(flr(timer))
 print("time")
 print(flr((time())))
 print("combo",9)
 print(flr(combo))
 map(0,0,0,0,16,16)
 
 --boutons
 
 spr (redspr,20,96,2,2)--rouge
 spr (bluspr,44,96,2,2)--bleu
 spr (grespr,68,96,2,2)--vert
 spr (yelspr,92,96,2,2)--jaune
 
        --notes
 create_explosion_r(x,y)
 create_explosion_b(x,y) 
 create_explosion_g(x,y) 
 create_explosion_y(x,y) 
 

--red
  
 for nr in all (notes_r) do 
  spr(74,nr.x,nr.y,2,2)
  if (btnp(⬅️) and 90<=nr.y and nr.y<=100) then
    draw_explosions_red()
    del (notes_r, nr)
    sfx(0)
    combo+=1
  end
  if (nr.y > 128) then
  	combo=0
  	del (notes_r, nr)
  end
 end
 
 
--blue
 
 for nb in all (notes_b) do
 spr(76,nb.x,nb.y,2,2)
  if (btnp(⬆️) and 90<=nb.y and nb.y<=100) then
   draw_explosions_blue()
   del (notes_b, nb)
   sfx(0)
   combo+=1
  end
  if (nb.y > 128) then
  	combo=0
  	del (notes_b, nb)
  end
 end
 
--green
 
 for ng in all (notes_g) do
 spr(106,ng.x,ng.y,2,2)
  if (btnp(⬇️) and 90<=ng.y and ng.y<=100) then
   draw_explosions_green()
   del (notes_g, ng)
   sfx(0)
   combo+=1
  end
  if (ng.y > 128) then
  	combo=0
  	del (notes_g, ng)
  end
 end
 
--yellow
  
 for ny in all (notes_y) do
 spr(108,ny.x,ny.y,2,2)
  if (btnp(➡️) and 90<=ny.y and ny.y<=100) then
   draw_explosions_yellow()
   del (notes_y, ny)
   sfx(0)
   combo+=1
  end
  if (ny.y > 128) then
  	combo=0
  	del (notes_y, ny)
  end
 end
end
 
-->8
--button animation 

--animate red button
function btn_animation()
	if timer >= 60 then 
	 redspr = 10
	end
	if timer <= 60 then
	 redspr = 8
	end
	
	--animate blue button

	if timer >= 60 then 
	 bluspr = 14
	end
	if timer <= 60 then
	 bluspr = 12
	end
	
	--animate green button

	if timer >= 60 then 
	 grespr = 46
	end
	if timer <= 60 then
	 grespr = 44
	end
	
	--animate yellow button

	if timer >= 60 then 
	 yelspr = 42
	end
	if timer <= 60 then
	 yelspr = 40
	end
end
	
function btn_press()
	if btn(⬅️) then 
	 redspr = 64
	end
	if btn(⬆️) then 
	 bluspr = 66
	end
	if btn(⬇️) then 
	 grespr = 96
	end
	if btn(➡️) then 
	 yelspr = 98
 end
end
-->8
--explosions 

function create_explosion_r(x,y)
	add(explosions_r,{
	 x = x,
	 y = y,
	 timer = 0
	})
	 sfx(7)
end

function create_explosion_b(x,y)
	add(explosions_b,{
	 x = x,
	 y = y,
	 timer = 0
	})
	 sfx(7)
end

function create_explosion_g(x,y)
	add(explosions_g,{
	 x = x,
	 y = y,
	 timer = 0
	})
	 sfx(7)
end

function create_explosion_y(x,y)
	add(explosions_y,{
	 x = x,
	 y = y,
	 timer = 0
	})
	 sfx(7)
end

     --update

function update_explosions_r()
	for boom_r in all(explosions_r) do
		boom_r.timer +=1 
		if boom_r.timer == 100 then 
			del(explosions_r, boom_r)
		end
	end
end

function update_explosions_b()
	for boom_b in all(explosions_b) do
		boom_b.timer +=1 
		if boom_b.timer == 100 then 
			del(explosions_b, boom_b)
		end
	end
end

function update_explosions_g()
	for boom_g in all(explosions_g) do
		boom_g.timer +=1 
		if boom_g.timer == 100 then 
			del(explosions_g, boom_g)
		end
	end
end

function update_explosions_y()
	for boom_y in all(explosions_y) do
		boom_y.timer +=1 
		if boom_y.timer == 25 then 
			del(explosions_y, boom_y)
		end
	end
end


							--draw
							
function draw_explosions_red()
	for boom_r in all(explosions_r) do 
		circ(28,96,boom_r.timer%25,8)
	end
end
	
	function draw_explosions_blue()
	for boom_b in all(explosions_b) do 
		circ(52,96,boom_b.timer%25,12)
	end
end
	
	function draw_explosions_green()
	for boom_g in all(explosions_g) do 
		circ(75,96,boom_g.timer%25,11)
	end
end
	
	function draw_explosions_yellow()
	for boom_y in all(explosions_y) do 
		circ(100,96,boom_y.timer%25,10)
	end
end
	
__gfx__
00000000000000000000000000000000000000007000000000000000000000000000088888800000000000000000000000000cccccc000000000000000000000
000000000000000000000000000000000000000070000000000000000000000000088888888880000000088888800000000cccccccccc00000000cccccc00000
00000000000000000000000000000000000000007000000000000000000000000088888888888800000888888888800000cccccccccccc00000cccccccccc000
0000000000000000000000000000000000000000700000000000000000000000088888888866688000888888888888000ccccccccc666cc000cccccccccccc00
0000000000000000000000000000000000000000d00000000000000000000000088888888867688000888888888888000ccccccccc676cc000cccccccccccc00
0000000000000000000000000000000000000000d0000000000000000000000088888888867766880888888888868880ccccccccc67766cc0cccccccccc6ccc0
0000000000000000000000000000000000000000d0000000000000000000000088888888867776880888888888676880ccccccccc67776cc0ccccccccc676cc0
0000000000000000000000000000000000000000d0000000000000000000000088888888867776880888888888676880ccccccccc67776cc0ccccccccc676cc0
000000000000000000000000000000000000000000000000000000000000000088888888866776880888888888676880ccccccccc66776cc0ccccccccc676cc0
000000000000000000000000000000000000000000000000000000000000000088888888886768880888888888868880cccccccccc676ccc0cccccccccc6ccc0
000000000000000000000000000000000000000000000000000000000000000088888888886668880888888888888880cccccccccc666ccc0cccccccccccccc0
000000000000000000000000000000000000000000000000000000000000000008868888888888800d886888888888d00cc6ccccccccccc00dcc6cccccccccd0
000000000000000000000000000000000000000000000000000000000000000008866888888888800d886688888888d00cc66cccccccccc00dcc66ccccccccd0
00000000000000000000000000000000000000000000000000000000000000000d888668888888d000d8888888888d000dccc66ccccccc0000dccccccccccd00
000000000000000000000000000000000000000000000000000000000000000000dd88888888dd00000dd888888dd00000ddccccccccdd00000ddccccccdd000
00000000000000000000000000000000000000000000000000000000000000000000dddddddd000000000dddddd000000000dddddddd000000000dddddd00000
0000000000000000000000000000000000000a09000000aa000000000000000000000aaaaaa00000000000000000000000000bbbbbb000000000000000000000
00000000000000000000000000000000000990099900aa000000000000000000000aaaaaaaaaa00000000aaaaaa00000000bbbbbbbbbb00000000bbbbbb00000
00000000000000000000000000000000000099099900a000000000000000000000aaaaaaaaaaaa00000aaaaaaaaaa00000bbbbbbbbbbbb00000bbbbbbbbbb000
000000000000000000000000000000000aaa6990990aa00000000000000000000aaaaaaaaa666aa000aaaaaaaaaaaa000bbbbbbbbbbbbbb000bbbbbbbbbbbb00
0000000000000000000000000000000000aaaa00090a999900000000000000000aaaaaaaaa676aa000aaaaaaaaaaaa000bbbbbbbbbb66bb000bbbbbbbbbbbb00
0000000000000000000000000000000000000000000a00000000000000000000aaaaaaaaa67766aa0aaaaaaaaaa6aaa0bbbbbbbbbb6766bb0bbbbbbbbbb6bbb0
000000000000000000000000000000000aaa0000099000000000000000000000aaaaaaaaa67776aa0aaaaaaaaa676aa0bbbbbbbbbb6776bb0bbbbbbbbb676bb0
000000000000000000000000000000000000990000999aa00000000000000000aaaaaaaaa67776aa0aaaaaaaaa676aa0bbbbbbbbbb6776bb0bbbbbbbbb676bb0
0000000000000000000000000000000009999000090099000000000000000000aaaaaaaaa66776aa0aaaaaaaaa676aa0bbbbbbbbbb6776bb0bbbbbbbbb676bb0
00000000000000000000000000000000aa099000a90999000000000000000000aaaaaaaaaa676aaa0aaaaaaaaaa6aaa0bbbbbbbbbb6676bb0bbbbbbbbbb6bbb0
000000000000000000000000000000000090099aa9a090990000000000000000aaaaaaaaaa666aaa0aaaaaaaaaaaaaa0bbbbbbbbbbb66bbb0bbbbbbbbbbbbbb0
00000000000000000000000000000000009999aa99a0990000000000000000000aa6aaaaaaaaaaa00daa6aaaaaaaaad00bb6bbbbbbbbbbb00dbb6bbbbbbbbbd0
00000000000000000000000000000000009909a999a0099000000000000000000aa66aaaaaaaaaa00daa66aaaaaaaad00bb66bbbbbbbbbb00dbb66bbbbbbbbd0
000000000000000000000000000000000a000aa099a0009000000000000000000daaa66aaaaaaad000daaaaaaaaaad000dbbb66bbbbbbbd000dbbbbbbbbbbd00
000000000000000000000000000000000000a0a000000000000000000000000000ddaaaaaaaadd00000ddaaaaaadd00000ddbbbbbbbbdd00000ddbbbbbbdd000
00000000000000000000000000000000000aa0000000000000000000000000000000dddddddd000000000dddddd000000000dddddddd000000000dddddd00000
000000000000000000000000000000000000000000000000000000000000000006666666666666660000000000000000000000000000000066777766d7777777
0000000000000000000000000000000000000000000000000000000000000000066666666666666600000000000000000000000ccd00000067666676d7777777
00008888888800000000cccccccc00000000666666666666666666666666600006666666666666660000008888000000000000ccccd0000076677667d7777777
0008888888888000000cccccccccc0000066bbbbbbbbbbbbbbbbbbbbbbbbb6600666666666666666000008888800000000000ccccccd000076777767d7777777
008888888888880000cccccccccccc000066bbbbbbbbbbbbbbbbbbbbbbbbb660066666666666666600008868880000000000cc6cccccd00076777767d7777777
08888888888888800cccccccccccccc00000666666666666666666666666600006666666666666660008868888000000000cc6cccccccd0076677667d7777777
8888888888866688ccccccccccc666cc000000000000000000000000000000000666666666666666008868888888888800cc6cccccccccd067666676d7777777
8888888888677768cccccccccc67776c000000000000000000000000000000000666666666666666088888888888888800cccccccccc6cd066777766d7777777
8888888888866688ccccccccccc666cc000000000000000000000000000000000666666666666666088888888888866800ccccccccc66cd00000000007777777
8888888888888888cccccccccccccccc0000000000000000000000000000000006666666666666660d8888888888888800cccccccccccc000000000007777777
08866888888888800cc66cccccccccc000006666666666666666666666666000066666666666666600d8888888ddddd0000000ccccd000000666666607777777
008868888888880000cc6ccccccccc00006633333333333333333333000006600666666666666666000d888868000000000000ccccd000000666666607777777
00d8888888888d0000dccccccccccd000066333333333333333333330000066006666666666666660000d88668000000000000ccccd000000666666607777777
000d88888888d000000dccccccccd00000006666666666666666666666666000044444444444444400000d8888000000000000cc6cd000000666666607777777
0000dddddddd00000000dddddddd0000000000000000000000000000000000000555555555555555000000ddd0000000000000cc6cd000000666666607777777
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000cccc0000000666666607777777
00000000000000000000000000000000000000000000000000000000000000000666666666666666000000bbbb000000000000000000000004fffffffffffff4
00000000000000000000000000000000000000000000000000000000000000000666666666666666000000bb6bd00000000000000000000004ffffffffffff44
0000bbbbbbbb00000000aaaaaaaa0000000066666666666666666666666660000666666666666666000000bb6bd00000000000aaaa000000044ffffffffff4f4
000bbbbbbbbbb000000aaaaaaaaaa000006699999999990000000000000006600666666666666666000000bbbbd00000000000aaaaa0000004f4ffffffff4ff4
00bbbbbbbbbbbb0000aaaaaaaaaaaa00006699999999990000000000000006600666666666666666000000bbbbd00000000000aaa6aa000004ff4ffffff4fff4
0bbbbbbbbbbbbbb00aaaaaaaaaaaaaa0000066666666666666666666666660000666666666666666000000bbbbd00000000000aaaa6aa00004fff4ffff4ffff4
bbbbbbbbbbb666bbaaaaaaaaaaa666aa00000000000000000000000000000000066666666666666600bbbbbbbbbbbb00aaaaaaaaaaa6aa0004ffff4ff4fffff4
bbbbbbbbbb67776baaaaaaaaaa67776a00000000000000000000000000000000066666666666666600bbbbbbbbb66bd0aaaaaaaaaaaaaaa004fffff44ffffff4
bbbbbbbbbbb666bbaaaaaaaaaaa666aa00000000000000000000000000000000000000007777777700bbbbbbbbbb6bd0a66aaaaaaaaaaaa04ffffffffffffff4
bbbbbbbbbbbbbbbbaaaaaaaaaaaaaaaa00000000000000000000000000000000000000007777777700bb6bbbbbbbbbd0aaaaaaaaaaaaaad0f4ffffffffffff4f
0bb66bbbbbbbbbb00aa66aaaaaaaaaa0000066666666666666666666666660000000000077777777000bb6bbbbbbbd000dddddaaaaaaad00ff4ffffffffff4ff
00bb6bbbbbbbbb0000aa6aaaaaaaaa000066888800000000000000000000066000000000777777770000bb6bbbbbd000000000a6aaaad000fff4ffffffff4fff
00dbbbbbbbbbbd0000daaaaaaaaaad0000668888000000000000000000000660000000007777777700000bbbbbbd0000000000a66aad0000ffff4ffffff4ffff
000dbbbbbbbbd000000daaaaaaaad000000066666666666666666666666660000000000077777777000000bbbbd00000000000aaaad00000fffff4ffff4fffff
0000dddddddd00000000dddddddd00000000000000000000000000000000000000000000777777770000000bbd0000000000000ddd000000ffffff4ff4ffffff
0000000000000000000000000000000000000000000000000000000000000000000000007777777700000000000000000000000000000000fffffff44fffffff
__map__
78786869694869494849694869696e7800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
7878784e49484e49484e49484e496e7800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
78785e49694849694869694869696e7800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
786f5859595859595859595859596e7800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
786f4869694849694869694849696e7800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
786f4849494849494849494849496e7800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
786f4869694869694849694869696e7800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
786f5859595859595859595859596e7800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
786f4869694869694869696869696e7800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
786f484e49484e49484e49484e496e7800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
786f4849694869494869694849696e7800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
786f5859595859595859595859596e7800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
786f5f79794f79794f79794f79796e7800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
786f5f79794f79794f79794f79796e7800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
000501011f4102c4102d41022410000000000011400204002b4003040001400004001c4001c4001c4000000000000000000000000000000000100001000010000100001000010000100000000000000000000000
011e00001c050000001f050000002105000000000001c050000001f0500000022050210500000000000000001c050000001f050000002105000000000001f050000001c0501c0501c0501c050190501a0501b050
011e000010750107501075010750107500d7500e7500f75010750107501075010750107500d7500e7500f750107501075010750107501575015750157501375013750107501075010750107500d7500e7500f750
001e00000c657000000000000000000000000000000000000c657000000000000000000000000000000000000c6570000000000000000c65700000000000c657000000c657000000000000000000000000000000
011e0000250502505025050250500000000000230502105024050240500000000000210502105000000000001c050000001f050000002105000000000001c050000001f050000002205021050000000000000000
011f00001505015050150501505015050150501505013050110501105011050110501105011050110501105010050100501005010050100500d0500e0500f05010050100501005010050100500d0500e05010050
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a00100001f6501e6501c6501b6501b650186501665014650126500f6500e6500b6500a650086500765023650206501c650186501665012650106500d6500b6500865006650046500365003650016500065001650
__music__
01 01020203
01 01020203
00 04054344
00 04054344
00 01020203
02 04054344

