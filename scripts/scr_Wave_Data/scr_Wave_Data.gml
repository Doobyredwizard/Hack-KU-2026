function EnemySpawn(spd, hp, damage, knockback, size, spawn_weight) constructor
{
	self.spd = spd;
	self.hp = hp;
	self.damage = damage;
	self.knockback = knockback;
	self.size = size;
	self.spawn_weight = spawn_weight;
}

global.waves = {};

var waves_normal =
{
	"1": 
	{
		wave_time: 30,
		spawn_time: 1,
		spawn_count: 1,
		new_enemies: [
			new EnemySpawn(1, 20, 5, 8, 1, 50)
		]
	},
	"2": 
	{
		wave_time: 30,
		spawn_time: 1,
		spawn_count: 1,
		new_enemies: [
			new EnemySpawn(0.5, 40, 10, 12, 1.5, 5)
		]
	},
	"3": 
	{
		wave_time: 30,
		spawn_time: 1,
		spawn_count: 1,
		new_enemies: [
			new EnemySpawn(0.5, 40, 10, 12, 1.5, 10)
		]
	},
	"4": 
	{
		wave_time: 30,
		spawn_time: 1,
		spawn_count: 2
	},
	"5": 
	{
		wave_time: 30,
		spawn_time: 1,
		spawn_count: 1,
		new_enemies: [
			new EnemySpawn(1, 60, 15, 18, 2, 1)
		]
	},
	"6": 
	{
		wave_time: 45,
		spawn_time: 1,
		spawn_count: 1,
	},
	"7": 
	{
		wave_time: 45,
		spawn_time: 1,
		spawn_count: 2,
	},
	"8": 
	{
		wave_time: 45,
		spawn_time: 1,
		spawn_count: 1,
		new_enemies: [
			new EnemySpawn(1, 60, 15, 18, 2, 3)
		]
	},
	"9": 
	{
		wave_time: 45,
		spawn_time: 1,
		spawn_count: 2,
	},
	"10": 
	{
		wave_time: 45,
		spawn_time: 1,
		spawn_count: 1,
		new_enemies: [
			new EnemySpawn(1, 60, 15, 18, 2, 4)
		]
	},
	"11": 
	{
		wave_time: 60,
		spawn_time: 1,
		spawn_count: 3,
	},
	"12": 
	{
		wave_time: 60,
		spawn_time: 1,
		spawn_count: 4,
	},
	"13": 
	{
		wave_time: 60,
		spawn_time: 1,
		spawn_count: 5,
	},
	"14": 
	{
		wave_time: 60,
		spawn_time: 1,
		spawn_count: 3,
		new_enemies: [
			new EnemySpawn(1, 60, 15, 18, 2, 5)
		]
	},
	"15": 
	{
		wave_time: 60,
		spawn_time: 1,
		spawn_count: 5
	},
	"16": 
	{
		wave_time: 75,
		spawn_time: 0.8,
		spawn_count: 5,
	},
	"17": 
	{
		wave_time: 75,
		spawn_time: 0.8,
		spawn_count: 7,
	},
	"18": 
	{
		wave_time: 75,
		spawn_time: 0.8,
		spawn_count: 9,
	},
	"19": 
	{
		wave_time: 75,
		spawn_time: 0.8,
		spawn_count: 5,
		new_enemies: [
			new EnemySpawn(1, 60, 15, 18, 2, 5)
		]
	},
	"20": 
	{
		wave_time: 75,
		spawn_time: 0.8,
		spawn_count: 5,
		new_enemies: [
			new EnemySpawn(2, 50, 10, 12, 1.75, 10)
		]
	},
	"21": 
	{
		wave_time: 90,
		spawn_time: 0.6,
		spawn_count: 8,
	},
	"22": 
	{
		wave_time: 90,
		spawn_time: 0.6,
		spawn_count: 8,
		new_enemies: [
			new EnemySpawn(2, 50, 10, 12, 1.75, 10)
		]
	},
	"23": 
	{
		wave_time: 90,
		spawn_time: 0.6,
		spawn_count: 8,
		new_enemies: [
			new EnemySpawn(2, 50, 10, 12, 1.75, 10),
			new EnemySpawn(1, 60, 15, 18, 2, 20)
		]
	},
	"24": 
	{
		wave_time: 90,
		spawn_time: 0.6,
		spawn_count: 10,
	},
	"25": 
	{
		wave_time: 120,
		spawn_time: 0.5,
		spawn_count: 10,
		new_enemies: [
			new EnemySpawn(2, 50, 10, 12, 1.75, 10),
			new EnemySpawn(1, 60, 15, 18, 2, 20)
		]
	}
}

global.waves[$ "normal"] = waves_normal;

var waves_hyper = 
{
	"default": 
	{
		wave_time: 10,
		spawn_time: 1,
		spawn_count: 1,
		new_enemies: [
			new EnemySpawn(2, 40, 10, 12, 1, 50)
		]
	},
}

global.waves[$ "hyper"] = waves_hyper;