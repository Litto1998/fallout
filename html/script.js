// script.js
$(document).ready(function() {
    let selectedIndex = 0;
    const menuItems = $('.menu-item');
    
    window.addEventListener('message', function(event) {
        if (event.data.action === "showMenu") {
            if (event.data.show) {
                $('body').fadeIn(500);
                updateSelection();
            } else {
                $('body').fadeOut(500);
            }
        }
    });

    function updateSelection() {
        menuItems.removeClass('selected');
        $(menuItems[selectedIndex]).addClass('selected');
    }

    $(document).keydown(function(e) {
        switch(e.which) {
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
                // Add your logic here
                break;
            case 'newGame':
                $.post('https://your-resource-name/menuAction', JSON.stringify({
                    action: "newGame"
                }));
                break;
            case 'openMap':
                $.post('https://your-resource-name/menuAction', JSON.stringify({
                    action: "openMap"
                }));
                break;
				  case 'rockstarEditor':
                $.post('https://your-resource-name/menuAction', JSON.stringify({
                    action: "rockstarEditor"
                }));
                break;
            case 'settings':
                $.post('https://your-resource-name/menuAction', JSON.stringify({
                    action: "settings"
                }));
                break;
            case 'exit':
                closeMenu();
                break;
        }
    }

    function closeMenu() {
        $.post('https://your-resource-name/closeMenu', JSON.stringify({}));
        $('body').fadeOut(500);
    }
});
