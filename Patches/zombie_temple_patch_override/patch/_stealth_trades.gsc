#include maps\_utility;
#include common_scripts\utility;
#include maps\_zombiemode_utility;

init()
{
    level.weighted_trades_starting_round = 70;

    // 0 = false
    // 1 = true
    SetDvar( "cg_stealthGiveShrinkRay", "0" );
    SetDvar( "cg_stealthGiveCrossbow", "0" );
}

is_stealth_trades_active()
{
    return level.round_number >= level.weighted_trades_starting_round;
}

// checks if the weapon should actually be given, prevents firerim situation
should_give_weapon( player )
{
    give_shrinkray = GetDvar( "cg_stealthGiveShrinkRay" ) == "1";
    give_bow = GetDvar( "cg_stealthGiveCrossbow" ) == "1";

    if ( give_shrinkray && !player maps\_zombiemode_weapons::has_weapon_or_upgrade( "shrink_ray_zm" ) )
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
    give_shrinkray = GetDvar( "cg_stealthGiveShrinkRay" ) == "1";
    give_bow = GetDvar( "cg_stealthGiveCrossbow" ) == "1";

    if ( give_shrinkray )
    {
        SetDvar( "cg_stealthGiveShrinkRay", "0" );
        return "shrink_ray_zm";
    }

    if ( give_bow )
    {
        SetDvar( "cg_stealthGiveCrossbow", "0" );
        return "crossbow_explosive_zm";
    }

    return filtered_weapon;
}