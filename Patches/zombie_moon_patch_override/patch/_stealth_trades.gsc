#include maps\_utility;
#include common_scripts\utility;
#include maps\_zombiemode_utility;

init()
{
    level.weighted_trades_starting_round = 50;

    // 0 = false
    // 1 = true
    SetDvar( "cg_stealthGiveWaveGun", "0" );
    SetDvar( "cg_stealthGiveQED", "0" );
    SetDvar( "cg_stealthGiveGershes", "0" );
}

is_stealth_trades_active()
{
    return level.round_number >= level.weighted_trades_starting_round;
}

// checks if the weapon should actually be given, prevents firerim situation
should_give_weapon( player )
{
    give_wavegun = GetDvar( "cg_stealthGiveWaveGun" ) == "1";
    give_qed = GetDvar( "cg_stealthGiveQED" ) == "1";
    give_gershes = GetDvar( "cg_stealthGiveGershes" ) == "1";

    if ( give_wavegun && !player maps\_zombiemode_weapons::has_weapon_or_upgrade( "microwavegundw_zm" ) )
    {
        return true;
    }

    if ( give_qed && !player maps\_zombiemode_weapons::has_weapon_or_upgrade( "zombie_quantum_bomb" ) )
    {
        return true;
    }

    if ( give_gershes && !player maps\_zombiemode_weapons::has_weapon_or_upgrade( "zombie_black_hole_bomb" ) )
    {
        return true;
    }

    return false;
}


get_weapon( filtered_weapon )
{
    give_wavegun = GetDvar( "cg_stealthGiveWaveGun" ) == "1";
    give_qed = GetDvar( "cg_stealthGiveQED" ) == "1";
    give_gershes = GetDvar( "cg_stealthGiveGershes" ) == "1";

    if ( give_wavegun )
    {
        SetDvar( "cg_stealthGiveWaveGun", "0" );
        return "microwavegundw_zm";
    }

    if ( give_qed )
    {
        SetDvar( "cg_stealthGiveQED", "0" );
        return "zombie_quantum_bomb";
    }

    if ( give_gershes )
    {
        SetDvar( "cg_stealthGiveGershes", "0" );
        return "zombie_black_hole_bomb";
    }

    return filtered_weapon;
}