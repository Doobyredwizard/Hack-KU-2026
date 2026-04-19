if !game_state_is_state(GAME_STATE.PAUSE)
{
	push_game_state(GAME_STATE.PAUSE);
}
else
{
	pop_game_state();
}