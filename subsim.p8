pico-8 cartridge // http://www.pico-8.com
version 32
__lua__
-- subsim
-- by fabsh

x=60 y=90
id=48
name='scherschel'

function _init()
	palt(1, true)
	palt(0, false)
	-- init music
	music(0)
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
	-- button lock state
	btn_lock = 0
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
	-- button locked?
	button_lock() 
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
	-- print sub id / skipper name
	print('u',1,116,5)
	print(id,6,116,5)
	print('kplt',1,122,5)
	print(name,20,122,5)
	-- print score
	print('score',108,115,5)
	print('100,000t',96,122,6)
	spr(34,119,106)
	spr(35,119,97)
	spr(50,119,88)
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
 
 -- if buttons aren't locked
 if btn_lock == 0 then
 	-- dive sub
		if (btnp(3)) then
			sub_dv = sub_dv+1
			btn_lock = btn_lock+1
		end
		-- raise sub
		if (btnp(2)) then
			sub_dv = sub_dv-1
			btn_lock = btn_lock+1
		end
	else
	end	
end

function button_lock() 
	if btn_lock > 121 then
		-- reset counter after 4 seconds
		btn_lock = 0	
	elseif btn_lock > 0 then
	 -- increase counter by one each tick
	 btn_lock = btn_lock+1	
	else
	 btn_locm = 0
 end
end
__gfx__
00000000111111111111111111111111111111111111111111111111111661111116611111111111111111111111111111156111111111110000000000000000
00000000111111111111111111111111111111111116611111166111116556111166661111111111111111111111111116157161111111110000000000000000
00700700111111111111111111111111111111111166661111655611116556111667766111111111111111111111116099988999061111110000000000000000
00077000111111111111111111111111111111111165561111655611165005611657756111155111111661111111111776899867711111110000000000000000
0007700011155111671d111d67d11d11111661111655556116500561165775616555555611155111111771111111111111566511111111110000000000000000
0070070011d66d111111d111111d1111116666111656656116566561177777716556655611555511116556111111111111156111111111110000000000000000
00000000111661111111111111111111116556111677776116777761106006016577775611566511116556111111111111156111111111110000000000000000
00000000111441111111111111111111165555611655556116666661106666016555555615577551166776611111111117966971111111110000000000000000
0000000011544511111d1111111d1111165555611655556110600601106006016556655615477451166556610000000000000000000000000000000000000000
0000000011544511111d1111111d1111165555611656656110655601107777016777777615677651165775610000000000000000000000000000000000000000
0000000010577501111d1111111d1111165775611677776110655601106556016555555615466451155665510000000000000000000000000000000000000000
00000000155dd551111c111111111111165555611655556110055001107777016556655615444451155555510000000000000000000000000000000000000000
00000000157dd75111111111111c1111165555611655556110666601106006016777777615555551155775510000000000000000000000000000000000000000
0000000015766751111c111111111111165555617777777710777701106666016555555617777771157667510000000000000000000000000000000000000000
000000001057750111111111111c1111177777717777777777777777106666017777777715777751677557760000000000000000000000000000000000000000
0000000011544511111c111111111111177777711677776177777777777777777777777715577551577777750000000000000000000000000000000000000000
00000000115445111000000110000001167777611677776110777701777777776777777615677651556776550000000000000000000000000000000000000000
00000000110660110100001001000017165775611667766110777701177777716670076615700751567007650000000000000000000000000000000000000000
00000000111661110010010000100178167007611666666110677601106776017670076715700751567007650000000000000000000000000000000000000000
00000000111551110000000000000787167007611667766110600601107007016670076615677651156776510000000000000000000000000000000000000000
00000000111551110010010000107870165775611670076110766701106776017677776716777761154664510000000000000000000000000000000000000000
00000000111111110100001001078710165555611670076110600601107007017667766715577551157557510000000000000000000000000000000000000000
00000000111111111000000110787001165775611657756110766701107667017670076716577561166776610000000000000000000000000000000000000000
00000000111111111111111111111111165555611655556116677661166776617667766716566561157777510000000000000000000000000000000000000000
00000000000000001000000100000000165555611656656116700761167007616566665611577511557557550000000000000000000000000000000000000000
000000000000000001a00a1700000000116666111677776116700761166776616756657611555511155665510000000000000000000000000000000000000000
0000000000000000001aa17800000000111111111656656116577561167007616557755611166111156446510000000000000000000000000000000000000000
000000000000000000a00a8700000000111111111655556116555561167007616577775611111111155665510000000000000000000000000000000000000000
00000000000000000010787000000000111111111165561111755711165775616555555611111111155665510000000000000000000000000000000000000000
00000000000000000107871000000000111111111116611111166111165555616657756611111111155775510000000000000000000000000000000000000000
00000000000000001078700100000000111111111111111111111111117557111666666111111111115555110000000000000000000000000000000000000000
00000000000000001111111100000000111111111111111111111111111661111166661111111111111111110000000000000000000000000000000000000000
__sfx__
000f00000955009550095500955002550025500255002550025500255002550025500a5500a5500a5500a5500a5500355003550035500355003550035500355009550095500b5500b5500b5500b5500b5500b550
000f0000025500255002550025500e5500f5500255002550025500255002550025500b5500e5500a5500555005550035500355003550035500a5500a550035500955009550045500455004550045500455004550
810f000000702007022d7622d71200702007020070200702007020070200702007020070200702007020070200702007020070200702007020070200702007020070200702007020070200702007020070200702
__music__
03 00010244

