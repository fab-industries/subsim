# Subsim

Subsim is a World War II submarine simulation for the [PICO-8 console](https://www.lexaloffle.com/pico-8.php). It is currently very much a work in progress.

## Design Document

You are the commander of a German submarine in WWII. Your sub is in the middle of the screen, which represents how far your sub commander can see. Your goal is to move across a vast stretch of the North Atlantic to find enemy merchant vessels and tankers and sink them with your torpedoes, hopefully without being spotted by ships or airplanes which will cause you to be hunted by enemy warships.

You have five movement controls at your disposal:

DOWN &ndash; Dives your sub  
UP &ndash; Raises your sub  
LEFT &ndash; Manoeuvres to port  
RIGHT &ndash; Manoeuvres to starboard  
O &ndash; Cycles the sub's speed: **Stop**, **Ahead**, **Full Ahead**

The camera always stays centred on your sub in the middle of the screen. Your sub has three diving states: **Surfaced**, **Periscope Depth** and **Submerged**. When you give a dive or raise commands, your ship will take a few seconds to execute it. During this time, you can give no other diving commands but you can still manoeuvre.

X &ndash; Fires a torpedo

The torpedo will slowly go in a straight line until it leaves the screen. You can only fire torpedoes when you are surfaced or at periscope depth. Additionally, at periscope depth, you view will be restricted to a more narrow area of the screen. When submerged, you only see what's directly above your boat.

Your goal is to stay alive and sink as many merchant vessels and tankers as possible. Your score is calculated based on sunk tonnage. There are several kinds of merchants and a tankers with different tonnage. They take more or less torpedoes to sink based on tonnage; tankers are easier to destroy. Your commander gets different medals based on his total tonnage sunk. Ships spawn alone or in small convoys off screen somewhere on the map with a random course and different speeds. When hit, they will change course and try to escape.

The game will spawn spotter airplanes with a random course from time to time. If you are spotted by them &ndash; high likelihood when surfaced, small likelihood when at periscope depth, impossible when submerged &ndash; they will launch torpedoes towards your sub. Being spotted by these planes massively increases a hidden alert counter. Being surfaced with a merchant or tanker ship on screen also increases this counter. As the counter gets higher, the game will start spawning consecutive waves of different destroyers that zero in on the player's sub and try to destroy it with depth charges or by ramming it. If the player is surfaced and collides with a destroyer, it's game over. At periscope depth, the depth charges have a very large destructive radius. If the sub is submerged and a destroyer attacks with depth charges, the destroyer has do be pretty much right above the sub to destroy it. Additionally, being submerged makes torpedoes from spotter planes miss.


## Credits

Code & Graphics: [**Fabian A. Scherschel**](https://fab.industries)  
Music: [**Fabian A. Scherschel**](https://fab.industries)

### Thanks

[**Paul Nicholas**](https://www.liquidream.co.uk)  
[**Dylan Bennett**](https://twitter.com/MBoffin)  
[**Clemens Gleich**](https://www.mojomag.de/)

### Special Thanks

[**Katy**](https://scherschel.science)
