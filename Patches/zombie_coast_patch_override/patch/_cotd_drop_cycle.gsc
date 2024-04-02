init()
{

}

filter_out_double_maxes( drop_cycle )
{
    // the cycle will always have at least 5 drops when power is on
    // with this taken into account, we want the max to be not first
    // but at least in the first few drops of the cycle if max is first
    if ( drop_cycle[0] == "full_ammo" )
    {
        target_drop = drop_cycle[2]; // store the target drop which is the 3rd slot
        drop_cycle[0] = drop_cycle[2]; // place the max ammo in the target slot of the cycle
        drop_cycle[0] = target_drop; // place the target drop in the first slot of the cycle
    }

    // since the game will skip the drops it doesnt want, 
    // the first drop in the cycle doesnt matter since it will be skipped if its a bullshit drop.
    return drop_cycle;
}