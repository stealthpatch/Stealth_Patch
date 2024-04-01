# StealthPatch
Load any patch for Black Ops that you want, completely undetected.

Based on [LinkerMod](https://github.com/Nukem9/LinkerMod).

## Installation
Extract `stealth_patch.zip` to the root of your Steam game folder, and run `BO_Patch.bat`, this will memory patch your game to load the stealth patches.

### What Patches are compatible?
Previously created map patches will work, however it is recommended that you use the universal stealth patch for the map you want to play provided with the [latest release](https://github.com/BlackOpsModding/StealthPatch/releases/latest), they will give the best results.

### Where do the Universal Stealth Patches go?
They go in the `zone/Common` directory of your Steam game folder.

## Patch changes
What do the patches change? Well, since there are many, every listed detail for every map stealth patch will be listed below.

#### Weighted Trade Averages
- Added artificial good trades.
- Added random artificial one hit trades.
- You can get naturally good trades from the game.

### Kino Der Toten (`zombie_theater_patch_override.ff`)
- Increased odds for box location to be either fire trap room or dressing room, it's 50/50 if the weight sets in.
- Weighted setup, chances of getting a weapon for the setup from the box is 15%.
- Drop cycle will always make sure double maxes will not happen.
- Weighted Thundergun average: `19-21` hits, has 1% chance to get a 40-110 hit trade.
- Weighted Crossbow average: `25-30` hits.

### "FIVE" (`zombie_pentagon_patch_override.ff`)
- Weighted setup, chances of getting a weapon for the setup from the box is 15%.
- Drop cycle will always make sure double maxes will not happen.
- Every time you pull the elevator, you have a 15% chance to get windows set.

### Ascension (`zombie_cosmodrome_patch_override.ff`)
- Weighted setup, chances of getting a weapon for the setup from the box is 20%.
- Drop cycle will always make sure double maxes will not happen.
- Monkeys are less likely to go for Staminup.
- Before round 70, if you do not have PHD Flopper, that is the next perk you will get from the monkeys.
- Weighted Thundergun average: `17 - 21` hits.
- Weighted Crossbow average: `25-30` hits.
- During the setup, the following has been changed with the perk drop:
  - First drop has better chance to give you Juggernog.
  - Second drop has better chance to give you Speed Cola.

### Call of The Dead (`zombie_coast_patch_override.ff`)
- Weighted setup, chances of getting a weapon for the setup from the box is 15%.
- Drop cycle will always make sure double maxes will not happen.
- During the entire game, the following has been changed with the perk drop:
  - For every perk you do not have, you have a good chance of getting a good perk, this is the order it will TRY to give in (not guaranteed): `Juggernog, Mule Kick, Quick Revive, Double Tap, PHD, Staminup, Speed Cola, Deadshot`.
- Weighted Trade Averages for the `Ray Gun, Scavenger, M72 Law and VR11`. These weapons' averages will dynamically update as you progress through the game.

### Shangri-La (`zombie_temple_patch_override.ff`)

### Moon (`zombie_moon_patch_override.ff`)

### Nacht Der Untoten (`zombie_cod5_prototype_patch_override.ff`)

### Verruckt (`zombie_cod5_asylum_patch_override.ff`)

### Shi No Numa (`zombie_cod5_sumpf_patch_override.ff`)

### Der Riese (`zombie_cod5_factory_patch_override.ff`)
