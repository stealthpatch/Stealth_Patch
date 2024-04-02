#include maps\_utility;
#include common_scripts\utility;
#include maps\_zombiemode_utility;

//
// This was a bitch to make
//

init()
{
    level._PATCH_MIN_ACTIVATION_HIT = 0;
    level._PATCH_MAX_ACTIVATION_HIT = 1;
    level._PATCH_ACTIVATION_HIT = 2;
    level._PATCH_CURRENT_HITS = 3;
    level._PATCH_WEAPON_NAME = 4;

    level.has_updated_vr11 = false;
    level.has_removed_raygun = false;
    level.has_removed_scav = false;
    level.has_removed_m72_law = false;

    level.weighted_trades_starting_round = 60; // originally 50

    // 1st value = min hits for an artificial good trade
    // 2nd value = max hits for an artificial good trade
    // 3rd value = activation hit (hit the trade gives you the weapon), get's calculated later
    // 4th value = current hits towards activation hit
    // 5th value = weapon name
    level.weighted_weapon_averages = array( 
        array( 21, 25, 0, 0, "ray_gun_zm" ), // ray gun
        array( 31, 35, 0, 0, "m72_law_zm" ), // m72 law
        array( 19, 24, 0, 0, "sniper_explosive_zm" ), // scavenger
        array( 23, 25, 0, 0, "humangun_zm" ) // vr-11
    );
    level.weighted_weapon_averages = array_randomize( level.weighted_weapon_averages );

    level.current_weighted_trade_hits = 0;

    level.one_hit_trade = false;

    set_default_activation_hits(); // so they're not all 0
}

// goes through all weapons and recalculates their average
set_default_activation_hits()
{
    for ( i = 0; i < level.weighted_weapon_averages.size; i++ )
    {
        recalculate_average( level.weighted_weapon_averages[i] );
    }
}

is_weighted_trades_active()
{
    return level.round_number >= level.weighted_trades_starting_round;
}

// calculate's a weapon's average
recalculate_average( weapon_average )
{
    rand = RandomInt(100);

    average_min = weapon_average[level._PATCH_MIN_ACTIVATION_HIT];
    average_max = weapon_average[level._PATCH_MAX_ACTIVATION_HIT];
    weapon_average[level._PATCH_ACTIVATION_HIT] = RandomIntRange( average_min, average_max );
    weapon_average[level._PATCH_CURRENT_HITS] = 0;

    level.one_hit_trade = rand <= 3;

    update_average( weapon_average );
}

// resets certain variables for a specified average
reset_variables( average )
{
    average[level._PATCH_CURRENT_HITS] = 0;
    update_average( average );
    // randomize all of them
    level.weighted_weapon_averages = array_randomize( level.weighted_weapon_averages );
    update_averages_cotd();
}

// add a hit to the average
on_box_hit()
{
    for ( i = 0; i < level.weighted_weapon_averages.size; i++ )
    {
        average = level.weighted_weapon_averages[i];
        average[level._PATCH_CURRENT_HITS] = (average[level._PATCH_CURRENT_HITS] + 1);
        update_average( average );
    }
}

// checks if the weapon should actually be given, prevent firerim situation
should_give_weighted_weapon( weighted_trade_weapon, player )
{
    weapon_name = weighted_trade_weapon[level._PATCH_WEAPON_NAME];
    activation_hit = weighted_trade_weapon[level._PATCH_ACTIVATION_HIT];
    current_hits = weighted_trade_weapon[level._PATCH_CURRENT_HITS];

    give_it = false;

    if ( current_hits >= activation_hit )
    {
        give_it = true;
    }

    one_hit_trade_reset = false;
    if ( level.one_hit_trade )
    {
        give_it = true;
        level.one_hit_trade = false;
        one_hit_trade_reset = true;
    }

    // no firerim situation
    if ( player maps\_zombiemode_weapons::has_weapon_or_upgrade( weapon_name ) )
    {
        give_it = false;

        // if it's been reset due to not wanting to constantly give one hits, but they already have the weapon, just set it back to true
        // in this case, it will be a 2 hit trade
        if ( one_hit_trade_reset && !level.one_hit_trade )
        {
            one_hit_trade_reset = false;
            level.one_hit_trade = true;
        }
    }

    return give_it;
}

get_next_weighted_weapon() // gets the average that is the closest to being finished
{
    averages = level.weighted_weapon_averages;

    closest_average = averages[0];
    for ( i = 0; i < level.weighted_weapon_averages.size; i++ )
    {
        weapon_average = level.weighted_weapon_averages[i];
        activation_hit = weapon_average[level._PATCH_ACTIVATION_HIT];

        if ( activation_hit > closest_average )
        {
            closest_average = weapon_average;
        }
    }

    return closest_average;
}

get_average( weapon_name )
{
    for ( i = 0; i < level.weighted_weapon_averages.size; i++ )
    {
        weapon_average = level.weighted_weapon_averages[i];

        if ( weapon_name == weapon_average[level._PATCH_WEAPON_NAME] )
        {
            return weapon_average;
        }
    }

    return undefined;
}

update_average( weapon_average )
{
    // update it in the array
    for ( i = 0; i < level.weighted_weapon_averages.size; i++ )
    {
        _weapon_average = level.weighted_weapon_averages[i];

        if ( weapon_average[level._PATCH_WEAPON_NAME] == _weapon_average[level._PATCH_WEAPON_NAME] )
        {
            level.weighted_weapon_averages[i] = weapon_average;
        }
    }
}

//
// CUSTOM FUNCTIONS FOR CALL OF THE DEAD AVERAGES
//

// this is to update the averages based on the round, as the averages need to change later on
update_averages_cotd()
{
    update_vr11_average();
    update_ray_gun_average();
    update_scav_average();
    update_m72_law_average();
}

// vr11
update_vr11_average()
{
    if ( level.has_updated_vr11 == true )
    {
        return;
    }

    average = get_average( "humangun_zm" );

    if ( level.round_number >= 86 )
    {
        average[level._PATCH_MIN_ACTIVATION_HIT] = 17;
        average[level._PATCH_MAX_ACTIVATION_HIT] = 21;
        update_average( average );
        recalculate_average( average );
        level.has_updated_vr11 = true;

        debug_average = get_average( "humangun_zm" );
    }
}

// ray gun
update_ray_gun_average()
{
    if ( level.has_removed_raygun == true )
    {
        return;
    }

    average = get_average( "ray_gun_zm" );

    // remove ray gun from weighted averages
    if ( level.round_number >= 88 )
    {
        average[level._PATCH_MIN_ACTIVATION_HIT] = 25;
        average[level._PATCH_MAX_ACTIVATION_HIT] = 45;
        update_average( average );
        recalculate_average( average );
        level.has_removed_raygun = true;
    }
}

// scav
update_scav_average()
{
    if ( level.has_removed_scav == true )
    {
        return;
    }

    average = get_average( "sniper_explosive_zm" );
    
    // remove scav from weighted averages
    if ( level.round_number >= 88 )
    {
        average[level._PATCH_MIN_ACTIVATION_HIT] = 35;
        average[level._PATCH_MAX_ACTIVATION_HIT] = 40;
        update_average( average );
        recalculate_average( average );
        level.has_removed_scav = true;
    }
}

// m72 law
update_m72_law_average()
{
    if ( level.has_removed_m72_law == true )
    {
        return;
    }

    average = get_average( "m72_law_zm" );

    // make it less
    if ( level.round_number >= 80 )
    {
        average[level._PATCH_MIN_ACTIVATION_HIT] = 45;
        average[level._PATCH_MAX_ACTIVATION_HIT] = 59;
        update_average( average );
        recalculate_average( average );
        level.has_removed_m72_law = true;
    }
}