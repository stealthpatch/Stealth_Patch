#include maps\_utility;
#include common_scripts\utility;
#include maps\_zombiemode_utility;

init()
{
    level.weighted_trades_starting_round = 50;

    // 0 = false
    // 1 = true
    SetDvar( "cg_stealthGiveWaffe", "0" );
    SetDvar( "cg_stealthGiveCrossbow", "0" );
}

is_stealth_trades_active()
{
    return level.round_number >= level.weighted_trades_starting_round;
}

// checks if the weapon should actually be given, prevents firerim situation
should_give_weapon( player )
{
    give_waffe = GetDvar( "cg_stealthGiveWaffe" ) == "1";
    give_bow = GetDvar( "cg_stealthGiveCrossbow" ) == "1";

    if ( give_waffe && !player maps\_zombiemode_weapons::has_weapon_or_upgrade( "tesla_gun_zm" ) )
    {
        return true;
    }

    if ( give_bow && !player maps\_zombiemode_weapons::has_weapon_or_upgrade( "crossbow_explosive_zm" ) )
    {
        return true;
    }

    return false;
}


get_weapon( filtered_weapon )
{
    give_waffe = GetDvar( "cg_stealthGiveWaffe" ) == "1";
    give_bow = GetDvar( "cg_stealthGiveCrossbow" ) == "1";

    if ( give_waffe )
    {
        SetDvar( "cg_stealthGiveWaffe", "0" );
        return "tesla_gun_zm";
    }

    if ( give_bow )
    {
        SetDvar( "cg_stealthGiveCrossbow", "0" );
        return "crossbow_explosive_zm";
    }

    return filtered_weapon;
}