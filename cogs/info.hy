(import discord)
(import [discord.ext [commands]])
(import [utils.constants [HY_LOGO LLOYD_COLOR STAR_ICON]])
(import [datetime [datetime]])

(defclass Info [commands.Cog]
    (defn __init__ [self bot]
        (.__init__ (super))
        (setv self.bot bot))
        
    #@((commands.command :description "Check the information of Lloyd." :help "The information about Lloyd, e.g. authors, version number, etc." :aliases ["credits"])
        (defn/a about [self ctx]
            (setv avatar_url (str self.bot.user.avatar_url))
            (setv embed (discord.Embed :color LLOYD_COLOR :description "Lloyd is inspired by the upcoming visual novel Camp Buddy: Scoutmaster's Season by [BLits Games](https://www.blitsgames.com/).\nLloyd version 0.0.1 was made and developed by:\n**Tetsuki Syu#1250**\nWritten with:\n[Hy](https://github.com/hylang/hy) and [discord.py](https://github.com/Rapptz/discord.py) library."))
            (.set_footer embed :text "Lloyd Bot: Release 0.1.1 | 2021-06-15")
            (.set_author embed :name "Lloyd from Camp Buddy" :icon_url STAR_ICON)
            (.set_thumbnail embed :url HY_LOGO)
            (await (.send ctx :embed embed))))

    #@((commands.command :description "Returns the ping value of Lloyd." :help "Ping Lloyd and check if Lloyd is still online and how fast he responds." :aliases ["pong"])
        (defn/a ping [self ctx]
            (setv start_time (.now datetime))
            (setv bot ctx.bot)
            (setv message (await (.send ctx "🏓 Pinging...")))
            (setv end_time (.now datetime))
            (setv elapsed (round (* 1000 (.total_seconds (- end_time start_time))) 3))
            (setv heartbeat_latency bot.latency)
            (await (.edit message :content f"🏓 Pong!\nLatency is: {elapsed}ms. Heartbeat latency is: {(round (* heartbeat_latency 1000) 3)}ms."))))
)

(defn setup [bot]
    (.add_cog bot (Info bot)))