(import discord)
(import [discord.ext [commands]])
(import [cogs.commands [owoify]])

(defclass Fun [commands.Cog]
    (defn __init__ [self bot]
        (.__init__ (super))
        (setv self.bot bot))
        
    #@((commands.command :description "Ask Lloyd for help in owoifying your text." :help "Turns your sentences and texts to nonsensical babyspeaks." :aliases [])
        (defn/a owoify [self ctx level * [text ""]]
            (await (.execute owoify ctx level text))))
)

(defn setup [bot]
    (.add_cog bot (Fun bot)))