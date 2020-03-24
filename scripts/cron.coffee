cronJob = require('cron').CronJob

module.exports = (robot) ->
  send = (channel, msg) ->
    robot.send { room: channel }, msg

  new cronJob('0 0 12 * * 1-5', () ->
    send '#workday', """
お疲れさまです！今日のあなたの想いを共有しましょう！

```
(k) 良かったこと
(p) 悩んでいること
(t) ひとこと
(f) 失敗したこと
```
"""
  ).start()

  new cronJob('0 0 20 * * 1-5', () ->
    send '#workday', """
20時になりました！今日もお疲れさまです！:+1:
`常に謙虚に、常に学び続ける - Be huble and keep learning.`
"""
  ).start()

