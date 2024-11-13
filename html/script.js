// script.js
$(document).ready(function() {
    let selectedIndex = 0;
    const menuItems = $('.menu-item');
    
    window.addEventListener('message', function(event) {
        if (event.data.action === "showMenu") {
            if (event.data.show) {
                $('body').fadeIn(500);
            } else {
                $('body').fadeOut(500);
            }
        }
    });

    $(document).keydown(function(e) {
        switch(e.which) {
            /*
            case 38: // up arrow
                selectedIndex = (selectedIndex - 1 + menuItems.length) % menuItems.length;
                updateSelection();
                break;
            case 40: // down arrow
                selectedIndex = (selectedIndex + 1) % menuItems.length;
                updateSelection();
                break;
            case 13: // enter
                handleMenuAction($(menuItems[selectedIndex]).data('action'));
                break;
                */
            case 27: // escape
                closeMenu();
                break;
        }
    });

    $('.menu-item').click(function() {
        handleMenuAction($(this).data('action'));
    });

    function handleMenuAction(action) {
        switch(action) {
            case 'continue':
                closeMenu()
                break;
            case "exit":
                closeMenu()
                break
            default:
                $.post(`https://${GetParentResourceName()}/menuAction`, JSON.stringify({
                    action: action
                }));
                break
        }
    }

    function closeMenu() {
        $.post(`https://${GetParentResourceName()}/closeMenu`, JSON.stringify({}));
        $('body').fadeOut(500);
    }
});
