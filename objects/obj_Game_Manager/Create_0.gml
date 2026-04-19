randomize();

enum GAME_STATE
{
	GAMEPLAY,
	UPGRADE,
	END,
	PAUSE
}

global.game_state = [];

function push_game_state(state)
{
	array_push(global.game_state, state);
}

function pop_game_state()
{
	array_pop(global.game_state);
}

function get_currnt_game_state()
{
	if (array_length(global.game_state) == 0) return GAME_STATE.GAMEPLAY;
	else
	{
		return global.game_state[array_length(global.game_state)-1];
	}
}

function game_state_is_state(state)
{
	return get_currnt_game_state() == state;
}