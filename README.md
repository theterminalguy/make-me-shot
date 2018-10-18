[![Code Climate](https://codeclimate.com/github/andela-sdamian/make-me-shot/badges/gpa.svg)](https://codeclimate.com/github/andela-sdamian/make-me-shot) [![Build Status](https://travis-ci.org/andela-sdamian/make-me-shot.svg?branch=master)](https://travis-ci.org/andela-sdamian/make-me-shot) [![Coverage Status](https://coveralls.io/repos/github/andela-sdamian/make-me-shot/badge.svg?branch=master)](https://coveralls.io/github/andela-sdamian/make-me-shot?branch=master)


<p>
<a href="http://andela-mms.herokuapp.com">make-me-shot</a> is a URL shortner, built with ruby on rails. The application allows you to shorten any given URL into fewer characters. It is a clone of popular URL shorteners like <a href="//tinyurl.com">Tinyurl</a> , <a href="//bitly.com">Bitly</a> and <a href="https://goo.gl/">Google Shortner</a>.
</p>

## Screenshots

<a href="http://i67.tinypic.com/24y4llc.jpg" target="_blank"><img src="http://i67.tinypic.com/24y4llc.jpg" border="0" alt="Image and video hosting by TinyPic"></a>



## How can I get started?
<p>
Getting started is simply easy. Just visit <a href="http://andela-mms.herokuapp.com">andela-mms.herokuapp.com</a> and create an account to start your experiece. However, if you want to get started as a contributor, please scroll down to the contributing section below.

More info about the application can be found on the website about page visit <a href="http://andela-mms.herokuapp.com/pages/about">andela-mms.herokuapp.com/pages/about</a>
</p>


## External dependencies 
<p>
<a href="andela-mms.herokuapp.com">make-me-shot</a> makes use of few dependecies some of which includes:
<ul>
	<li>Devise for authentication</li>
	<li>Materialize CSS</li>
	<li>Font Awesome</li>
	<li>jQuery</li>
</ul>
For a full list of dependcies please check our <a href="https://github.com/andela-sdamian/make-me-shot/blob/master/Gemfile">Gemfile</a>
</p>

## How do I run test?
<p>
make-me-shot uses the default rails mini test and the Capybara gem for integration test. Continuous Integration is carried out via Travis CI and CodeClimate. Coveralls.io is responsible for our test coverage report. 
If you fork/clone this repo on you device, you woul have to run the test using 

<br />

<b>To run the entire test suite</b> <br />
<pre>rake test</pre>

<b>To run test for controllers</b> <br />
<pre>rake test:controllers </pre>

<b>To run test for models</b> <br />
<pre>rake test:models </pre>

<b>To run integration test</b> <br />
<pre>rake test:integration </pre>
</p>


## Features of the application

<table border="1" style="padding:10px; width:100%; text-align:left">
<tr>
  <th> Features </th>
  <th> Visitor </th>
  <th> Member </th>
</tr>

<tr>
	<th>Shorten URLs without slug</th>
	<td>Yes</td>
	<td>Yes</td>
</tr>

<tr>
	<th>Copy to clipboard</th>
	<td>Yes</td>
	<td>Yes</td>
</tr>

<tr>
	<th>Shorten URLs with slug</th>
	<td>No</td>
	<td>Yes</td>
</tr>

<tr>
	<th>Access to influential users</th>
	<td>Yes</td>
	<td>Yes</td>
</tr>

<tr>
	<th>Aceess to URLs with hit count</th>
	<td>Yes</td>
	<td>Yes</td>
</tr>

<tr>
	<th>Acess to recently added URLs</th>
	<td>Yes</td>
	<td>Yes</td>
</tr>

<tr>
	<th>Disable URL functionality</th>
	<td>No</td>
	<td>Yes</td>
</tr>

<tr>
	<th>Enable URL functionality </th>
	<td>No</td> 
	<td>Yes</td>
</tr>

<tr>
	<th>URL statistics</th>
	<td>No</td>
	<td>Yes</td>
</tr>

<tr>
	<th>Delete URL</th>
	<td>No</td>
	<td>Yes</td>
</tr>

<tr>
	<th>Change URL target</th>
	<td>No</td>
	<td>Yes</td>
</tr>

<tr>
	<th>Change URL slug</th>
	<td>No </td>
	<td>Yes</td>
</tr>

<tr>
	<th>Personal URL management</th>
	<td>No</td>
	<td>Yes</td>
</tr>
</table>

## Limitations

<p>
<ul>
  <li>Inability to share links on social media platforms</li>
  <li>No API support</li>
  <li>No ruby gem</li>
  <li>No validation of URL to see if it actually exist</li>
</ul>

Currently, our API is in beta and have not been release publicly. Do ensure your check our wiki for updates on when we release our API. 
</p>

## Contributing 

<p>
Bug reports and pull requests are welcome on GitHub. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the <a href="http://todogroup.org/opencodeofconduct/">Contributor Covenant code of conduct</a>.
</p>

## License

<p>
This app is available as open source under the terms of the <a href="http://www.gnu.org/licenses/gpl-3.0.en.html">GNU Public License</a>
</p>

