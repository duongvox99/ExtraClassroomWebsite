$(document).ready(function () {
    $(".deleteButton").click(function () {
        let $okHref = this.href;
        
        event.preventDefault();

        $.confirm({
            theme: 'modern',
            title: 'Bạn có thực sự muốn xoá hay không?',
            content: 'Lưu ý: Nếu đồng ý thì thao tác xoá này không thể khôi phục được!',
            type: 'orange',
            typeAnimated: true,
            columnClass: 'medium',
            buttons: {
                ok: {
                    text: 'Đồng ý',
                    btnClass: 'btn-dark',
                    action: function () {
                        window.location = $okHref;
                    }
                },
                cancel: {
                    text: 'Huỷ bỏ',
                    btnClass: 'btn-orange',
                    action: function () {
                    }
                }
            },
        });

    });
});