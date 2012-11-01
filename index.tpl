<?xml version="1.0" encoding="utf-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="generator" content="Docutils 0.9.1: http://docutils.sourceforge.net/" />
<title>bottlepaste</title>
<style type="text/css">

/*

:bottlepaste.css:
:Author: Valentin Haenel

Heavily based on voidspace, by:

:Authors: Ian Bicking, Michael Foord
:Contact: fuzzyman@voidspace.org.uk
:Date: 2005/08/26 
:Version: 0.1.0
:Copyright: This stylesheet has been placed in the public domain.

Stylesheet for Docutils.
Based on ``blue_box.css`` by Ian Bicking
and ``html4css1.css`` revision 1.46.
*/

@import url(html4css1.css);

body {
  font-family: Arial, sans-serif;
  width: 950px;
  margin: 1em auto .5em;
  padding: 10px;
  color: #222;
  background-color:#F6EB9B;
  border: medium solid #444; 
  border-radius: 20px;
  -moz-border-radius: 20px;
}

em, i {
  /* Typically serif fonts have much nicer italics */
  font-family: Times New Roman, Times, serif;
}

a.target {
  color: blue;
}

a.target {
  color: blue;
}

a.toc-backref {
  text-decoration: none;
  color: #444;
}

a.toc-backref:hover {
  background-color: inherit;
}

a:hover {
  background-color: #cccccc;
}

div.attention, div.caution, div.danger, div.error, div.hint,
div.important, div.note, div.tip, div.warning {
  background-color: #cccccc;
  padding: 3px;
  width: 80%;
}

div.admonition p.admonition-title, div.hint p.admonition-title,
div.important p.admonition-title, div.note p.admonition-title,
div.tip p.admonition-title  {
  text-align: center;
  background-color: #999999;
  display: block;
  margin: 0;
}

div.attention p.admonition-title, div.caution p.admonition-title,
div.danger p.admonition-title, div.error p.admonition-title,
div.warning p.admonition-title {
  color: #cc0000;
  font-family: sans-serif;
  text-align: center;
  background-color: #999999;
  display: block;
  margin: 0;
}

h1, h2, h3, h4, h5, h6 {
  font-family: Helvetica, Arial, sans-serif;
  border: thin solid #444;
  /* This makes the borders rounded on Mozilla, which pleases me */
  -moz-border-radius: 8px;
  padding: 4px;
}

h1 {
  background-color: #666699;
  color: #cfcfcf;
  border: medium solid #444;
  border-radius: 20px;
  -moz-border-radius: 20px;
}

h1 a.toc-backref, h2 a.toc-backref { 
  color: #cfcfcf;
  font-size: 80%;
}

h2 {
  background-color: #666666;
  color: #cfcfcf;
  border: medium solid #444;
  font-size: 60%;
}

h3, h4, h5, h6 {
  background-color: #cccccc;
  color: #000000;
}

h3 a.toc-backref, h4 a.toc-backref, h5 a.toc-backref, 
h6 a.toc-backref { 
  color: #000000;
}

h1.title {
  text-align: center;
  background-color: #666699;
  color: #cfcfcf;
  border: thick solid #444;
}

table.footnote {
  padding-left: 0.5ex;
  text-align: center;
}

table.citation {
  padding-left: 0.5ex
}

pre.literal-block, pre.doctest-block {
  border: thin #444 solid;
  background-color: #cfcfcf;
  border-radius: 5px;
  -moz-border-radius: 5px;
  padding: 5px;
}

.image img { border-style : solid;
            border-width : 2px;
}

h1 tt, h2 tt, h3 tt, h4 tt, h5 tt, h6 tt {
  font-size: 100%;
}

code, tt {
  color: #272727;
  background-color: #cfcfcf;
  border: thin #444 solid;
  border-radius: 5px;
  -moz-border-radius: 5px;
}

div.footer {
  text-align: center;
}

a, a:active, a:visited {
    color: #666699;
    text-decoration: none;
}
a:hover {
    border: thin #444 solid;
    color: #cfcfcf;
    background-color: #666699;
    border-radius: 5px;
    -moz-border-radius: 5px;
}

</style>
<style type="text/css">

.hll { background-color: #ffffcc }
.c { color: #008000 } /* Comment */
.err { border: 1px solid #FF0000 } /* Error */
.k { color: #0000ff } /* Keyword */
.cm { color: #008000 } /* Comment.Multiline */
.cp { color: #0000ff } /* Comment.Preproc */
.c1 { color: #008000 } /* Comment.Single */
.cs { color: #008000 } /* Comment.Special */
.ge { font-style: italic } /* Generic.Emph */
.gh { font-weight: bold } /* Generic.Heading */
.gp { font-weight: bold } /* Generic.Prompt */
.gs { font-weight: bold } /* Generic.Strong */
.gu { font-weight: bold } /* Generic.Subheading */
.kc { color: #0000ff } /* Keyword.Constant */
.kd { color: #0000ff } /* Keyword.Declaration */
.kn { color: #0000ff } /* Keyword.Namespace */
.kp { color: #0000ff } /* Keyword.Pseudo */
.kr { color: #0000ff } /* Keyword.Reserved */
.kt { color: #2b91af } /* Keyword.Type */
.s { color: #a31515 } /* Literal.String */
.nc { color: #2b91af } /* Name.Class */
.ow { color: #0000ff } /* Operator.Word */
.sb { color: #a31515 } /* Literal.String.Backtick */
.sc { color: #a31515 } /* Literal.String.Char */
.sd { color: #a31515 } /* Literal.String.Doc */
.s2 { color: #a31515 } /* Literal.String.Double */
.se { color: #a31515 } /* Literal.String.Escape */
.sh { color: #a31515 } /* Literal.String.Heredoc */
.si { color: #a31515 } /* Literal.String.Interpol */
.sx { color: #a31515 } /* Literal.String.Other */
.sr { color: #a31515 } /* Literal.String.Regex */
.s1 { color: #a31515 } /* Literal.String.Single */
.ss { color: #a31515 } /* Literal.String.Symbol */

</style>
</head>
<body>
<div class="document" id="bottlepaste">
<h1 class="title">bottlepaste</h1>

<p>A command line pastebin akin to <a class="reference external" href="http://sprunge.us/">sprunge.us</a> but using
<a class="reference external" href="http://bottlepy.org/docs/dev/bottle.py">bottle.py</a>.</p>
<div class="section" id="synposis">
<h1>Synposis</h1>
<pre class="code console literal-block">
<span class="go">&lt;command&gt; | curl -F 'bp=&lt;-' [-F 'uid=&lt;uid&gt;'] DEPLOYMENT_URL</span>
</pre>
</div>
<div class="section" id="example">
<h1>Example</h1>
<p>Use curl to paste:</p>
<pre class="code console literal-block">
<span class="gp">$</span> cat bottlepaste.py | curl -F <span class="s1">'bp=&lt;-'</span> DEPLOYMENT_URL
<span class="go">DEPLOYMENT_URL/ec42eda</span>
</pre>
<p>If you want a custom uid, use:</p>
<pre class="code console literal-block">
<span class="gp">$</span> cat bottlepaste.py | curl -F <span class="s1">'bp=&lt;-'</span> -F <span class="s1">'uid=bottlepaste.py'</span> DEPLOYMENT_URL
<span class="go">DEPLOYMENT_URL/bottlepaste.py</span>
</pre>
<p>The <tt class="docutils literal">uid</tt> is goverend by the following regex: <tt class="docutils literal"><span class="pre">'^[a-zA-Z0-9_\-\.]{3,23}$'</span></tt>
and some well knowen file names are dissallowed.</p>
</div>
<div class="section" id="see-also">
<h1>See Also</h1>
<ul class="simple">
<li><a class="reference external" href="https://github.com/esc/bottlepaste">github repository</a></li>
</ul>
</div>
</div>
<div class="footer">
<hr class="footer" />
© 2012 Valentin Haenel and proudly hosted on <a class="reference external" href="https://cloudcontrol.com">cloudControl</a>
</div>
</body>
</html>
