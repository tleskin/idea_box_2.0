$(document).ready(function(){
  var $ideasDiv = $("#ideas");

 $(".button").click(function(event){
   document.getElementById("main-button").disabled = true;

   var title = $(".title").val();
   var body = $(".body").val();

   $.post("/ideas", { title: title, body: body }).then(function(idea){
   $ideasDiv.prepend("<div class='row'><div class='col s10 offset-s2 main-col'>"
                    + "<div class='col s12 m8'><div class='card teal darken-1 z-depth-3 display-cards'>"
                    + "<div class='card-content white-text'><div class='hidden'>"
                    + idea.id
                    + "</div><span class='card-title'> <h4>"
                    + idea.title
                    + "</h4></span><p>"
                    + idea.body
                    + "</p></div><div class='card-action card-foot blue-text text-darken-4'>"
                    + "<h6 class='white-text text-lighten-4'>"
                    + idea.quality
                    + "</h6><br><a class='delete' href='#'>Delete</a>"
                    + "<a class='edit' href='/ideas/"
                    +  idea.id
                    + "/edit'>Edit</a>"
                    + "</div></div></div></div></div>");



     document.getElementById("main-button").disabled = false;
     $(".title").val("");
     $(".body").val("");
     $(".delete").on("click", deleteIdea);
     $(".edit").on("click", editIdea);
   }).fail(function() {
       alert('Error!')
       document.getElementById("main-button").disabled = false;
     });
 });

 $(".delete").on("click", deleteIdea);
 $(".edit").on("click", editIdea);

});

 function deleteIdea() {
   var all = $(this).parent().parent().text();
   var div = $(this).parent().parent().parent().parent().parent();
   var ideaId = all.trim().slice(0, 2).trim();
   var ideaId = all.trim().slice(0, 2).trim();

   $.ajax({
     method: "DELETE",
     url: "/ideas/" + ideaId,
     data: { id: ideaId },
     success:  function(){
       div.html("");
     }
   });
 };

 function editIdea() {
   $.ajax({
     type: "PATCH"

   })
 }
