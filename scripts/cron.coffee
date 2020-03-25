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
    seed = Math.floor(Math.random() * list.length)
    send '#workday', """
20時になりました！今日もお疲れさまです:+1:
`#{list[seed]}`
"""
  ).start()

list = [
  '常に謙虚に、常に学び続ける - Be huble and keep learning.（社訓）',
  '世の中に我れぞ悟ると自慢して 名利求むる人の多さよ（一休宗純）',
  '経文に気をとらわれてこだわりすぎると、有害なものになる。私も経にとらわれてしまって、犬や猫にも及ばない。犬でさえ仏殿に向かって、何の迷いもなく小便を引っ掛けるのに。（一休宗純）',
  '門松は冥土の旅の一里塚、めでたくもあり、めでたくもなし（一休宗純）',
  '花は桜木、人は武士、柱は桧、魚は鯛、小袖はもみじ、花はみよしの（一休宗純）',
  '袈裟が有り難く見えるのは、在家の他力本願（一休宗純）',
  'いつの時代も変わり者が世の中を変える。異端者を受け入れる器量が武将には必要である（織田信長）',
  'およそ勝負は時の運によるもの、計画しても必ず勝てるものではない。功名は武士の本意とは言え、そのあり方によるものだ（織田信長）',
  '家に貢献してくれるのは「優秀な者」よりも「能力は並の上だが、忠実な者」の方だ（織田信長）',
  '戦に勝てるかどうかと兵力は必ずしも比例しない。比例するかそうでないかは戦術、つまり自身にかかっているのだ。（織田信長）',
  '理想を持ち、信念に生きよ。理想や信念を見失った者は、戦う前から負けていると言えよう。そのような者は廃人と同じだ。（織田信長）',
  '戦死を好むのは匹夫である。将たる者は、命の危険を逃れて、何度も戦いを重ねることこそ本意とするものだ。（石田三成）',
  '住職は弟子の持つ智恵や能力を検討せずに、勝手に寺を譲ってはならない（今川義元）',
  '寄親は今川家への奉公を第一に心がけ、与力にもそう言葉かけよ（今川義元）',
  '昨日なし　明日またしらぬ人はただ　今日のうちこそ命なりけれ（今川義元）',
  '人の上に立つ者の一言は、深き思慮を伴っていなければならない。軽率な発言などもってのほかである。（上杉謙信）',
  '我は兵を以て戦ひを決せん。塩を以て敵を屈せしむる事をせじ。（上杉謙信）',
  '武士の子は、十四、五歳の頃までは、わがままであっても勇気を育て、臆する気持ちを持たせぬようにせよ。勇気のある父を持つ子は臆する心を持たぬ。父は常々この道を説き諭すことが大事である。（上杉謙信）',
  '大事なのは義理の二字である。死ぬべきに当たってその死をかえりみず、生きる道においてその命を全うし、主人に先立つ、これこそ武士の本意である。（上杉謙信）',
  '負けまじき軍に負け、亡ぶまじき家の亡ぶるを、人みな天命と言う。それがしに於いては天命とは思はず、みな仕様の悪しきが故と思うなり。（武田信玄）',
  '一生懸命だと知恵が出る、中途半端だと愚痴が出る、いい加減だと言い訳が出る（武田信玄）',
  '為せば成る、為さねば成らぬ成る業を成らぬと捨てつる人のはかなき（武田信玄）',
  '人は城、人は石垣、人は堀、情けは味方、仇は敵なり。（武田信玄）',
  '人の一生は、重荷を負うて遠き道をゆくがごとし。急ぐべからず。（徳川家康）',
  '世におそろしいのは、勇者ではなく、臆病者だ（徳川家康）',
  '人生に大切なことは、五文字で言えば『上を見るな』七文字で言えば『身のほどを知れ』（徳川家康）',
  'いさめてくれる部下は、一番槍をする勇士より値打ちがある。（徳川家康）',
  'われ志を得ざるとき忍耐この二字を守れり。われ志を得んとするとき大胆不敵この四字を守れり。われ志を得てのち油断大敵この四字を守れり。（徳川家康）',
  '財産を貯め込むのは、良い人材を牢に押し込むようなものだ。（豊臣秀吉）',
  '障子を開けてみよ。外は広いぞ。（豊臣秀吉）',
  '猿・日吉丸・藤吉郎・秀吉・大閤、これも又皆が嫌がるところでの我慢があったればこそ。（豊臣秀吉）',
  'いつも前に出ることがよい。そして戦のときでも先駆けるのだ。（豊臣秀吉）',
  '神仏を敬い、 神仏に頼らず。（宮本武蔵）',
  '千日の稽古をもって鍛となし、万日の稽古をもって錬となす。（宮本武蔵）',
  '人のまねをせずに、その身に応じ、武器は自分の使いやすいものでなければならぬ。（宮本武蔵）',
  '空を道とし、道を空とみる（宮本武蔵）',
  'この矢一本なれば、最も折りやすし。しかれども一つに束ぬれば、折り難し。汝ら、これに鑑みて、一和同心すべし。必ずそむくなかれ（毛利元就）',
  '一年の計は春にあり 一月の計は朔にあり 一日の計は鶏鳴にあり（毛利元就）',
  '日も同じくし、力も同じくし、心も同じくすれば何事も成し遂げられる（毛利元就）',
  '天下をとるのを目指していない（毛利元就）',
  '十万石では不忠者にならぬが一国では不忠者になるとお思いか（真田幸村）',
  '今はこれで戦は終わり也。あとは快く戦うべし。狙うは徳川家康の首ただひとつのみ（真田幸村）',
  '定めなき浮世にて候へば、一日先は知らざる事に候（真田幸村）',
  '人の死すべき時至らば、潔く身を失いてこそ勇士の本意なるべし（真田幸村）',
  '油を注ぐときに漏斗を使わず、一文銭の穴に通してみせます。『油がこぼれたら』お代は頂きません（斉藤道三）',
  'その職にふさわしくない者はすぐに処分したりするが、よく考えてみると、その役を十分に務めてくれるだろうと見たのはその主だ。目利き違いなのだから、主の罪は臣下よりもなお重い。（黒田官兵衛）',
  '私一人の注意では、多くの家来たちに届くまいから、見のがすことも多いだろう。よくないことがあったなら、遠慮なく早く知らせてほしい。（黒田官兵衛）',
  'まず自分の行状を正しくし、理非賞罰をはっきりさせていれば、叱ったり脅したりしなくても、自然に威は備わるものだ。（黒田官兵衛）',
  'おまえは時々、部下を夏の火鉢やひでりの雨傘にしている。改めよ。（黒田官兵衛）',
  '神の罰より主君の罰おそるべし。主君の罰より臣下の罰おそるべし。（黒田官兵衛）',
  '普段から武士道の心がけを練っていなかったならば、いざという場合に潔く死ぬことはできにくいものだ。よくよく心を武に刻むことが肝要である。（加藤清正）',
  '乱舞は一切停止する。太刀や刀をとれば人を斬ろうという心が起こるのが、武士として当り前のことであるから、武芸のほかにやたらに刀を抜いて乱舞するような者に対しては、切腹を申しつける。（加藤清正）',
  '軍の礼法として侍が心得ねばならないのは、いらないところに儀礼を好んではならないことである。（加藤清正）',
  '上一人の気持ちは、下万人に通ずる。（加藤清正）',
]
