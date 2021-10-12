function jqxhr(method, endpoint, postdata) {
    var base_url = 'http://localhost:8080/api/v1/';
    return $.ajax({ // return the promise that `$.ajax` returns
        type: method,
        url: base_url + endpoint,
        data: postdata,
        dataType: "json"
    });
}