/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./next.congig.js":
/*!************************!*\
  !*** ./next.congig.js ***!
  \************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("module.exports = {\n    async headers() {\n      return [\n        {\n          // matching all API routes\n          source: '/:path*',\n          headers: [\n            { key: 'Access-Control-Allow-Credentials', value: 'true' },\n            { key: 'Access-Control-Allow-Origin', value: '*' },\n            { key: 'Access-Control-Allow-Methods', value: 'GET,OPTIONS,PATCH,DELETE,POST,PUT' },\n            { key: 'Access-Control-Allow-Headers', value: 'X-CSRF-Token, X-Requested-With, Accept, Accept-Version, Content-Length, Content-MD5, Content-Type, Date, X-Api-Version, Authorization' },\n          ],\n        },\n      ];\n    },\n\n  };\n\n  const cors=__webpack_require__(/*! cors */ \"./node_modules/cors/lib/index.js\");\nconst corsOptions ={\n   origin:'*',\n   credentials:true,            //access-control-allow-credentials:true\n   optionSuccessStatus:200,\n}\napp.use(cors(corsOptions))\n\n\n//# sourceURL=webpack://distance-learning/./next.congig.js?");

/***/ }),

/***/ "./node_modules/cors/lib/index.js":
/*!****************************************!*\
  !*** ./node_modules/cors/lib/index.js ***!
  \****************************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("(function () {\n\n  'use strict';\n\n  var assign = __webpack_require__(/*! object-assign */ \"./node_modules/object-assign/index.js\");\n  var vary = __webpack_require__(/*! vary */ \"./node_modules/vary/index.js\");\n\n  var defaults = {\n    origin: '*',\n    methods: 'GET,HEAD,PUT,PATCH,POST,DELETE',\n    preflightContinue: false,\n    optionsSuccessStatus: 204\n  };\n\n  function isString(s) {\n    return typeof s === 'string' || s instanceof String;\n  }\n\n  function isOriginAllowed(origin, allowedOrigin) {\n    if (Array.isArray(allowedOrigin)) {\n      for (var i = 0; i < allowedOrigin.length; ++i) {\n        if (isOriginAllowed(origin, allowedOrigin[i])) {\n          return true;\n        }\n      }\n      return false;\n    } else if (isString(allowedOrigin)) {\n      return origin === allowedOrigin;\n    } else if (allowedOrigin instanceof RegExp) {\n      return allowedOrigin.test(origin);\n    } else {\n      return !!allowedOrigin;\n    }\n  }\n\n  function configureOrigin(options, req) {\n    var requestOrigin = req.headers.origin,\n      headers = [],\n      isAllowed;\n\n    if (!options.origin || options.origin === '*') {\n      // allow any origin\n      headers.push([{\n        key: 'Access-Control-Allow-Origin',\n        value: '*'\n      }]);\n    } else if (isString(options.origin)) {\n      // fixed origin\n      headers.push([{\n        key: 'Access-Control-Allow-Origin',\n        value: options.origin\n      }]);\n      headers.push([{\n        key: 'Vary',\n        value: 'Origin'\n      }]);\n    } else {\n      isAllowed = isOriginAllowed(requestOrigin, options.origin);\n      // reflect origin\n      headers.push([{\n        key: 'Access-Control-Allow-Origin',\n        value: isAllowed ? requestOrigin : false\n      }]);\n      headers.push([{\n        key: 'Vary',\n        value: 'Origin'\n      }]);\n    }\n\n    return headers;\n  }\n\n  function configureMethods(options) {\n    var methods = options.methods;\n    if (methods.join) {\n      methods = options.methods.join(','); // .methods is an array, so turn it into a string\n    }\n    return {\n      key: 'Access-Control-Allow-Methods',\n      value: methods\n    };\n  }\n\n  function configureCredentials(options) {\n    if (options.credentials === true) {\n      return {\n        key: 'Access-Control-Allow-Credentials',\n        value: 'true'\n      };\n    }\n    return null;\n  }\n\n  function configureAllowedHeaders(options, req) {\n    var allowedHeaders = options.allowedHeaders || options.headers;\n    var headers = [];\n\n    if (!allowedHeaders) {\n      allowedHeaders = req.headers['access-control-request-headers']; // .headers wasn't specified, so reflect the request headers\n      headers.push([{\n        key: 'Vary',\n        value: 'Access-Control-Request-Headers'\n      }]);\n    } else if (allowedHeaders.join) {\n      allowedHeaders = allowedHeaders.join(','); // .headers is an array, so turn it into a string\n    }\n    if (allowedHeaders && allowedHeaders.length) {\n      headers.push([{\n        key: 'Access-Control-Allow-Headers',\n        value: allowedHeaders\n      }]);\n    }\n\n    return headers;\n  }\n\n  function configureExposedHeaders(options) {\n    var headers = options.exposedHeaders;\n    if (!headers) {\n      return null;\n    } else if (headers.join) {\n      headers = headers.join(','); // .headers is an array, so turn it into a string\n    }\n    if (headers && headers.length) {\n      return {\n        key: 'Access-Control-Expose-Headers',\n        value: headers\n      };\n    }\n    return null;\n  }\n\n  function configureMaxAge(options) {\n    var maxAge = (typeof options.maxAge === 'number' || options.maxAge) && options.maxAge.toString()\n    if (maxAge && maxAge.length) {\n      return {\n        key: 'Access-Control-Max-Age',\n        value: maxAge\n      };\n    }\n    return null;\n  }\n\n  function applyHeaders(headers, res) {\n    for (var i = 0, n = headers.length; i < n; i++) {\n      var header = headers[i];\n      if (header) {\n        if (Array.isArray(header)) {\n          applyHeaders(header, res);\n        } else if (header.key === 'Vary' && header.value) {\n          vary(res, header.value);\n        } else if (header.value) {\n          res.setHeader(header.key, header.value);\n        }\n      }\n    }\n  }\n\n  function cors(options, req, res, next) {\n    var headers = [],\n      method = req.method && req.method.toUpperCase && req.method.toUpperCase();\n\n    if (method === 'OPTIONS') {\n      // preflight\n      headers.push(configureOrigin(options, req));\n      headers.push(configureCredentials(options, req));\n      headers.push(configureMethods(options, req));\n      headers.push(configureAllowedHeaders(options, req));\n      headers.push(configureMaxAge(options, req));\n      headers.push(configureExposedHeaders(options, req));\n      applyHeaders(headers, res);\n\n      if (options.preflightContinue) {\n        next();\n      } else {\n        // Safari (and potentially other browsers) need content-length 0,\n        //   for 204 or they just hang waiting for a body\n        res.statusCode = options.optionsSuccessStatus;\n        res.setHeader('Content-Length', '0');\n        res.end();\n      }\n    } else {\n      // actual response\n      headers.push(configureOrigin(options, req));\n      headers.push(configureCredentials(options, req));\n      headers.push(configureExposedHeaders(options, req));\n      applyHeaders(headers, res);\n      next();\n    }\n  }\n\n  function middlewareWrapper(o) {\n    // if options are static (either via defaults or custom options passed in), wrap in a function\n    var optionsCallback = null;\n    if (typeof o === 'function') {\n      optionsCallback = o;\n    } else {\n      optionsCallback = function (req, cb) {\n        cb(null, o);\n      };\n    }\n\n    return function corsMiddleware(req, res, next) {\n      optionsCallback(req, function (err, options) {\n        if (err) {\n          next(err);\n        } else {\n          var corsOptions = assign({}, defaults, options);\n          var originCallback = null;\n          if (corsOptions.origin && typeof corsOptions.origin === 'function') {\n            originCallback = corsOptions.origin;\n          } else if (corsOptions.origin) {\n            originCallback = function (origin, cb) {\n              cb(null, corsOptions.origin);\n            };\n          }\n\n          if (originCallback) {\n            originCallback(req.headers.origin, function (err2, origin) {\n              if (err2 || !origin) {\n                next(err2);\n              } else {\n                corsOptions.origin = origin;\n                cors(corsOptions, req, res, next);\n              }\n            });\n          } else {\n            next();\n          }\n        }\n      });\n    };\n  }\n\n  // can pass either an options hash, an options delegate, or nothing\n  module.exports = middlewareWrapper;\n\n}());\n\n\n//# sourceURL=webpack://distance-learning/./node_modules/cors/lib/index.js?");

/***/ }),

/***/ "./node_modules/object-assign/index.js":
/*!*********************************************!*\
  !*** ./node_modules/object-assign/index.js ***!
  \*********************************************/
/***/ ((module) => {

"use strict";
eval("/*\nobject-assign\n(c) Sindre Sorhus\n@license MIT\n*/\n\n\n/* eslint-disable no-unused-vars */\nvar getOwnPropertySymbols = Object.getOwnPropertySymbols;\nvar hasOwnProperty = Object.prototype.hasOwnProperty;\nvar propIsEnumerable = Object.prototype.propertyIsEnumerable;\n\nfunction toObject(val) {\n\tif (val === null || val === undefined) {\n\t\tthrow new TypeError('Object.assign cannot be called with null or undefined');\n\t}\n\n\treturn Object(val);\n}\n\nfunction shouldUseNative() {\n\ttry {\n\t\tif (!Object.assign) {\n\t\t\treturn false;\n\t\t}\n\n\t\t// Detect buggy property enumeration order in older V8 versions.\n\n\t\t// https://bugs.chromium.org/p/v8/issues/detail?id=4118\n\t\tvar test1 = new String('abc');  // eslint-disable-line no-new-wrappers\n\t\ttest1[5] = 'de';\n\t\tif (Object.getOwnPropertyNames(test1)[0] === '5') {\n\t\t\treturn false;\n\t\t}\n\n\t\t// https://bugs.chromium.org/p/v8/issues/detail?id=3056\n\t\tvar test2 = {};\n\t\tfor (var i = 0; i < 10; i++) {\n\t\t\ttest2['_' + String.fromCharCode(i)] = i;\n\t\t}\n\t\tvar order2 = Object.getOwnPropertyNames(test2).map(function (n) {\n\t\t\treturn test2[n];\n\t\t});\n\t\tif (order2.join('') !== '0123456789') {\n\t\t\treturn false;\n\t\t}\n\n\t\t// https://bugs.chromium.org/p/v8/issues/detail?id=3056\n\t\tvar test3 = {};\n\t\t'abcdefghijklmnopqrst'.split('').forEach(function (letter) {\n\t\t\ttest3[letter] = letter;\n\t\t});\n\t\tif (Object.keys(Object.assign({}, test3)).join('') !==\n\t\t\t\t'abcdefghijklmnopqrst') {\n\t\t\treturn false;\n\t\t}\n\n\t\treturn true;\n\t} catch (err) {\n\t\t// We don't expect any of the above to throw, but better to be safe.\n\t\treturn false;\n\t}\n}\n\nmodule.exports = shouldUseNative() ? Object.assign : function (target, source) {\n\tvar from;\n\tvar to = toObject(target);\n\tvar symbols;\n\n\tfor (var s = 1; s < arguments.length; s++) {\n\t\tfrom = Object(arguments[s]);\n\n\t\tfor (var key in from) {\n\t\t\tif (hasOwnProperty.call(from, key)) {\n\t\t\t\tto[key] = from[key];\n\t\t\t}\n\t\t}\n\n\t\tif (getOwnPropertySymbols) {\n\t\t\tsymbols = getOwnPropertySymbols(from);\n\t\t\tfor (var i = 0; i < symbols.length; i++) {\n\t\t\t\tif (propIsEnumerable.call(from, symbols[i])) {\n\t\t\t\t\tto[symbols[i]] = from[symbols[i]];\n\t\t\t\t}\n\t\t\t}\n\t\t}\n\t}\n\n\treturn to;\n};\n\n\n//# sourceURL=webpack://distance-learning/./node_modules/object-assign/index.js?");

/***/ }),

/***/ "./node_modules/vary/index.js":
/*!************************************!*\
  !*** ./node_modules/vary/index.js ***!
  \************************************/
/***/ ((module) => {

"use strict";
eval("/*!\n * vary\n * Copyright(c) 2014-2017 Douglas Christopher Wilson\n * MIT Licensed\n */\n\n\n\n/**\n * Module exports.\n */\n\nmodule.exports = vary\nmodule.exports.append = append\n\n/**\n * RegExp to match field-name in RFC 7230 sec 3.2\n *\n * field-name    = token\n * token         = 1*tchar\n * tchar         = \"!\" / \"#\" / \"$\" / \"%\" / \"&\" / \"'\" / \"*\"\n *               / \"+\" / \"-\" / \".\" / \"^\" / \"_\" / \"`\" / \"|\" / \"~\"\n *               / DIGIT / ALPHA\n *               ; any VCHAR, except delimiters\n */\n\nvar FIELD_NAME_REGEXP = /^[!#$%&'*+\\-.^_`|~0-9A-Za-z]+$/\n\n/**\n * Append a field to a vary header.\n *\n * @param {String} header\n * @param {String|Array} field\n * @return {String}\n * @public\n */\n\nfunction append (header, field) {\n  if (typeof header !== 'string') {\n    throw new TypeError('header argument is required')\n  }\n\n  if (!field) {\n    throw new TypeError('field argument is required')\n  }\n\n  // get fields array\n  var fields = !Array.isArray(field)\n    ? parse(String(field))\n    : field\n\n  // assert on invalid field names\n  for (var j = 0; j < fields.length; j++) {\n    if (!FIELD_NAME_REGEXP.test(fields[j])) {\n      throw new TypeError('field argument contains an invalid header name')\n    }\n  }\n\n  // existing, unspecified vary\n  if (header === '*') {\n    return header\n  }\n\n  // enumerate current values\n  var val = header\n  var vals = parse(header.toLowerCase())\n\n  // unspecified vary\n  if (fields.indexOf('*') !== -1 || vals.indexOf('*') !== -1) {\n    return '*'\n  }\n\n  for (var i = 0; i < fields.length; i++) {\n    var fld = fields[i].toLowerCase()\n\n    // append value (case-preserving)\n    if (vals.indexOf(fld) === -1) {\n      vals.push(fld)\n      val = val\n        ? val + ', ' + fields[i]\n        : fields[i]\n    }\n  }\n\n  return val\n}\n\n/**\n * Parse a vary header into an array.\n *\n * @param {String} header\n * @return {Array}\n * @private\n */\n\nfunction parse (header) {\n  var end = 0\n  var list = []\n  var start = 0\n\n  // gather tokens\n  for (var i = 0, len = header.length; i < len; i++) {\n    switch (header.charCodeAt(i)) {\n      case 0x20: /*   */\n        if (start === end) {\n          start = end = i + 1\n        }\n        break\n      case 0x2c: /* , */\n        list.push(header.substring(start, end))\n        start = end = i + 1\n        break\n      default:\n        end = i + 1\n        break\n    }\n  }\n\n  // final token\n  list.push(header.substring(start, end))\n\n  return list\n}\n\n/**\n * Mark that a request is varied on a header field.\n *\n * @param {Object} res\n * @param {String|Array} field\n * @public\n */\n\nfunction vary (res, field) {\n  if (!res || !res.getHeader || !res.setHeader) {\n    // quack quack\n    throw new TypeError('res argument is required')\n  }\n\n  // get existing header\n  var val = res.getHeader('Vary') || ''\n  var header = Array.isArray(val)\n    ? val.join(', ')\n    : String(val)\n\n  // set new header\n  if ((val = append(header, field))) {\n    res.setHeader('Vary', val)\n  }\n}\n\n\n//# sourceURL=webpack://distance-learning/./node_modules/vary/index.js?");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module is referenced by other modules so it can't be inlined
/******/ 	var __webpack_exports__ = __webpack_require__("./next.congig.js");
/******/ 	
/******/ })()
;