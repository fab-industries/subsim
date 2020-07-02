pico-8 cartridge // http://www.pico-8.com
version 27
__lua__
-- subsim
-- by fabsh

x=60 y=60

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
end

function _update()
	-- move waves
	for w in all(waves) do
		w.x+=w.z*3/10
		if w.x>128 then
			w.x=0
			w.y=rnd(128)
		end
	end
end

function _draw()
	cls()
	rectfill(0,0,127,127,1)
	-- draw waves
	for w in all(waves) do
		pset (w.x,w.y,w.c)
		pset (w.x+1,w.y,w.c)
		pset (w.x+2,w.y-1,w.c)
		pset (w.x+3,w.y,w.c)
	end
 -- draw sub
	spr(1,x,y,1,3)
	-- draw diving sub
	pal({[0]=13,[4]=13,[5]=13,[6]=13,[7]=13})
 spr(1,60,80,1,3)
 rst_pal()
 -- draw submerged sub
 pal({[4]=0,[5]=0,[6]=0,[7]=0,[13]=0})
 spr(1,60,100,1,3)
 rst_pal()
 -- draw periscopes
	spr(2,80,68)
	spr(3,80,72)
	-- draw small merchant
	-- 5,000 tons
	spr(4,10,10,1,4)
	-- draw medium merchant
	-- 10,000 tons
	spr(5,20,10,1,4)
	-- draw medium tanker
	-- 10,000 tons
	spr(6,30,10,1,4)
end

function rst_pal()
	pal()
	palt(1, true)
	palt(0, false)
end
__gfx__
00000000111111111111111111111111111111111111111111111111000000000000000000000000000000000000000000000000000000000000000000000000
00000000111111111111111111111111111111111116611111100111000000000000000000000000000000000000000000000000000000000000000000000000
00700700111111111111111111111111111111111166661111066011000000000000000000000000000000000000000000000000000000000000000000000000
00077000111111111111111111111111111111111165561111066011000000000000000000000000000000000000000000000000000000000000000000000000
00077000111551111116c1c111161c11111661111655556110600601000000000000000000000000000000000000000000000000000000000000000000000000
0070070011d66d111111111111111111116666111656656110666601000000000000000000000000000000000000000000000000000000000000000000000000
00000000111661111111111111111111116556111677776110777701000000000000000000000000000000000000000000000000000000000000000000000000
00000000111441111111111111111111165555611655556110666601000000000000000000000000000000000000000000000000000000000000000000000000
00000000115445110000000000000000165555611655556110600601000000000000000000000000000000000000000000000000000000000000000000000000
00000000115445110000000000000000165555611656656110655601000000000000000000000000000000000000000000000000000000000000000000000000
00000000105775010000000000000000165775611677776110655601000000000000000000000000000000000000000000000000000000000000000000000000
00000000155dd5510000000000000000165555611655556110055001000000000000000000000000000000000000000000000000000000000000000000000000
00000000157dd7510000000000000000165555611655556110666601000000000000000000000000000000000000000000000000000000000000000000000000
00000000157667510000000000000000165555617777777710777701000000000000000000000000000000000000000000000000000000000000000000000000
00000000105775010000000000000000177777717777777777777777000000000000000000000000000000000000000000000000000000000000000000000000
00000000115445110000000000000000177777711677776177777777000000000000000000000000000000000000000000000000000000000000000000000000
00000000115445110000000000000000167777611677776110777701000000000000000000000000000000000000000000000000000000000000000000000000
00000000110660110000000000000000165775611667766110777701000000000000000000000000000000000000000000000000000000000000000000000000
00000000111661110000000000000000167007611666666110677601000000000000000000000000000000000000000000000000000000000000000000000000
00000000111551110000000000000000167007611667766110600601000000000000000000000000000000000000000000000000000000000000000000000000
00000000111111110000000000000000165775611670076110766701000000000000000000000000000000000000000000000000000000000000000000000000
00000000111111110000000000000000165555611670076110600601000000000000000000000000000000000000000000000000000000000000000000000000
00000000111111110000000000000000165775611657756110766701000000000000000000000000000000000000000000000000000000000000000000000000
00000000111111110000000000000000165555611655556110677601000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000165555611656656110700701000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000116666111677776110700701000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000111111111656656110677601000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000111111111655556110666601000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000111111111165561111766711000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000111111111116611111100111000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000111111111111111111111111000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000111111111111111111111111000000000000000000000000000000000000000000000000000000000000000000000000
