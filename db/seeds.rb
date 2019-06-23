# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


[
  { name: '#civictechjp' },
  { name: '#civictechjp #ctfc' },
  { name: '#civictechjp #ctfb' }
].each do |tag|
  Tag.find_or_create_by(name: tag[:name])
end

def head(pos, tag)
  "【CTF2019｜#{pos}】 #{tag} \n"
end


theme = 'カフェ｜社会課題とシビックテック'
tag   = Tag.find_by(name: '#civictechjp #ctfc')
[
  '',
  '友次進さん シニアとスマホのステキな関係2',
  '島野勝弘さん 田舎でやってみた！大人向けICT講座と親子プログラミング教室',
  '雪下海香さん 現代の労働課題 コールセンター業界の発展のために',
  '白松俊さん 市民が人工知能研究者とコラボする場を提供します！',
  '山田英二さん 琵琶湖畔から始まる市民活動の和・輪・環 個々の市民活動が繋がり',
  '古川和年さん シビックテック活動報告と2019年度feeseプロジェクト取組',
  '神原咲子さん シビックテックが災害時の健康を守る',
  '中井寿雄さん 人工呼吸器が必要な子どもと養護者と取り組む災害への備え対策'
].each do |name|
  text = "#{head(theme, tag.name)}#{name}"
  Template.find_or_create_by(name: name.split(' ')[0], text: text).tags << tag
end


theme = '文楽｜ソーシャルビジネス'
tag   = Tag.find_by(name: '#civictechjp #ctfb')
[
  '',
  '井上貢さん シビックパワーバトル・ワークショップ編',
  '廣田達宣さん 10人の声で政策を動かそう！スマホで出来るロビイング講座 by issues',
  '横張寿希さん 子育てを一人にしない！Line botでつなぐ子育ての輪！！',
  '山田洋志さん 不審者・治安情報サービス「ガッコム安全ナビ」の取組 ～地域で見守る社会を目指して～',
  '小俣博司さん 身近に感じて考えるオープンデータの利活用方法',
  '矢澤修さん 障がい・難病当事者とご家族を支援するプラットフォーム「イースマイリー」について',
  '滝沢光さん Peatixを活用した災害ボランティアセンター効率化の取組',
  '太田恒平さん 標準的バス情報フォーマット ～国を巻き込み広がったプロセスと今後の展開～',
].each do |name|
  text = "#{head(theme, tag.name)} #{name}"
  Template.find_or_create_by(name: name.split(' ')[0], text: text).tags << tag
end

theme = 'カフェ｜コミュニティとシビックテック'
tag   = Tag.find_by(name: '#civictechjp #ctfc')
[
  '富永哲欣さん 小平あたりでCivicTechをはじめて',
  '澤田学さん みんなでつくる"ゆきみらい"雪に特化したシビックテックコミュニティを立ち上げました',
  '白澤美幸さん "ちばをその気にさせてみた！？ ご当地版シビックテックアライアンスでできること"',
  '德永美紗さん Code for Fukuokaが目指すもの',
  '本多健一さん 空き家と金魚とシビックテック',
  '斎藤百合恵さん だから“意識の低さ”が大事 ～シビックテックを力尽きさせないために～',
  '栃窪淳さん 代表者のいない組織',
  '辰己学さん ”おじさん”を巻き込め ～生駒市でCivitTechのクリティカルマスを目指して～',
].each do |name|
  text = "#{head(theme, tag.name)} #{name}"
  Template.find_or_create_by(name: name.split(' ')[0], text: text).tags << tag
end

theme = '文楽｜GovTech・公共とシビックテック'
tag   = Tag.find_by(name: '#civictechjp #ctfb')
[
  '酒井一樹さん METI DXの、今までとこれから',
  '新庄大輔さん 大型イベントデータのオープン化',
  '渡邊亮輔さん 行政をハックし行政データをオープンにしてみようとした結果',
  '及川涼介さん 行政を内側からハックする！mokubaの試行錯誤',
  '羽鳥健太郎さん 地域産業振興のためのシビックテック',
  '相川梓さん 中野区×子育て×TECH×リアル',
  '杉本直也さん ソウハツする「遊び場」としての「VIRTUAL SHIZUOKA」',
  '加藤たけしさん 官×民 複業で切り拓くトライセクターの新しい働き方',
].each do |name|
  text = "#{head(theme, tag.name)} #{name}"
  Template.find_or_create_by(name: name.split(' ')[0], text: text).tags << tag
end

theme = 'カフェ｜シビックテック観'
tag   = Tag.find_by(name: '#civictechjp #ctfc')
[
  '関治之さん 「ともにつくる」ことで信頼を築こう',
  '友金良太さん YouTuber×AIエンジニアのパラレルキャリアを活かした私のシビックテック',
  '鈴木まなみさん 発信することでつながる世界',
  'あまのさんさん フェアユースから考えるアメリカの社会哲学感について',
  '白川展之さん シビックテックとオープンサイエンス',
  '伊藤侑果さん ただの主婦が「IoT推進コーディネーター」になった話',
  '福島健一郎さん シビックテックと持続可能性について',
  '佐藤拓也さん 地域のシビックテックが目指す形とは',
].each do |name|
  text = "#{head(theme, tag.name)} #{name}"
  Template.find_or_create_by(name: name.split(' ')[0], text: text).tags << tag
end

theme = '文楽｜シビックテックとプロダクト'
tag   = Tag.find_by(name: '#civictechjp #ctfb')
[
  '今村かずきさん “信頼”のプラットフォームをめざして ～CatBot α版とその未来～',
  'ふぁらお加藤さん 俺とha4goとCTAC',
  '菅原洋介さん 石巻バリアフリーマップ',
  '三浦耕生さん お手軽にRPA',
  '河中祥吾さん 学校給食献立オープンデータ標準化への取組',
  'ヨッシーさん アナログゲーム「シビックテッカーズ」',
  '五十嵐康伸さん 「プロ直伝 伝わるデータ・ビジュアル術」執筆プロジェクトの裏話',
  '小比類巻大和さん 帰ってきたハッカソン好きがIT業界と縁遠い保育園でアイデアソンなどやってみた話',
].each do |name|
  text = "#{head(theme, tag.name)} #{name}"
  Template.find_or_create_by(name: name.split(' ')[0], text: text).tags << tag
end
