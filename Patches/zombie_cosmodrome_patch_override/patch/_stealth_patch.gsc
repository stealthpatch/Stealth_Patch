#include maps\_utility;
#include common_scripts\utility;
#include maps\_zombiemode_utility;

init()
{
    level.stealth_patch_map = "zombie_cosmodrome";

    if ( level.script != level.stealth_patch_map )
    {
        level thread get_the_fuck_off_this_map();
        return;
    }

    patch\_stealth_trades::init();
    patch\_weighted_setup::init();
}

get_the_fuck_off_this_map()
{
    while (1)
    {
       IPrintLnBold( "THIS IS MEANT FOR " + get_map_name( level.stealth_patch_map ) + " ONLY" );
    }
}

get_map_name( map_name )
{
    switch ( map_name )
    {
        case "zombie_theater":
            return "KINO DER TOTEN";

        case "zombie_pentagon":
            return "FIVE";

        case "zombie_cosmodrome":
            return "ASCENSION";
        
        case "zombie_coast":
            return "CALL OF THE DEAD";

        case "zombie_temple":
            return "SHANGRI-LA";

        case "zombie_moon":
            return "MOON";

        case "zombie_cod5_prototype":
            return "NACHT";

        case "zombie_cod5_asylum":
            return "VERRUCKT";

        case "zombie_cod5_sumpf":
            return "SHI NO NUMA";

        case "zombie_cod5_factory":
            return "DER RIESE";

        default:
            return "NO MAP NAME";
    }
}