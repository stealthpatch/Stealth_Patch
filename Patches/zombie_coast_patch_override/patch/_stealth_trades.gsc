#include maps\_utility;
#include common_scripts\utility;
#include maps\_zombiemode_utility;

init()
{
    level.weighted_trades_starting_round = 50;

    // 0 = false
    // 1 = true
    SetDvar( "cg_stealthGiveRayGun", "0" );
    SetDvar( "cg_stealthGiveM72Law", "0" );
    SetDvar( "cg_stealthGiveScavenger", "0" );
    SetDvar( "cg_stealthGiveVR11", "0" );
    SetDvar( "cg_stealthGiveCrossbow", "0" );
}

is_stealth_trades_active()
{
    return level.round_number >= level.weighted_trades_starting_round;
}

// checks if the weapon should actually be given, prevents firerim situation
should_give_weapon( player )
{
    give_ray = GetDvar( "cg_stealthGiveRayGun" ) == "1";
    give_law = GetDvar( "cg_stealthGiveM72Law" ) == "1";
    give_scav = GetDvar( "cg_stealthGiveScavenger" ) == "1";
    give_vr = GetDvar( "cg_stealthGiveVR11" ) == "1";
    give_bow = GetDvar( "cg_stealthGiveCrossbow" ) == "1";

    if ( give_ray && !player maps\_zombiemode_weapons::has_weapon_or_upgrade( "ray_gun_zm" ) )
    {
        return true;
    }

    if ( give_law && !player maps\_zombiemode_weapons::has_weapon_or_upgrade( "m72_law_zm" ) )
    {
        return true;
    }

    if ( give_scav && !player maps\_zombiemode_weapons::has_weapon_or_upgrade( "sniper_explosive_zm" ) )
    {
        return true;
    }

    if ( give_vr && !player maps\_zombiemode_weapons::has_weapon_or_upgrade( "humangun_zm" ) )
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
    give_ray = GetDvar( "cg_stealthGiveRayGun" ) == "1";
    give_law = GetDvar( "cg_stealthGiveM72Law" ) == "1";
    give_scav = GetDvar( "cg_stealthGiveScavenger" ) == "1";
    give_vr = GetDvar( "cg_stealthGiveVR11" ) == "1";
    give_bow = GetDvar( "cg_stealthGiveCrossbow" ) == "1";

    if ( give_ray )
    {
        SetDvar( "cg_stealthGiveRayGun", "0" );
        return "ray_gun_zm";
    }

    if ( give_law )
    {
        SetDvar( "cg_stealthGiveM72Law", "0" );
        return "m72_law_zm";
    }

    if ( give_scav )
    {
        SetDvar( "cg_stealthGiveScavenger", "0" );
        return "sniper_explosive_zm";
    }

    if ( give_vr )
    {
        SetDvar( "cg_stealthGiveVR11", "0" );
        return "humangun_zm";
    }

    if ( give_bow )
    {
        SetDvar( "cg_stealthGiveCrossbow", "0" );
        return "crossbow_explosive_zm";
    }

    return filtered_weapon;
}