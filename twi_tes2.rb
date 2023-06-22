#!/usr/local/bin/ruby
print "Content-type:text/html\n\n"


html=DATA.read
pg_title=File.basename(__FILE__)


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
EOS


header=<<EOS
<h1>#{pg_title}</h1>
<p>header<p>
EOS

nav=<<EOS
<p>nav<p>
EOS

footer=<<EOS
<p>twitter link<p>
EOS


html.gsub!("%css%","\n"+css)
html.gsub!("%title%",pg_title)
html.gsub!("%header%","\n"+header)
html.gsub!("%nav%","\n"+nav)
html.gsub!("%本文%","本文")
html.gsub!("%footer%","\n"+footer)


print html



__END__
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
