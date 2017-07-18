# Mint-X-BetterBatt
Improved battery icons for Linux Mint. Based on the base Linux Mint theme.

This theme contains replacement battery icons for [Mate Power Manager](https://github.com/mate-desktop/mate-power-manager). The battery icons in the Mint-X icon set used by nearly all of the default Linux Mint themes (as of 18.1 Serena) are quite difficult to distinguish between the charged and discharged portion of the battery, specifically when it comes to the panel notification widget. The color used to indicate the charged portion of the battery is a gray that is only partially opaque.

The goal of the Mint-X-BetterBatt icon set was to provide a set of icons where the battery state was clearly visible, regardless of charge level, with an easy to spot charging indicator.

## Installation

  1. Install the icons:
```bash
$ git clone https://github.com/QBFreak/Mint-X-BetterBatt.git
$ cd Mint-X-BetterBatt
$ sudo cp -r Mint-X-BetterBatt/ /usr/share/icons/
```
  2. Menu -> Preferences -> Appearance *OR* Run `mate-appearance-properties`
  3. From the `Theme` tab, click the `Customize` button
  4. From the `Icons` tab, select `Mint-X-BetterBatt`
  5. Click `Close` to close the **Customize Theme** window
  6. Click `Close` to close the **Appearance Preferences** window
