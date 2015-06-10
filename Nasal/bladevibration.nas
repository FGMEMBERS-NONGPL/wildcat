# Blade vibration script extracted from B)-105 script by (c) Melchior FRANZ  < mfranz # flightgear : org >



var vibration = { # and noise ...
	init: func {
		me.lonN = props.globals.initNode("/rotors/main/vibration/longitudinal");
		me.latN = props.globals.initNode("/rotors/main/vibration/lateral");
		me.soundN = props.globals.initNode("/sim/sound/vibration");
		me.airspeedN = props.globals.getNode("/velocities/airspeed-kt");
		me.vertspeedN = props.globals.getNode("/velocities/vertical-speed-fps");

		me.groundspeedN = props.globals.getNode("/velocities/groundspeed-kt");
		me.speeddownN = props.globals.getNode("/velocities/speed-down-fps");
		me.angleN = props.globals.initNode("/velocities/descent-angle-deg");
		me.dir = 0;
	},
	update: func(dt) {
		var airspeed = me.airspeedN.getValue();
		if (airspeed > 152) { # overspeed vibration
			var frequency = 2000 + 500 * rand();
			var v = 0.49 + 0.5 * normatan(airspeed - 160, 10);
			var intensity = v;
			var noise = v * internal;

		} elsif (airspeed > 30) { # Blade Vortex Interaction (BVI)    8 deg, 65 kts max?
			var frequency = rotor_rpm.getValue() * 4 * 60;
			var down = me.speeddownN.getValue() * FT2M;
			var level = me.groundspeedN.getValue() * NM2M / 3600;
			me.angleN.setDoubleValue(var angle = math.atan2(down, level) * R2D);
			var speed = math.sqrt(level * level + down * down) * MPS2KT;
			angle = bell(angle - 9, 13);
			speed = bell(speed - 65, 450);
			var v = angle * speed;
			var intensity = v * 0.10;
			var noise = v * (1 - internal * 0.4);

		} else { # hover
			var rpm = rotor_rpm.getValue();
			var frequency = rpm * 4 * 60;
			var coll = bell(collective.getValue(), 0.5);
			var ias = bell(airspeed, 600);
			var vert = bell(me.vertspeedN.getValue() * 0.5, 400);
			var rpm = 0.477 + 0.5 * normatan(rpm - 350, 30) * 1.025;
			var v = coll * ias * vert * rpm;
			var intensity = v * 0.10;
			var noise = v * (1 - internal * 0.4);
		}

		me.dir += dt * frequency;
		me.lonN.setValue(cos(me.dir) * intensity);
		me.latN.setValue(sin(me.dir) * intensity);
		me.soundN.setValue(noise);
	},
};




