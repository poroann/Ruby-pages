#!/usr/local/bin/ruby
print "Content-type:text/html\n\n"


html=DATA.read
pg_title=File.basename(__FILE__)


html.gsub!("%title%",pg_title)
html.gsub!("%本文%","本文2")


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
<style>
   body{
      background-color:white;}
   div{
      font-size:100px;}
</style>
</head>
<body>
<div>
%本文%
</div>
<script>
</script>
</body>
</html>
