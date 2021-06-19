(import discord)
(import [discord.ext [commands]])
(import [cogs.commands [eval]])

(defclass Utility [commands.Cog]
    (defn __init__ [self bot]
        (.__init__ (super))
        (setv self.bot bot))
        
    #@((commands.command :description "Evaluate Lispy codes." :help "Ask Lloyd the brilliant for help in evaluating Lispy codes." :aliases ["interpret" "compile"])
        (defn/a eval [self ctx * [content ""]]
            (await (.execute eval self.bot ctx content)))))

(defn setup [bot]
    (.add_cog bot (Utility bot)))