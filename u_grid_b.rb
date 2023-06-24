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
<link rel="icon" href="/ico.png">
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
      height:80px;
      padding:10px;
      margin:10px;
      color:#fff;
      background-color:#2196f3;
      border-radius:5px;}
EOS

#      grid-template-columns:repeat(8,1fr);
#      grid-template-rows:repeat(8,1fr);


header=<<EOS
<h1>css color</h1>
<p>test</p>
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


=begin
w=""
64.times do |i|
   w+="<div class='item'>#{i}</div>\n"
end

text=<<EOS
<div class='group'>
#{w}
</div>
EOS
=end

w=DATA.read          #css color ﾖﾐﾄﾘ分解
ww=w.split(/\n/)
#text=ww.to_s
text="<div class='group'>\n"
ww.each do |t|
   tt=t.split(/	/)
   t1=tt[0].strip
   t2=tt[1].strip
   t3=tt[2]

   ccc=t3.split(/ /)    #rgb
   c1=ccc[0].to_i
   c2=ccc[1].to_i
   c3=ccc[2].to_i
   if (c1+90)<255 then c1+=90 end
   if (c2+90)<255 then c2+=90 end
   if (c3+90)<255 then c3+=90 end
   cc="#{c1} #{c2} #{c3}"

   text+="<div class='item' style='background:#{t2};'><span style='color:rgb(#{cc})'>#{t1}</span></div>\n"
   
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
aliceblue 	#f0f8ff 	240 248 255
antiquewhite 	#faebd7 	250 235 215
aqua 	#00ffff 	0 255 255
aquamarine 	#7fffd4 	127 255 212
azure 	#f0ffff 	240 255 255
beige 	#f5f5dc 	245 245 220
bisque 	#ffe4c4 	255 228 196
black 	#000000 	0 0 0
blanchedalmond 	#ffebcd 	255 235 205
blue 	#0000ff 	0 0 255
blueviolet 	#8a2be2 	138 43 226
brown 	#a52a2a 	165 42 42
burlywood 	#deb887 	222 184 135
cadetblue 	#5f9ea0 	95 158 160
chartreuse 	#7fff00 	127 255 0
chocolate 	#d2691e 	210 105 30
coral 	#ff7f50 	255 127 80
cornflowerblue 	#6495ed 	100 149 237
cornsilk 	#fff8dc 	255 248 220
crimson 	#dc143c 	220 20 60
cyan 	#00ffff 	0 255 255
darkblue 	#00008b 	0 0 139
darkcyan 	#008b8b 	0 139 139
darkgoldenrod 	#b8860b 	184 134 11
darkgray 	#a9a9a9 	169 169 169
darkgreen 	#006400 	0 100 0
darkgrey 	#a9a9a9 	169 169 169
darkkhaki 	#bdb76b 	189 183 107
darkmagenta 	#8b008b 	139 0 139
darkolivegreen 	#556b2f 	85 107 47
darkorange 	#ff8c00 	255 140 0
darkorchid 	#9932cc 	153 50 204
darkred 	#8b0000 	139 0 0
darksalmon 	#e9967a 	233 150 122
darkseagreen 	#8fbc8f 	143 188 143
darkslateblue 	#483d8b 	72 61 139
darkslategray 	#2f4f4f 	47 79 79
darkslategrey 	#2f4f4f 	47 79 79
darkturquoise 	#00ced1 	0 206 209
darkviolet 	#9400d3 	148 0 211
deeppink 	#ff1493 	255 20 147
deepskyblue 	#00bfff 	0 191 255
dimgray 	#696969 	105 105 105
dimgrey 	#696969 	105 105 105
dodgerblue 	#1e90ff 	30 144 255
firebrick 	#b22222 	178 34 34
floralwhite 	#fffaf0 	255 250 240
forestgreen 	#228b22 	34 139 34
fuchsia 	#ff00ff 	255 0 255
gainsboro 	#dcdcdc 	220 220 220
ghostwhite 	#f8f8ff 	248 248 255
gold 	#ffd700 	255 215 0
goldenrod 	#daa520 	218 165 32
gray 	#808080 	128 128 128
green 	#008000 	0 128 0
greenyellow 	#adff2f 	173 255 47
grey 	#808080 	128 128 128
honeydew 	#f0fff0 	240 255 240
hotpink 	#ff69b4 	255 105 180
indianred 	#cd5c5c 	205 92 92
indigo 	#4b0082 	75 0 130
ivory 	#fffff0 	255 255 240
khaki 	#f0e68c 	240 230 140
lavender 	#e6e6fa 	230 230 250
lavenderblush 	#fff0f5 	255 240 245
lawngreen 	#7cfc00 	124 252 0
lemonchiffon 	#fffacd 	255 250 205
lightblue 	#add8e6 	173 216 230
lightcoral 	#f08080 	240 128 128
lightcyan 	#e0ffff 	224 255 255
lightgoldenrodyellow 	#fafad2 	250 250 210
lightgray 	#d3d3d3 	211 211 211
lightgreen 	#90ee90 	144 238 144
lightgrey 	#d3d3d3 	211 211 211
lightpink 	#ffb6c1 	255 182 193
lightsalmon 	#ffa07a 	255 160 122
lightseagreen 	#20b2aa 	32 178 170
lightskyblue 	#87cefa 	135 206 250
lightslategray 	#778899 	119 136 153
lightslategrey 	#778899 	119 136 153
lightsteelblue 	#b0c4de 	176 196 222
lightyellow 	#ffffe0 	255 255 224
lime 	#00ff00 	0 255 0
limegreen 	#32cd32 	50 205 50
linen 	#faf0e6 	250 240 230
magenta 	#ff00ff 	255 0 255
maroon 	#800000 	128 0 0
mediumaquamarine 	#66cdaa 	102 205 170
mediumblue 	#0000cd 	0 0 205
mediumorchid 	#ba55d3 	186 85 211
mediumpurple 	#9370db 	147 112 219
mediumseagreen 	#3cb371 	60 179 113
mediumslateblue 	#7b68ee 	123 104 238
mediumspringgreen 	#00fa9a 	0 250 154
mediumturquoise 	#48d1cc 	72 209 204
mediumvioletred 	#c71585 	199 21 133
midnightblue 	#191970 	25 25 112
mintcream 	#f5fffa 	245 255 250
mistyrose 	#ffe4e1 	255 228 225
moccasin 	#ffe4b5 	255 228 181
navajowhite 	#ffdead 	255 222 173
navy 	#000080 	0 0 128
oldlace 	#fdf5e6 	253 245 230
olive 	#808000 	128 128 0
olivedrab 	#6b8e23 	107 142 35
orange 	#ffa500 	255 165 0
orangered 	#ff4500 	255 69 0
orchid 	#da70d6 	218 112 214
palegoldenrod 	#eee8aa 	238 232 170
palegreen 	#98fb98 	152 251 152
paleturquoise 	#afeeee 	175 238 238
palevioletred 	#db7093 	219 112 147
papayawhip 	#ffefd5 	255 239 213
peachpuff 	#ffdab9 	255 218 185
peru 	#cd853f 	205 133 63
pink 	#ffc0cb 	255 192 203
plum 	#dda0dd 	221 160 221
powderblue 	#b0e0e6 	176 224 230
purple 	#800080 	128 0 128
rebeccapurple 	#663399 	102 51 153
red 	#ff0000 	255 0 0
rosybrown 	#bc8f8f 	188 143 143
royalblue 	#4169e1 	65 105 225
saddlebrown 	#8b4513 	139 69 19
salmon 	#fa8072 	250 128 114
sandybrown 	#f4a460 	244 164 96
seagreen 	#2e8b57 	46 139 87
seashell 	#fff5ee 	255 245 238
sienna 	#a0522d 	160 82 45
silver 	#c0c0c0 	192 192 192
skyblue 	#87ceeb 	135 206 235
slateblue 	#6a5acd 	106 90 205
slategray 	#708090 	112 128 144
slategrey 	#708090 	112 128 144
snow 	#fffafa 	255 250 250
springgreen 	#00ff7f 	0 255 127
steelblue 	#4682b4 	70 130 180
tan 	#d2b48c 	210 180 140
teal 	#008080 	0 128 128
thistle 	#d8bfd8 	216 191 216
tomato 	#ff6347 	255 99 71
turquoise 	#40e0d0 	64 224 208
violet 	#ee82ee 	238 130 238
wheat 	#f5deb3 	245 222 179
white 	#ffffff 	255 255 255
whitesmoke 	#f5f5f5 	245 245 245
yellow 	#ffff00 	255 255 0
yellowgreen 	#9acd32 	154 205 50
