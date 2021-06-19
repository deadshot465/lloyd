(import discord)
(import [utils.constants [HY-LOGO LLOYD-COLOR STAR-ICON]])

(defn/a execute [ctx]
    (setv embed (.Embed discord :color LLOYD-COLOR :description "Lloyd is inspired by the upcoming visual novel Camp Buddy: Scoutmaster's Season by [BLits Games](https://www.blitsgames.com/).\nLloyd version 0.2.0 was made and developed by:\n**Tetsuki Syu#1250**\nWritten with:\n[Hy](https://github.com/hylang/hy) and [discord.py](https://github.com/Rapptz/discord.py) library."))
    (.set_footer embed :text "Lloyd Bot: Release 0.2.0 | 2021-06-19")
    (.set_author embed :name "Lloyd from Camp Buddy" :icon_url STAR-ICON)
    (.set_thumbnail embed :url HY-LOGO)
    (await (.send ctx :embed embed)))