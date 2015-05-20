
// main.js 

var app = {};

app.curdir = "/";
app.el = {};


app.displayFiles = function(item) {

    app.el.list.append(app.fileListTemplate(files));
};


$(document).ready(function() {
    // setup the ui
    app.el.box = $("#filebrowser");
    app.el.toolbar = $("#file-toolbar");
    app.el.list = $("#file-list");

    app.fileListTemplate = Handlebars.compile($("#file-list-template").html());

    app.displayFiles(basefile);
});


Handlebars.registerHelper('kMG', function(entry, bytes) {
    if (entry == "DIR") {
        return "";
    } else {
        var prec = 1;
        if (bytes == 0) {
            return '0 bytes';
        } else if (bytes == 1) {
            return '1 byte';
        } else if (bytes < 1024) {
            return bytes + " bytes";
        } else if (bytes < 1048576) {
            return (bytes / 1024).toFixed(prec) + " kb";
        } else if (bytes < 1073741824) {
            return (bytes / 1048576).toFixed(prec) + " mb";
        } else {
            return (bytes / 1073741824).toFixed(prec + 1) + " gb";
        }
        //var k = 1024;
        //if (bytes == 0) {
        //    return '0 Bytes';
        //} else if (bytes == 1) {
        //    return '1 Byte';
        //} else if (bytes == -1) {
        //    return '-1 Byte';
        //} else if (bytes < k) {
        //    return bytes + " Bytes";
        //}
        //var sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];
        //var i = Math.floor(Math.log(bytes) / Math.log(k));
        //return (bytes / Math.pow(k, i)).toPrecision(1) + ' ' + sizes[i];
    }
});

Handlebars.registerHelper('filecount', function(entry, count) {
    if (entry == "DIR") {
        return "(" + count + " item" + (count == 1 ? "" : "s") + ")";
    } else {
        return "";
    }
});
