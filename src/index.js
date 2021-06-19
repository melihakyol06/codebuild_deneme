exports.getTodos = async (event, context) => {

    console.log('event')
    console.log(event)

    return {
        statusCode: 200,
        body: JSON.stringify({
            message: 'OK'
        })
    }
};