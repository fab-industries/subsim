pico-8 cartridge // http://www.pico-8.com
version 27
__lua__
-- subsim
-- by fabsh

x=60 y=80

function _init()
	palt(1, true)
	palt(0, false)
	-- init waves
	waves={}
	wave_cols={12,13}
	-- create waves
	for i=1,#wave_cols do
		for j=1,20 do
			local w={
				x=rnd(128),
				y=rnd(128),
				z=i,
				c=wave_cols[i]
			}
			add(waves,w)
		end
	end
	-- animate sprites
	t,f,s=0,1,15 --tick,frame,step
	sp={2,3} --sprites
	sp2={18,19}
	-- submarine state
	sub_dv = 1
end

function _update()
	-- move waves
	for w in all(waves) do
		w.x+=w.z*1/10
		if w.x>128 then
			w.x=0
			w.y=rnd(128)
		end
	end
	-- animate sprites
	t=(t+1)%s --forward tick
	if (t==0) f=f%#sp+1
	-- sub diving?
		sub_diving()
end

function _draw()
	-- reset invalid diving states
		if sub_dv == 5 then
		sub_dv = 4
	elseif sub_dv == 0 then
		sub_dv = 1
	end
	cls()	
	rectfill(0,0,127,127,1)
	-- draw sub at periscope depth
 if sub_dv == 2 then	
		pal({[0]=12,[4]=12,[5]=12,[6]=12,[7]=12,[13]=12})
 	spr(1,x,y,1,3)
 	rst_pal()
 end
 -- draw diving sub
 if sub_dv == 3 then	
		pal({[0]=3,[4]=3,[5]=3,[6]=3,[7]=3,[13]=3})
 	spr(1,x,y,1,3)
 	rst_pal()
 end 
 -- draw submerged sub
 if sub_dv == 4 then
 	pal({[4]=0,[5]=0,[6]=0,[7]=0,[13]=0})
 	spr(1,x,y,1,3)
 	rst_pal()
 end
 -- draw torpedo
 spr(sp2[f],x,y-10)
	-- draw waves
	for w in all(waves) do
		pset (w.x,w.y,w.c)
		pset (w.x+1,w.y,w.c)
		pset (w.x+2,w.y-1,w.c)
		pset (w.x+3,w.y,w.c)
	end
 -- draw sub
 if sub_dv == 1 then
 	spr(1,x,y,1,3)
 end
 -- draw animated periscope
	if sub_dv == 2 then
		spr(sp[f],x+3,y+7)
	end
	-- draw small merchant
	-- 5,000 tons
	spr(4,10,10,1,4)
	-- draw medium merchant
	-- 10,000 tons
	spr(5,20,10,1,4)
	-- draw medium tanker
	-- 10,000 tons
	spr(6,30,10,1,4)
	-- print score
	print('score',108,114,5)
	print('100,000t',96,121,6)
	spr(34,119,105)
	spr(35,119,96)
	spr(50,119,87)
end

function rst_pal()
	pal()
	palt(1, true)
	palt(0, false)
end

function sub_diving()	
	--[[ buttons:
	0=left⬅️ 1=right➡️
 2=up⬆️ 3=down⬇️
 4=o🅾️ 5=x❎ ]]
 
 -- dive sub
	if (btnp(3)) then
		sub_dv = sub_dv+1
	end
	-- raise sub
	if (btnp(2)) then
		sub_dv = sub_dv-1
	end	
end
__gfx__
00000000111111111111111111111111111111111111111111111111000000000000000000000000000000000000000000000000000000000000000000000000
00000000111111111111111111111111111111111116611111100111000000000000000000000000000000000000000000000000000000000000000000000000
00700700111111111111111111111111111111111166661111066011000000000000000000000000000000000000000000000000000000000000000000000000
00077000111111111111111111111111111111111165561111066011000000000000000000000000000000000000000000000000000000000000000000000000
0007700011155111671d111d67d11d11111661111655556110600601000000000000000000000000000000000000000000000000000000000000000000000000
0070070011d66d111111d111111d1111116666111656656110666601000000000000000000000000000000000000000000000000000000000000000000000000
00000000111661111111111111111111116556111677776110777701000000000000000000000000000000000000000000000000000000000000000000000000
00000000111441111111111111111111165555611655556110666601000000000000000000000000000000000000000000000000000000000000000000000000
0000000011544511111d1111111d1111165555611655556110600601000000000000000000000000000000000000000000000000000000000000000000000000
0000000011544511111d1111111d1111165555611656656110655601000000000000000000000000000000000000000000000000000000000000000000000000
0000000010577501111d1111111d1111165775611677776110655601000000000000000000000000000000000000000000000000000000000000000000000000
00000000155dd551111c111111111111165555611655556110055001000000000000000000000000000000000000000000000000000000000000000000000000
00000000157dd75111111111111c1111165555611655556110666601000000000000000000000000000000000000000000000000000000000000000000000000
0000000015766751111c111111111111165555617777777710777701000000000000000000000000000000000000000000000000000000000000000000000000
000000001057750111111111111c1111177777717777777777777777000000000000000000000000000000000000000000000000000000000000000000000000
0000000011544511111c111111111111177777711677776177777777000000000000000000000000000000000000000000000000000000000000000000000000
00000000115445111000000110000001167777611677776110777701000000000000000000000000000000000000000000000000000000000000000000000000
00000000110660110100001001000017165775611667766110777701000000000000000000000000000000000000000000000000000000000000000000000000
00000000111661110010010000100178167007611666666110677601000000000000000000000000000000000000000000000000000000000000000000000000
00000000111551110000000000000787167007611667766110600601000000000000000000000000000000000000000000000000000000000000000000000000
00000000111111110010010000107870165775611670076110766701000000000000000000000000000000000000000000000000000000000000000000000000
00000000111111110100001001078710165555611670076110600601000000000000000000000000000000000000000000000000000000000000000000000000
00000000111111111000000110787001165775611657756110766701000000000000000000000000000000000000000000000000000000000000000000000000
00000000111111111111111111111111165555611655556110677601000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000001000000100000000165555611656656110700701000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000001a00a1700000000116666111677776110700701000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000001aa17800000000111111111656656110677601000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000a00a8700000000111111111655556110666601000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000010787000000000111111111165561111766711000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000107871000000000111111111116611111100111000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000001078700100000000111111111111111111111111000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000001111111100000000111111111111111111111111000000000000000000000000000000000000000000000000000000000000000000000000
