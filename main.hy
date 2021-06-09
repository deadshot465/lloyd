(import os)
(import discord)
(import dotenv)
(import [discord.ext [commands]])

(setv intents (discord.Intents.default))
(setv intents.members True)

(dotenv.load_dotenv)
(setv prefix (os.getenv "PREFIX"))
(setv bot (commands.Bot :command_prefix prefix :intents intents))
(setv extensions ["cogs.info"])

#@(bot.event (defn/a on_ready [] (print "Logged on as" bot.user)
                                 (setv game (discord.Game "Architecting"))
                                 (await (bot.change_presence :activity game :status discord.Status.online))
                                 (return)))
#@(bot.event (defn/a on_message [message]
    (if (= message.author.bot False)
        (if-not (= message.guild None)
                (await (bot.process_commands message))
                (return)))))

(if (= __name__ "__main__")
    (for [ext extensions]
        (.load_extension bot ext))
    (print "Extensions successfully loaded."))

(bot.run (os.getenv "TOKEN") :bot True :reconnect True)