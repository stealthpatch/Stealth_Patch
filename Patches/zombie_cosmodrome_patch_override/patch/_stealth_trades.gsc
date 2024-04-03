#include maps\_utility;
#include common_scripts\utility;
#include maps\_zombiemode_utility;

init()
{
    level.weighted_trades_starting_round = 50;

    // 0 = false
    // 1 = true
    SetDvar( "cg_stealthGiveThundergun", "0" );
    SetDvar( "cg_stealthGiveCrossbow", "0" );
    SetDvar( "cg_stealthGiveGershes", "0" );
    SetDvar( "cg_stealthGiveDolls", "0" );
}

is_stealth_trades_active()
{
    return level.round_number >= level.weighted_trades_starting_round;
}

// checks if the weapon should actually be given, prevents firerim situation
should_give_weapon( player )
{
    give_tgun = GetDvar( "cg_stealthGiveThundergun" ) == "1";
    give_bow = GetDvar( "cg_stealthGiveCrossbow" ) == "1";
    give_gershes = GetDvar( "cg_stealthGiveGershes" ) == "1";
    give_dolls = GetDvar( "cg_stealthGiveDolls" ) == "1";

    if ( give_tgun && !player maps\_zombiemode_weapons::has_weapon_or_upgrade( "thundergun_zm" ) )
    {
        return true;
    }

    if ( give_bow && !player maps\_zombiemode_weapons::has_weapon_or_upgrade( "crossbow_explosive_zm" ) )
    {
        return true;
    }

    // zombie_black_hole_bomb
    if ( give_gershes && !player maps\_zombiemode_weapons::has_weapon_or_upgrade( "zombie_black_hole_bomb" ) )
    {
        return true;
    }

    // zombie_nesting_dolls
    if ( give_dolls && !player maps\_zombiemode_weapons::has_weapon_or_upgrade( "zombie_nesting_dolls" ) )
    {
        return true;
    }

    return false;
}


get_weapon( filtered_weapon )
{
    give_tgun = GetDvar( "cg_stealthGiveThundergun" ) == "1";
    give_bow = GetDvar( "cg_stealthGiveCrossbow" ) == "1";
    give_gershes = GetDvar( "cg_stealthGiveGershes" ) == "1";
    give_dolls = GetDvar( "cg_stealthGiveDolls" ) == "1";

    if ( give_tgun )
    {
        SetDvar( "cg_stealthGiveThundergun", "0" );
        return "thundergun_zm";
    }

    if ( give_bow )
    {
        SetDvar( "cg_stealthGiveCrossbow", "0" );
        return "crossbow_explosive_zm";
    }

    if ( give_gershes )
    {
        SetDvar( "cg_stealthGiveGershes", "0" );
        return "zombie_black_hole_bomb";
    }

    if ( give_dolls )
    {
        SetDvar( "cg_stealthGiveDolls", "0" );
        return "zombie_nesting_dolls";
    }

    return filtered_weapon;
}