function sidebarStatus() {
  if (Cookies.get('sidebar') === 'on') {
    return true;
  }
  if (Cookies.get('sidebar') === 'off') {
    return false;
  }
}

function showSidebar() {
  if ($('#sidebar').hasClass('d-block') === false) {
    $('#sidebar').addClass('d-block');
  }
  if ($('#sidebar-toggler').hasClass('active') === false) {
    $('#sidebar-toggler').addClass('active');
  }
  Cookies.set('sidebar', 'on');
}

function hideSidebar() {
  if ($('#sidebar').hasClass('d-block') === true) {
    $('#sidebar').removeClass('d-block');
  }
  if ($('#sidebar-toggler').hasClass('active') === true) {
    $('#sidebar-toggler').removeClass('active');
  }
  Cookies.set('sidebar', 'off');
}

function setSidebar() {
  if (sidebarStatus() === true) {
    showSidebar();
  } else {
    hideSidebar();
  }
}

function switchSidebar() {
  if (sidebarStatus() === true) {
    hideSidebar();
  } else {
    showSidebar();
  }
}

document.addEventListener("turbolinks:load", function() {
  setSidebar();
  $('#sidebar-toggler').on('click', function() {
    switchSidebar();
  });
});
