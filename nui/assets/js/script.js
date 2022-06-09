$(() => {
    addEventListener('message', event => {
        const e = event.data;

        if (e.type === 'newAnnounces:show') {
            $.post('http://'+ GetParentResourceName() +'/boolean', JSON.stringify(true))
            $('.announce-message').text(e.text)

            $('.container').css({'top' : '2%', 'opacity': '1'})


            setTimeout(() => {
                $('.container').css({'top' : '-7%', 'opacity': '0'})
            }, e.time || 7000)

            setTimeout(() => {
                $.post('http://'+ GetParentResourceName() +'/boolean', JSON.stringify(false))
            }, e.time + 500 || 7500)
        }
    })
})