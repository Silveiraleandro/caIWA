var http = require('http'),//module brings functionalities for HTTP
    path = require('path'),//file and directory paths module
    express = require('express'),//module allow the program to reply to HTTP requests
    fs = require('fs'),//module brings read and write to files functionalities
    xmlParse = require('xslt-processor').xmlParse,//module to work with XML
    xsltProcess = require('xslt-processor').xsltProcess;//for XSL transformations
    xml2js = require('xml2js'),//converts XML to JSON and the reverse way
    //autosanitizer extracted from  https://medium.com/@antonioramirezofficial/automatic-and-painless-sanitization-for-all-express-routes-ae24cbe653c8
        
    expAutoSan = require('express-autosanitizer');

var router = express();
var server = http.createServer(router);

router.use(express.static(path.resolve(__dirname, 'views')));
router.use(express.urlencoded({extended: true}));
router.use(express.json());
router.use(expAutoSan.allUnsafe);

// Function to read in XML file and convert it to JSON
function xmlFileToJs(filename, cb) {
  var filepath = path.normalize(path.join(__dirname, filename));
  fs.readFile(filepath, 'utf8', function(err, xmlStr) {
    if (err) throw (err);
    xml2js.parseString(xmlStr, {}, cb);
  });
}

//Function to convert JSON to XML and save it
function jsToXmlFile(filename, obj, cb) {
  var filepath = path.normalize(path.join(__dirname, filename));
  var builder = new xml2js.Builder();
  var xml = builder.buildObject(obj);
  fs.writeFile(filepath, xml, cb);
}

router.get('/', function(req, res){

    res.render('index');

})

router.get('/get/html', function(req, res) {

    res.writeHead(200, {'Content-Type': 'text/html'});

    var xml = fs.readFileSync('CA_IWA.xml', 'utf8');
    var xsl = fs.readFileSync('CA_IWA.xsl', 'utf8');
    //console.log(xml);
    var doc = xmlParse(xml);
    var stylesheet = xmlParse(xsl);

    var result = xsltProcess(doc, stylesheet);

    res.end(result.toString());


});
// POST request to add to JSON & XML files
router.post('/post/json', function(req, res) {

  // Function to read in a JSON file, add to it & convert to XML
  function appendJSON(obj) {
    //console.log(obj);
    // Function to read in XML file, convert it to JSON, add a new object and write back to XML file
    xmlFileToJs('CA_IWA.xml', function(err, result) {
      if (err) throw (err);
      result.NBA.section[obj.sec_n].entree.push({'player': obj.player, 'value': obj.value});
      //console.log(result);
      jsToXmlFile('CA_IWA.xml', result, function(err) {
        if (err) console.log(err);
      })
    })
  }

  // Call appendJSON function and pass in body of the current POST request
  appendJSON(req.body);

  // Re-direct the browser back to the page, where the POST request came from
  res.redirect('back');

});
// POST request to add to JSON & XML files
router.post('/post/delete', function(req, res) {

  // Function to read in a JSON file, add to it & convert to XML
  function deleteJSON(obj) {
    // Function to read in XML file, convert it to JSON, delete the required object and write back to XML file
    xmlFileToJs('CA_IWA.xml', function(err, result) {
      if (err) throw (err);
      //This is where we delete the object based on the position of the section and position of the entree, as being passed on from index.html
      delete result.NBA.section[obj.section].entree[obj.entree];
      //This is where we convert from JSON and write back our XML file
      jsToXmlFile('CA_IWA.xml', result, function(err) {
        if (err) console.log(err);
      })
    })
  }

  // Call appendJSON function and pass in body of the current POST request
  deleteJSON(req.body);

});
server.listen(process.env.PORT || 3000, process.env.IP || "0.0.0.0", function() {
  var addr = server.address();
  console.log("Server listening at", addr.address + ":" + addr.port);
});
