var app = document.getElementById('heading');

var typewriter = new Typewriter(app, {
    loop: true
});

typewriter.typeString('static site generators.')
    .pauseFor(2500)
    .deleteAll()
    .typeString('continuous integration.')
    .pauseFor(2500)
    .deleteChars(12)
    .typeString('delivery.')
    .pauseFor(2500)
    .deleteAll()
    .typeString('automated testing.')
    .pauseFor(2500)
    .start();


$(document).ready(function () {
    $("#myCarousel").on("slide.bs.carousel", function (e) {
        var $e = $(e.relatedTarget);
        var idx = $e.index();
        var itemsPerSlide = 3;
        var totalItems = $(".carousel-item").length;

        if (idx >= totalItems - (itemsPerSlide - 1)) {
            var it = itemsPerSlide - (totalItems - idx);
            for (var i = 0; i < it; i++) {
                // append slides to end
                if (e.direction == "left") {
                    $(".carousel-item")
                        .eq(i)
                        .appendTo(".carousel-inner");
                } else {
                    $(".carousel-item")
                        .eq(0)
                        .appendTo($(this).find(".carousel-inner"));
                }
            }
        }
    });
});
