


    $(document).ready(function() {
        $('#episode_cartoon_title').typeahead( {
            name: "title",
            prefetch: "/admin/cartoons/cartoon_terms.json",
            remote: "/admin/cartoons/cartoon_terms?q=%QUERY"


        });

    });







