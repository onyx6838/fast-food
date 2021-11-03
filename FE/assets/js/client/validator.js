const validator = {
    size: (input, maxLength, minLength) => {
        return input.length < minLength && input.length > maxLength
    },
    min: (input, minLength) => {
        return input.length < minLength
    },
    max: (input, maxLength) => {
        return input.length > maxLength
    },
    pattern: (input, pattern) => {
        var re = new RegExp(pattern);
        return re.test(input)
    },
    blank: (input) => {
        return input.length == 0;
    },
    email: (input) => {
        return /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(input)
    }
}