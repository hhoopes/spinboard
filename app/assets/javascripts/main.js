var $linkTitle = $(".linkTitle");
var $eachLink = $(".eachLink");

$(document).ready(function() {
  $(".markAsRead").click(function(e) {
    e.preventDefault();
    el = this;
    LinkCollection.updateDatabase(true, el)
  })
})

var Link = {
  id: function(el) {
    return $(el).parents(".eachLink").data("id");
  },

  toggleStatus: function(status, el) {
    $($el).toggleClass("hidden");

  }
}

var LinkCollection = {
  updateDatabase: function(status, el) {
    $.ajax({
      url: "/api/v1/links/" + Link.id(el) + ".json",
      method: "put",
      dataType: "json",
      data: { link: {read: status} },
      success: function() {
        Link.toggleStatus(status, el);
      }
    });
  },

}
