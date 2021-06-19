(import discord)
(import [datetime [datetime]])

(defn/a execute [ctx]
    (setv start-time (.now datetime))
    (setv bot ctx.bot)
    (setv message (await (.send ctx "🏓 Pinging...")))
    (setv end-time (.now datetime))
    (setv elapsed (round (* 1000 (.total_seconds (- end-time start-time))) 3))
    (setv heartbeat-latency bot.latency)
    (await (.edit message :content f"🏓 Pong!\nLatency is: {elapsed}ms. Heartbeat latency is: {(round (* heartbeat-latency 1000) 3)}ms.")))