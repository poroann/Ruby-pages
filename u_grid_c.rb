#!/usr/local/bin/ruby
print "Content-type:text/html\n\n"


#html=DATA.read
html=<<EOS
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<meta name="description" content="">
<meta name="keywords" content="">
<link rel="short icon" href="/ico.png">
<title>%title%</title>
<style>%css%</style>
</head>
<body>
<header>%header%</header>
<nav>%nav%</nav>
<main>%本文%</main>
<footer>%footer%</footer>
<script>
</script>
</body>
</html>
EOS


pg_mei=File.basename(__FILE__,".rb")


css=<<EOS
   body{
      background-color:white;}
   article{
      height:100%;
      font-size:100px;}
   footer{
      display:flex;
      justify-content:center;
      padding:5px;
      background-color:gray;}
   #qr{
      width:100px;}
   #tw{
      width:30px;}
   .group{
      display:grid;
      grid-template-columns:repeat(6,1fr);
      background-color:#eee;
      padding:10px;}
   .item{
      width:100px;
      height:80px;
      padding:10px;
      margin:10px;
      font-size:10px;
      color:black;
      background-color:#eee;
      border-radius:5px;}
EOS

#      grid-template-columns:repeat(8,1fr);
#      grid-template-rows:repeat(8,1fr);


header=<<EOS
<h1>Country</h1>
<p>一覧</p>データは<a href="https://www.mofa.go.jp/mofaj/kids/kokki/index.html">キッズ外務省</a>より
<hr>
EOS

nav=<<EOS
<p></p>
EOS

footer=<<EOS
<img src='#{pg_mei}.png' id='qr'>
<p>twitter link</p>
<a href='https://twitter.com/poroann'><img src='./img/Twitter social icons - circle - blue.png' id='tw'></a>
EOS


b_url="https://www.mofa.go.jp/mofaj/kids/kokki/"   #外務省

w=DATA.read          # ﾖﾐﾄﾘ
ww=w.split(/\R/)

text="<div class='group'>\n"
ww.each do |t|
   begin 
      /src="(.*)"\swidth="(.*)"\sheight="(.*?)"(?:.*)smaller">(.*)<\/span>/ =~ t
      if $4==nil then
         /src="(.*)"\swidth="(.*)"\sheight="(.*?)"(?:.*)<p>(.*)<\/p>/ =~ t
      end
      m=$4
      if m.include?("<br>") then
        m=m.slice!(0,m.index("<br>"))
      end
      if !($1==nil) then
         #text+=" #{$1} #{$2} #{$3} #{m}<br>\n"
         img_url=b_url+$1     #画像
         w=$2
         h=$3
         mei=m
         
         text+="<div class='item'><img src=#{img_url} width='#{w}' height='#{h}'><br><span>#{mei}</span></div>\n"
         
      end
   rescue
   end
   
end
text+="</div>\n"


html.gsub!("%css%","\n"+css)
html.gsub!("%title%",pg_mei)
html.gsub!("%header%","\n"+header)
html.gsub!("%nav%","\n"+nav)
html.gsub!("%本文%","\n"+text)
html.gsub!("%footer%","\n"+footer)


print html



__END__
<li class="heightLine"><img src="image/a7.gif" width="85" height="57" alt="インド国旗"><p>インド</p></li>
<li class="heightLine"><img src="image/a8.gif" width="85" height="57" alt="インドネシア国旗"><p>インドネシア</p></li>
<li class="heightLine"><img src="image/a12.gif" width="85" height="57" alt="カンボジア国旗"><p>カンボジア</p></li>
<li class="heightLine"><img src="image/a18.gif" width="85" height="57" alt="シンガポール国旗"><p>シンガポール</p></li>
<li class="heightLine"><img src="image/a19.gif" width="85" height="57" alt="スリランカ国旗"><p>スリランカ</p></li>
<li class="heightLine"><img src="image/a20.gif" width="85" height="57" alt="タイ国旗"><p>タイ</p></li>
<li class="heightLine"><img src="image/a11.gif" width="85" height="57" alt="大韓民国（韓国）国旗"><p>大韓民国<br>（韓国）</p></li>
<li class="heightLine"><img src="image/a21.gif" width="85" height="57" alt="中華人民共和国（中国）国旗"><p>中華人民共和国<br>（中国）</p></li>
<li class="heightLine"><img src="image/a23.gif" width="85" height="57" alt="日本国旗"><p>日本</p></li>
<li class="heightLine"><img src="image/a24.gif" width="58" height="75" alt="ネパール国旗"><p>ネパール</p></li>
<li class="heightLine"><img src="image/a25.gif" width="85" height="57" alt="パキスタン国旗"><p>パキスタン</p></li>
<li class="heightLine"><img src="image/a27.gif" width="85" height="57" alt="バングラデシュ国旗"><p>バングラデシュ</p></li>
<li class="heightLine"><img src="image/et.gif" width="85" height="57" alt="東ティモール国旗"><p>東ティモール</p></li>
<li class="heightLine"><img src="image/a28.gif" width="85" height="57" alt="フィリピン国旗"><p>フィリピン</p></li>
<li class="heightLine"><img src="image/a29.gif" width="85" height="57" alt="ブータン国旗"><p>ブータン</p></li>
<li class="heightLine"><img src="image/a30.gif" width="85" height="57" alt="ブルネイ国旗"><p>ブルネイ</p></li>
<li class="heightLine"><img src="image/a31.gif" width="85" height="57" alt="ベトナム国旗"><p>ベトナム</p></li>
<li class="heightLine"><img src="image/a32.gif" width="85" height="57" alt="マレーシア国旗"><p>マレーシア</p></li>
<li class="heightLine"><img src="image/a33.gif" width="85" height="57" alt="ミャンマー国旗"><p>ミャンマー</p></li>
<li class="heightLine"><img src="image/a34.gif" width="85" height="57" alt="モルディブ国旗"><p>モルディブ</p></li>
<li class="heightLine"><img src="image/a35.gif" width="85" height="43" alt="モンゴル国旗"><p>モンゴル</p></li>
<li class="heightLine"><img src="image/a37.gif" width="85" height="57" alt="ラオス国旗"><p>ラオス</p></li>

<li class="heightLine"><img src="image/f1.gif" width="85" height="57" alt="アメリカ合衆国（米国）国旗"><p>アメリカ合衆国（米国）</p></li>
<li class="heightLine"><img src="image/f4.gif" width="85" height="57" alt="カナダ国旗"><p>カナダ</p></li>

<li class="heightLine"><img src="image/g1.gif" width="85" height="57" alt="アルゼンチン国旗"><br><p>アルゼンチン</p></li>
<li class="heightLine"><img src="image/f2.gif" width="85" height="57" alt="アンティグア・バーブーダ国旗"><br><span class="smaller">アンティグア・バーブーダ</span></li>
<li class="heightLine"><img src="image/g2.gif" width="85" height="57" alt="ウルグアイ国旗"><br><p>ウルグアイ</p></li>
<li class="heightLine"><img src="image/g3.gif" width="85" height="57" alt="エクアドル国旗"><br><p>エクアドル</p></li>
<li class="heightLine"><img src="image/f3.gif" width="85" height="57" alt="エルサルバドル国旗"><br><p>エルサルバドル</p></li>
<li class="heightLine"><img src="image/g4.gif" width="85" height="57" alt="ガイアナ国旗"><br><p>ガイアナ</p></li>
<li class="heightLine"><img src="image/f5.gif" width="85" height="57" alt="キューバ国旗"><br><p>キューバ</p></li>
<li class="heightLine"><img src="image/f6.gif" width="85" height="57" alt="グアテマラ国旗"><br><p>グアテマラ</p></li>
<li class="heightLine"><img src="image/f7.gif" width="85" height="57" alt="グレナダ国旗"><br><p>グレナダ</p></li>
<li class="heightLine"><img src="image/f8.gif" width="85" height="57" alt="コスタリカ国旗"><br><p>コスタリカ</p></li>
<li class="heightLine"><img src="image/g5.gif" width="85" height="57" alt="コロンビア国旗"><br><p>コロンビア</p></li>
<li class="heightLine"><img src="image/f9.gif" width="85" height="57" alt="ジャマイカ国旗"><br><p>ジャマイカ</p></li>
<li class="heightLine"><img src="image/g6.gif" width="85" height="57" alt="スリナム国旗"><br><p>スリナム</p></li>
<li class="heightLine"><img src="image/f10.gif" width="85" height="57" alt="セントクリストファー・ネーヴィス国旗"><br><span class="smaller">セントクリストファー・ネーヴィス</span></li>
<li class="heightLine"><img src="image/f11.gif" width="85" height="57" alt="セントビンセントおよびグレナディーン諸島国旗"><br><span class="smaller">セントビンセントおよびグレナディーン諸島</span></li>
<li class="heightLine"><img src="image/f12.gif" width="85" height="57" alt="セントルシア国旗"><br><p>セントルシア</p></li>
<li class="heightLine"><img src="image/g7.gif" width="85" height="57" alt="チリ国旗"><br><p>チリ</p></li>
<li class="heightLine"><img src="image/f13.gif" width="85" height="58" alt="ドミニカ国国旗"><br><p>ドミニカ</p></li>
<li class="heightLine"><img src="image/f14.gif" width="85" height="57" alt="ドミニカ共和国国旗"><br><p>ドミニカ共和国</p></li>
<li class="heightLine"><img src="image/f15.gif" width="85" height="57" alt="トリニダード・トバゴ国旗"><br><p>トリニダード・トバゴ</p></li>
<li class="heightLine"><img src="image/f16.gif" width="85" height="57" alt="ニカラグア国旗"><br><p>ニカラグア</p></li>
<li class="heightLine"><img src="image/f17.gif" width="85" height="57" alt="ハイチ国旗"><br><p>ハイチ</p></li>
<li class="heightLine"><img src="image/f18.gif" width="85" height="57" alt="パナマ国旗"><br><p>パナマ</p></li>
<li class="heightLine"><img src="image/f19.gif" width="85" height="57" alt="バハマ国旗"><br><p>バハマ</p></li>
<li class="heightLine"><img src="image/g8.gif" width="85" height="48" alt="パラグアイ国旗"><br><p>パラグアイ</p></li>
<li class="heightLine"><img src="image/f20.gif" width="85" height="57" alt="バルバドス国旗"><br><p>バルバドス</p></li>
<li class="heightLine"><img src="image/g9.gif" width="85" height="57" alt="ブラジル国旗"><br><p>ブラジル</p></li>
<li class="heightLine"><img src="image/g10.gif" width="85" height="57" alt="ベネズエラ国旗"><br><p>ベネズエラ</p></li>
<li class="heightLine"><img src="image/f21.gif" width="85" height="57" alt="ベリーズ国旗"><br><p>ベリーズ</p></li>
<li class="heightLine"><img src="image/g11.gif" width="85" height="57" alt="ペルー国旗"><br><p>ペルー</p></li>
<li class="heightLine"><img src="image/g12.gif" width="85" height="57" alt="ボリビア国旗"><br><p>ボリビア</p></li>
<li class="heightLine"><img src="image/f22.gif" width="85" height="57" alt="ホンジュラス国旗"><br><p>ホンジュラス</p></li>
<li class="heightLine"><img src="image/f23.gif" width="85" height="57" alt="メキシコ国旗"><br><p>メキシコ</p></li>

<li class="heightLine"><img src="image/d1.gif" width="85" height="57" alt="アイスランド国旗"><p>アイスランド</p></li>
<li class="heightLine"><img src="image/d2.gif" width="85" height="57" alt="アイルランド国旗"><p>アイルランド</p></li>
<li class="heightLine"><img src="image/e1.gif" width="85" height="57" alt="アゼルバイジャン国旗"><p>アゼルバイジャン</p></li>
<li class="heightLine"><img src="image/d3.gif" width="85" height="57" alt="アルバニア国旗"><p>アルバニア</p></li>
<li class="heightLine"><img src="image/e2.gif" width="85" height="57" alt="アルメニア国旗"><p>アルメニア</p></li>
<li class="heightLine"><img src="image/d4.gif" width="85" height="57" alt="アンドラ国旗"><p>アンドラ</p></li>
<li class="heightLine"><img src="image/d6.gif" width="85" height="57" alt="イタリア国旗"><p>イタリア</p></li>
<li class="heightLine"><img src="image/e3.gif" width="85" height="57" alt="ウクライナ国旗"><p>ウクライナ</p></li>
<li class="heightLine"><img src="image/e4.gif" width="85" height="57" alt="ウズベキスタン国旗"><p>ウズベキスタン</p></li>
<li class="heightLine"><img src="image/d5.gif" width="85" height="57" alt="英国国旗"><p>英国</p></li>
<li class="heightLine"><img src="image/d7.gif" width="85" height="57" alt="エストニア国旗"><p>エストニア</p></li>
<li class="heightLine"><img src="image/d8.gif" width="85" height="57" alt="オーストリア国旗"><p>オーストリア</p></li>
<li class="heightLine"><img src="image/d9.gif" width="85" height="57" alt="オランダ国旗"><p>オランダ</p></li>
<li class="heightLine"><img src="image/e5.gif" width="85" height="57" alt="カザフスタン国旗"><p>カザフスタン</p></li>
<li class="heightLine"><img src="image/d37.gif" width="85" height="57" alt="北マケドニア共和国国旗"><p><span class="smaller">北マケドニア共和国</span></p></li>
<li class="heightLine"><img src="image/a14.gif" width="85" height="57" alt="キプロス国旗"><p>キプロス</p></li>
<li class="heightLine"><img src="image/d10.gif" width="85" height="57" alt="ギリシャ国旗"><p>ギリシャ</p></li>
<li class="heightLine"><img src="image/e6.gif" width="85" height="57" alt="キルギス国旗"><p>キルギス</p></li>
<li class="heightLine"><img src="image/d11.gif" width="85" height="57" alt="クロアチア国旗"><p>クロアチア</p></li>
<li class="heightLine"><img src="image/d41.gif" width="85" height="57" alt="コソボ国旗"><p>コソボ</p></li>
<li class="heightLine"><img src="image/d12.gif" width="85" height="57" alt="サンマリノ国旗"><p>サンマリノ</p></li>
<li class="heightLine"><img src="image/e7.gif" width="85" height="57" alt="ジョージア国旗"><p>ジョージア</p></li>
<li class="heightLine"><img src="image/d13.gif" width="75" height="75" alt="スイス国旗"><p>スイス</p></li>
<li class="heightLine"><img src="image/d14.gif" width="85" height="57" alt="スウェーデン国旗"><p>スウェーデン</p></li>
<li class="heightLine"><img src="image/d15.gif" width="85" height="57" alt="スペイン国旗"><p>スペイン</p></li>
<li class="heightLine"><img src="image/d16.gif" width="85" height="57" alt="スロバキア国旗"><p>スロバキア</p></li>
<li class="heightLine"><img src="image/d17.gif" width="85" height="57" alt="スロベニア国旗"><p>スロベニア</p></li>
<li class="heightLine"><img src="image/d38.gif" width="85" height="57" alt="セルビア・モンテネグロ国旗"><p>セルビア</p></li>
<li class="heightLine"><img src="image/e8.gif" width="85" height="57" alt="タジキスタン国旗"><p>タジキスタン</p></li>
<li class="heightLine"><img src="image/d18.gif" width="85" height="57" alt="チェコ国旗"><p>チェコ</p></li>
<li class="heightLine"><img src="image/d19.gif" width="85" height="57" alt="デンマーク国旗"><p>デンマーク</p></li>
<li class="heightLine"><img src="image/d20.gif" width="85" height="57" alt="ドイツ国旗"><p>ドイツ</p></li>
<li class="heightLine"><img src="image/e9.gif" width="85" height="57" alt="トルクメニスタン国旗"><p>トルクメニスタン</p></li>
<li class="heightLine"><img src="image/d21.gif" width="85" height="57" alt="ノルウェー国旗"><p>ノルウェー</p></li>
<li class="heightLine"><img src="image/d22.gif" width="75" height="75" alt="バチカン国旗"><p>バチカン</p></li>
<li class="heightLine"><img src="image/d23.gif" width="85" height="57" alt="ハンガリー国旗"><p>ハンガリー</p></li>
<li class="heightLine"><img src="image/d24.gif" width="85" height="57" alt="フィンランド国旗"><p>フィンランド</p></li>
<li class="heightLine"><img src="image/d25.gif" width="85" height="57" alt="フランス国旗"><p>フランス</p></li>
<li class="heightLine"><img src="image/d26.gif" width="85" height="57" alt="ブルガリア国旗"><p>ブルガリア</p></li>
<li class="heightLine"><img src="image/e10.gif" width="85" height="50" alt="ベラルーシ国旗"><p>ベラルーシ</p></li>
<li class="heightLine"><img src="image/d27.gif" width="85" height="57" alt="ベルギー国旗"><p>ベルギー</p></li>
<li class="heightLine"><img src="image/d39.gif" width="85" height="57" alt="ボスニア・ヘルツェゴビナ国旗"><p>ボスニア・ヘルツェゴビナ</p></li>
<li class="heightLine"><img src="image/d28.gif" width="85" height="57" alt="ポーランド国旗"><p>ポーランド</p></li>
<li class="heightLine"><img src="image/d29.gif" width="85" height="57" alt="ポルトガル国旗"><p>ポルトガル</p></li>
<li class="heightLine"><img src="image/d30.gif" width="85" height="57" alt="マルタ国旗"><p>マルタ</p></li>
<li class="heightLine"><img src="image/d31.gif" width="85" height="57" alt="モナコ国旗"><p>モナコ</p></li>
<li class="heightLine"><img src="image/e11.gif" width="85" height="57" alt="モルドバ国旗"><p>モルドバ</p></li>
<li class="heightLine"><img src="image/d40.gif" width="85" height="58" alt="モンテネグロ国旗"><p>モンテネグロ</p></li>
<li class="heightLine"><img src="image/d32.gif" width="85" height="57" alt="ラトビア国旗"><p>ラトビア</p></li>
<li class="heightLine"><img src="image/d33.gif" width="85" height="57" alt="リトアニア国旗"><p>リトアニア</p></li>
<li class="heightLine"><img src="image/d34.gif" width="85" height="57" alt="リヒテンシュタイン国旗"><p>リヒテンシュタイン</p></li>
<li class="heightLine"><img src="image/d35.gif" width="85" height="57" alt="ルクセンブルク国旗"><p>ルクセンブルク</p></li>
<li class="heightLine"><img src="image/d36.gif" width="85" height="57" alt="ルーマニア国旗"><p>ルーマニア</p></li>
<li class="heightLine"><img src="image/e12.gif" width="85" height="57" alt="ロシア国旗"><p>ロシア</p></li>

<li class="heightLine"><img src="image/b1.gif" width="85" height="57" alt="オーストラリア国旗"><p>オーストラリア</p></li>
<li class="heightLine"><img src="image/b2.gif" width="85" height="57" alt="キリバス国旗"><p>キリバス</p></li>
<li class="heightLine"><img src="image/b_cook.gif" width="85" height="57" alt="クック諸島国旗"><p>クック諸島</p></li>
<li class="heightLine"><img src="image/b7.gif" width="85" height="57" alt="サモア国旗"><p>サモア</p></li>
<li class="heightLine"><img src="image/b3.gif" width="85" height="57" alt="ソロモン国旗"><p>ソロモン</p></li>
<li class="heightLine"><img src="image/b4.gif" width="85" height="57" alt="ツバル国旗"><p>ツバル</p></li>
<li class="heightLine"><img src="image/b5.gif" width="85" height="57" alt="トンガ国旗"><p>トンガ</p></li>
<li class="heightLine"><img src="image/b6.gif" width="85" height="57" alt="ナウル国旗"><p>ナウル</p></li>
<li class="heightLine"><img src="image/b15.gif" width="85" height="57" alt="ニウエ国旗"><p>ニウエ</p></li>
<li class="heightLine"><img src="image/b8.gif" width="85" height="57" alt="ニュージーランド国旗"><p>ニュージーランド</p></li>
<li class="heightLine"><img src="image/b9.gif" width="85" height="57" alt="バヌアツ国旗"><p>バヌアツ</p></li>
<li class="heightLine"><img src="image/b10.gif" width="85" height="57" alt="パプアニューギニア国旗"><p>パプアニューギニア</p></li>
<li class="heightLine"><img src="image/b11.gif" width="85" height="57" alt="パラオ国旗"><p>パラオ</p></li>
<li class="heightLine"><img src="image/b12.gif" width="85" height="57" alt="フィジー国旗"><p>フィジー</p></li>
<li class="heightLine"><img src="image/b13.gif" width="85" height="57" alt="マーシャル国旗"><p>マーシャル</p></li>
<li class="heightLine"><img src="image/b14.gif" width="85" height="57" alt="ミクロネシア国旗"><p>ミクロネシア</p></li>

<li class="heightLine"><img src="image/a1.gif" width="85" height="57" alt="アフガニスタン国旗"><p>アフガニスタン</p></li>
<li class="heightLine"><img src="image/a2.gif" width="85" height="57" alt="アラブ首長国連邦国旗"><p>アラブ首長国連邦</p></li>
<li class="heightLine"><img src="image/a3.gif" width="85" height="57" alt="イエメン国旗"><p>イエメン</p></li>
<li class="heightLine"><img src="image/a4.gif" width="85" height="57" alt="イスラエル国旗"><p>イスラエル</p></li>
<li class="heightLine"><img src="image/a5.gif" width="85" height="57" alt="イラク国旗"><p>イラク</p></li>
<li class="heightLine"><img src="image/a6.gif" width="85" height="57" alt="イラン国旗"><p>イラン</p></li>
<li class="heightLine"><img src="image/a9.gif" width="85" height="57" alt="オマーン国旗"><p>オマーン</p></li>
<li class="heightLine"><img src="image/a10.gif" width="85" height="57" alt="カタール国旗"><p>カタール</p></li>
<li class="heightLine"><img src="image/a15.gif" width="85" height="57" alt="クウェート国旗"><p>クウェート</p></li>
<li class="heightLine"><img src="image/a16.gif" width="85" height="57" alt="サウジアラビア国旗"><p>サウジアラビア</p></li>
<li class="heightLine"><img src="image/a17.gif" width="85" height="57" alt="シリア国旗"><p>シリア</p></li>
<li class="heightLine"><img src="image/a22.gif" width="85" height="57" alt="トルコ国旗"><p>トルコ</p></li>
<li class="heightLine"><img src="image/a26.gif" width="85" height="57" alt="バーレーン国旗"><p>バーレーン</p></li>
<li class="heightLine"><img src="image/a36.gif" width="85" height="57" alt="ヨルダン国旗"><p>ヨルダン</p></li>
<li class="heightLine"><img src="image/a38.gif" width="85" height="57" alt="レバノン国旗"><p>レバノン</p></li>

<li class="heightLine"><img src="image/c1.gif" width="85" height="57" alt="アルジェリア国旗"><p>アルジェリア</p></li>
<li class="heightLine"><img src="image/c2.gif" width="85" height="57" alt="アンゴラ国旗"><p>アンゴラ</p></li>
<li class="heightLine"><img src="image/c3.gif" width="85" height="57" alt="ウガンダ国旗"><p>ウガンダ</p></li>
<li class="heightLine"><img src="image/c4.gif" width="85" height="57" alt="エジプト国旗"><p>エジプト</p></li>
<li class="heightLine"><img src="image/c25.gif" width="85" height="57" alt="エスワティニ国旗"><p>エスワティニ</p></li>
<li class="heightLine"><img src="image/c5.gif" width="85" height="57" alt="エチオピア国旗"><p>エチオピア</p></li>
<li class="heightLine"><img src="image/c6.gif" width="85" height="57" alt="エリトリア国旗"><p>エリトリア</p></li>
<li class="heightLine"><img src="image/c7.gif" width="85" height="57" alt="ガーナ国旗"><p>ガーナ</p></li>
<li class="heightLine"><img src="image/c8.gif" width="85" height="57" alt="カーボヴェルデ国旗"><p>カーボヴェルデ</p></li>
<li class="heightLine"><img src="image/c9.gif" width="85" height="57" alt="ガボン国旗"><p>ガボン</p></li>
<li class="heightLine"><img src="image/c10.gif" width="85" height="57" alt="カメルーン国旗"><p>カメルーン</p></li>
<li class="heightLine"><img src="image/c11.gif" width="85" height="57" alt="ガンビア国旗"><p>ガンビア</p></li>
<li class="heightLine"><img src="image/c12.gif" width="85" height="57" alt="ギニア国旗"><p>ギニア</p></li>
<li class="heightLine"><img src="image/c13.gif" width="85" height="57" alt="ギニアビサウ国旗"><p>ギニアビサウ</p></li>
<li class="heightLine"><img src="image/c14.gif" width="85" height="57" alt="ケニア国旗"><p>ケニア</p></li>
<li class="heightLine"><img src="image/c15.gif" width="85" height="57" alt="コートジボワール国旗"><p>コートジボワール</p></li>
<li class="heightLine"><img src="image/c16.gif" width="85" height="57" alt="コモロ国旗"><p>コモロ</p></li>
<li class="heightLine"><img src="image/c17.gif" width="85" height="57" alt="コンゴ共和国国旗"><p>コンゴ共和国</p></li>
<li class="heightLine"><img src="image/c18.gif" width="85" height="57" alt="コンゴ民主共和国国旗"><p>コンゴ民主共和国</p></li>
<li class="heightLine"><img src="image/c19.gif" width="85" height="57" alt="サントメ・プリンシペ国旗"><p>サントメ・プリンシペ</p></li>
<li class="heightLine"><img src="image/c20.gif" width="85" height="57" alt="ザンビア国旗"><p>ザンビア</p></li>
<li class="heightLine"><img src="image/c21.gif" width="85" height="57" alt="シエラレオネ国旗"><p>シエラレオネ</p></li>
<li class="heightLine"><img src="image/c22_2.gif" width="85" height="60" alt="ジブチ国旗"><p>ジブチ</p></li>
<li class="heightLine"><img src="image/c23.gif" width="85" height="57" alt="ジンバブエ国旗"><p>ジンバブエ</p></li>
<li class="heightLine"><img src="image/c24.gif" width="85" height="57" alt="スーダン国旗"><p>スーダン</p></li>
<li class="heightLine"><img src="image/c27.gif" width="85" height="57" alt="赤道ギニア国旗"><p>赤道ギニア</p></li>
<li class="heightLine"><img src="image/c26.gif" width="85" height="57" alt="セーシェル国旗"><p>セーシェル</p></li>
<li class="heightLine"><img src="image/c28.gif" width="85" height="57" alt="セネガル国旗"><p>セネガル</p></li>
<li class="heightLine"><img src="image/c29.gif" width="85" height="57" alt="ソマリア国旗"><p>ソマリア</p></li>
<li class="heightLine"><img src="image/c30.gif" width="85" height="57" alt="タンザニア国旗"><p>タンザニア</p></li>
<li class="heightLine"><img src="image/c31.gif" width="85" height="57" alt="チャド国旗"><p>チャド</p></li>
<li class="heightLine"><img src="image/c32.gif" width="85" height="57" alt="中央アフリカ国旗"><p>中央アフリカ</p></li>
<li class="heightLine"><img src="image/c33.gif" width="85" height="57" alt="チュニジア国旗"><p>チュニジア</p></li>
<li class="heightLine"><img src="image/c34.gif" width="85" height="57" alt="トーゴ国旗"><p>トーゴ</p></li>
<li class="heightLine"><img src="image/c35.gif" width="85" height="57" alt="ナイジェリア国旗"><p>ナイジェリア</p></li>
<li class="heightLine"><img src="image/c36.gif" width="85" height="57" alt="ナミビア国旗"><p>ナミビア</p></li>
<li class="heightLine"><img src="image/c37.gif" width="85" height="57" alt="ニジェール国旗"><p>ニジェール</p></li>
<li class="heightLine"><img src="image/c38.gif" width="85" height="57" alt="ブルキナファソ国旗"><p>ブルキナファソ</p></li>
<li class="heightLine"><img src="image/c39.gif" width="85" height="57" alt="ブルンジ国旗"><p>ブルンジ</p></li>
<li class="heightLine"><img src="image/c40.gif" width="85" height="57" alt="ベナン国旗"><p>ベナン</p></li>
<li class="heightLine"><img src="image/c41.gif" width="85" height="57" alt="ボツワナ国旗"><p>ボツワナ</p></li>
<li class="heightLine"><img src="image/c42.gif" width="85" height="57" alt="マダガスカル国旗"><p>マダガスカル</p></li>
<li class="heightLine"><img src="image/c43.gif" width="85" height="58" alt="マラウイ国旗"><p>マラウイ</p></li>
<li class="heightLine"><img src="image/c44.gif" width="85" height="57" alt="マリ国旗"><p>マリ</p></li>
<li class="heightLine"><img src="image/c45.gif" width="85" height="57" alt="南アフリカ共和国国旗"><p>南アフリカ共和国</p></li>
<li class="heightLine"><img src="image/c54.gif" width="85" height="42" alt="南スーダン国旗"><p>南スーダン</p></li>
<li class="heightLine"><img src="image/c46.gif" width="85" height="57" alt="モザンビーク国旗"><p>モザンビーク</p></li>
<li class="heightLine"><img src="image/c47.gif" width="85" height="57" alt="モーリシャス国旗"><p>モーリシャス</p></li>
<li class="heightLine"><img src="image/c48.gif" width="85" height="56" alt="モーリタニア国旗"><p>モーリタニア</p></li>
<li class="heightLine"><img src="image/c49.gif" width="85" height="57" alt="モロッコ国旗"><p>モロッコ</p></li>
<li class="heightLine"><img src="image/c55.gif" width="85" height="44" alt="リビア国旗"><p>リビア</p></li>
<li class="heightLine"><img src="image/c51.gif" width="85" height="57" alt="リベリア国旗"><p>リベリア</p></li>
<li class="heightLine"><img src="image/c52.gif" width="85" height="57" alt="ルワンダ国旗"><p>ルワンダ</p></li>
<li class="heightLine"><img src="image/c53.gif" width="85" height="64" alt="レソト国旗"><p>レソト</p></li>

