#include maps\_utility;
#include common_scripts\utility;
#include maps\_zombiemode_utility;

init()
{
    jug = "specialty_armorvest";
    mule = "specialty_additionalprimaryweapon";
    qr = "specialty_quickrevive";
    dt = "specialty_rof";
    phd = "specialty_flakjacket";
    stam = "specialty_longersprint";
    speed = "specialty_fastreload";
    deadshot = "specialty_deadshot";
    
    level.weighted_random_perks = array( 
        jug, mule, qr, dt, phd, stam, speed, deadshot
    );
    level.weighted_random_perk_chance = 15; // originally 10
}

should_give_weighted_perk()
{
    rand = RandomInt( 100 );

    if ( rand <= level.weighted_random_perk_chance )
    {
        return true;
    }

    return false;
}

get_next_weighted_perk( player )
{
    for( i = 0; i < level.weighted_random_perks.size; i++ )
    {
        perk = level.weighted_random_perks[i];

        if ( !player HasPerk( perk ) )
        {
            return perk;
        }
    }

    return "";
}