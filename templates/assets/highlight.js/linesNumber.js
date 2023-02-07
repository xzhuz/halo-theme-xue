"use strict";
const TABLE_NAME = "hljs-ln",
  LINE_NAME = "hljs-ln-line",
  CODE_BLOCK_NAME = "hljs-ln-code",
  NUMBERS_BLOCK_NAME = "hljs-ln-numbers",
  NUMBER_LINE_NAME = "hljs-ln-n",
  DATA_ATTR_NAME = "data-line-number",
  BREAK_LINE_REGEXP = /\r\n|\r|\n/g;

function lineNumbersInternal(element, options) {
  var internalOptions = mapOptions(element, options);

  duplicateMultilineNodes(element);

  return addLineNumbersBlockFor(element.innerHTML, internalOptions);
}

function mapOptions(element, options) {
  options = options || {};
  return {
    singleLine: getSingleLineOption(options),
    startFrom: getStartFromOption(element, options),
  };
}

function getSingleLineOption(options) {
  var defaultValue = false;
  if (options.singleLine) {
    return options.singleLine;
  }
  return defaultValue;
}

function getStartFromOption(element, options) {
  var defaultValue = 1;
  var startFrom = defaultValue;

  if (isFinite(options.startFrom)) {
    startFrom = options.startFrom;
  }

  // can be overridden because local option is priority
  var value = getAttribute(element, "data-ln-start-from");
  if (value !== null) {
    startFrom = toNumber(value, defaultValue);
  }

  return startFrom;
}

function duplicateMultilineNodes(element) {
  var nodes = element.childNodes;
  for (var node in nodes) {
    if (nodes.hasOwnProperty(node)) {
      var child = nodes[node];
      if (getLinesCount(child.textContent) > 0) {
        if (child.childNodes.length > 0) {
          duplicateMultilineNodes(child);
        } else {
          duplicateMultilineNode(child.parentNode);
        }
      }
    }
  }
}

function getLines(text) {
  if (text.length === 0) return [];
  return text.split(BREAK_LINE_REGEXP);
}

function getLinesCount(text) {
  return (text.trim().match(BREAK_LINE_REGEXP) || []).length;
}

function format(format, args) {
  return format.replace(/\{(\d+)\}/g, function (m, n) {
    return args[n] !== undefined ? args[n] : m;
  });
}

/**
 * @param {HTMLElement} element Code block.
 * @param {String} attrName Attribute name.
 * @returns {String} Attribute value or empty.
 */
function getAttribute(element, attrName) {
  return element.hasAttribute(attrName) ? element.getAttribute(attrName) : null;
}

/**
 * @param {String} str Source string.
 * @param {Number} fallback Fallback value.
 * @returns Parsed number or fallback value.
 */
function toNumber(str, fallback) {
  if (!str) return fallback;
  var number = Number(str);
  return isFinite(number) ? number : fallback;
}

function addLineNumbersBlockFor(inputHtml, options) {
  var lines = getLines(inputHtml);

  // if last line contains only carriage return remove it
  if (lines[lines.length - 1].trim() === "") {
    lines.pop();
  }

  if (lines.length > 1 || options.singleLine) {
    var html = "";

    for (var i = 0, l = lines.length; i < l; i++) {
      html += format(
        "<tr>" +
        '<td class="{0} {1}" {3}="{5}">' +
        '<div class="{2}" {3}="{5}"></div>' +
        "</td>" +
        '<td class="{0} {4}" {3}="{5}">' +
        "{6}" +
        "</td>" +
        "</tr>",
        [
          LINE_NAME,
          NUMBERS_BLOCK_NAME,
          NUMBER_LINE_NAME,
          DATA_ATTR_NAME,
          CODE_BLOCK_NAME,
          i + options.startFrom,
          lines[i].length > 0 ? lines[i] : " ",
        ]
      );
    }

    return format('<table class="{0}">{1}</table>', [TABLE_NAME, html]);
  }

  return inputHtml;
}

function duplicateMultilineNode(element) {
  var className = element.className;

  if (!/hljs-/.test(className)) return;

  var lines = getLines(element.innerHTML);

  for (var i = 0, result = ""; i < lines.length; i++) {
    var lineText = lines[i].length > 0 ? lines[i] : " ";
    result += format('<span class="{0}">{1}</span>\n', [className, lineText]);
  }

  element.innerHTML = result.trim();
}

function lineNumbersBlock(element, options) {
  if (typeof element !== "object") return;

  element.innerHTML = lineNumbersInternal(element, options);
}