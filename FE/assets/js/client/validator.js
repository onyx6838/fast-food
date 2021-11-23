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
    },
    phone: (input) => {
        var re = new RegExp("(84|0[3|5|7|8|9])+([0-9]{8})\b")
        return re.test(input)
    }
}