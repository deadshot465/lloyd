(import discord)
(import [discord.ext [commands]])
(import [cogs.commands [about ping]])

(defclass Info [commands.Cog]
    (defn __init__ [self bot]
        (.__init__ (super))
        (setv self.bot bot))
        
    #@((commands.command :description "Check the information of Lloyd." :help "The information about Lloyd, e.g. authors, version number, etc." :aliases ["credits"])
        (defn/a about [self ctx]
            (await (.execute about ctx))))

    #@((commands.command :description "Returns the ping value of Lloyd." :help "Ping Lloyd and check if Lloyd is still online and how fast he responds." :aliases ["pong"])
        (defn/a ping [self ctx]
            (await (.execute ping ctx))))
)

(defn setup [bot]
    (.add_cog bot (Info bot)))