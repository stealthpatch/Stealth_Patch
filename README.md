# StealthPatch
Load any patch for Black Ops that you want, completely undetected.

Based on [LinkerMod](https://github.com/Nukem9/LinkerMod).

## Installation
Extract `stealth_patch.zip` to the root of your Steam game folder, and run `BO_Patch.bat`, this will memory patch your game to load the stealth patches.

<details>
  <summary><h2>What is the Stealth Patch? (click me)</h2></summary>
  The stealth patch is a patch that is completely undetectable.
  
  How it works is it loads game files on top of the original ones, meaning any differences when using decompiled game files are now irrelevant.
</details>

<details>
  <summary><h2>What patches are compatible? (click me)</h2></summary>
  
  Previously created map patches will work, however it is recommended that you use the stealth patch for the map you want to play provided with the [latest release](https://github.com/BlackOpsModding/StealthPatch/releases/latest), they will give the best results.
</details>

<details>
  <summary><h2>Where do the Stealth Patches go? (click me)</h2></summary>
  
  They go in the `zone/Common` directory of your Steam game folder.
</details>

<details>
  <summary><h2>Patch changes (click me)</h2></summary>
  
  What do the patches change? Well, since there are many, every listed detail for every map stealth patch will be listed below.

<details>
  <summary><h2>Stealth Trades (click me)</h2></summary>

  Across each map, we have created dvars that will give you the weapon you desire from the box, and how you can use this is with keybinds just like you would with changing FOV or FPS.
  
  **Essentially, this allows you to control your trade average at any point in the game on or beyond the round required set in the patch.**
  
  As an example, for Nacht Der Untoten with the Thundergun:
  
  In your config you would put:
  ```
  bind (key) "cg_stealthGiveThundergun 1"
  ```
  
  Once you press that key, the next box spin will be the Thundergun.
</details>

<details>
  <summary><h3> Kino Der Toten (Click me) </h3></summary>
  
  - Weighted setup, chances of getting a weapon for the setup from the box is 15%.
  
  #### Stealth Trade Dvars
  Stealth trading kicks in on round 50.
  - Thundergun: `bind (key) "cg_stealthGiveThundergun 1"`
  - Crossbow: `bind (key) "cg_stealthGiveCrossbow 1"`
</details>

<details>
  <summary><h3> "FIVE" (Click me) </h3></summary>

  - Weighted setup, chances of getting a weapon for the setup from the box is 15%.
  <!--- - Every time you pull the elevator, you have a 15% chance to get windows set. -->
</details>

<details>
  <summary><h3> Ascension (Click me) </h3></summary>
  
  - Weighted setup, chances of getting a weapon for the setup from the box is 10%.

  #### Stealth Trade Dvars
  Stealth trading kicks in on round 50.
  - Thundergun: `bind (key) "cg_stealthGiveThundergun 1"`
  - Crossbow: `bind (key) "cg_stealthGiveCrossbow 1"`
  - Gershes: `bind (key) "cg_stealthGiveGershes 1"`
  - Dolls: `bind (key) "cg_stealthGiveDolls 1"`
</details>

<details>
  <summary><h3> Call of The Dead (Click me) </h3></summary>
  
  - Weighted setup, every hit the chances of getting a weapon for the setup from the box is 15%.
  - During the entire game, the following has been changed with the perk drop:
    - For every perk you do not have, you have a good chance of getting a good perk, this is the order it will TRY to give in (not guaranteed): `Juggernog, Mule Kick, Quick Revive, Double Tap, PHD, Staminup, Speed Cola, Deadshot`.
  
  #### Stealth Trade Dvars
  Stealth trading kicks in on round 50.
  - Ray Gun: `bind (key) "cg_stealthGiveRayGun 1"`
  - M72 Law: `bind (key) "cg_stealthGiveM72Law 1"`
  - Scavenger: `bind (key) "cg_stealthGiveScavenger 1"`
  - VR11: `bind (key) "cg_stealthGiveVR11 1"`
  - Crossbow: `bind (key) "cg_stealthGiveCrossbow 1"`
</details>

<details>
  <summary><h3> Shangri-La (Click me) </h3></summary>
  
  - Weighted setup, every hit the chances of getting a weapon for the setup from the box is 15%.
  
  #### Stealth Trade Dvars
  Stealth trading kicks in on round 70.
  - Shrink Ray: `bind (key) "cg_stealthGiveShrinkRay 1"`
  - Crossbow: `bind (key) "cg_stealthGiveCrossbow 1"`
</details>

<details>
  <summary><h3> Moon (Click me) </h3></summary>

  - Weighted setup, every hit the chances of getting a weapon for the setup from the box is 15%.
  
  #### Stealth Trade Dvars
  Stealth trading kicks in on round 50.
  - Wave Gun: `bind (key) "cg_stealthGiveWaveGun 1"`
  - QED: `bind (key) "cg_stealthGiveQED 1"`
  - Gershes: `bind (key) "cg_stealthGiveGershes 1"`
</details>

<details>
  <summary><h3> Nacht Der Untoten (Click me) </h3></summary>

  - Weighted setup, chances of getting a weapon for the setup from the box is 20%.
  
  #### Stealth Trade Dvars
  Stealth trading kicks in on round 50.
  - Thundergun: `bind (key) "cg_stealthGiveThundergun 1"`
</details>

<details>
  <summary><h3> Verruckt (Click me) </h3></summary>

  - Weighted setup, every hit the chances of getting a weapon for the setup from the box is 15%.
</details>

<details>
  <summary><h3> Shi No Numa (Click me) </h3></summary>
  
  - Weighted setup, every hit the chances of getting a weapon for the setup from the box is 15%.
</details>

<details>
  <summary><h3> Der Riese (Click me) </h3></summary>

  - Weighted setup, chances of getting a weapon for the setup from the box is 10%.
  
  #### Stealth Trade Dvars
  Stealth trading kicks in on round 50.
  - Waffe: `bind (key) "cg_stealthGiveWaffe 1"`
  - Crossbow: `bind (key) "cg_stealthGiveCrossbow 1"`
</details>
</details>
