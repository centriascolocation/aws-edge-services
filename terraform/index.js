const path = require('path');
exports.handler = async (event) => {
  var request = event.Records[0].cf.request;
  // Rewrite clean URLs (adding index.html)
  if (!path.extname(request.uri)) {
    request.uri = request.uri.replace(/\/?$/, '\/index.html');
  }
  return request;
};
