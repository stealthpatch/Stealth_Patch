#include maps\_utility;
#include common_scripts\utility;
#include maps\_zombiemode_utility;

init()
{
    if ( level.script != "zombie_coast" )
    {
        level thread get_the_fuck_off_this_map();
        return;
    }

    patch\_weighted_trades::init();
    patch\_weighted_setup::init();
    patch\_weighted_random_perks::init();
    patch\_cotd_drop_cycle::init();
}

get_the_fuck_off_this_map()
{
    while (1)
    {
       IPrintLnBold( "THIS IS MEANT FOR CALL OF THE DEAD ONLY" );
    }
}