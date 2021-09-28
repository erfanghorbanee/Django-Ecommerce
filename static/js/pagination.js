function pagination_func(url = '/rest/products_list') {
    // if (url != null) {    must add regex for null

    const data = {}

    $.ajax({
        type: "GET",
        url: url,
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        success: function (data) {
            console.log('success');

            let next_page = data['links']['next']
            let previous_page = data['links']['previous']
            let products = data['results']

            $('#product_card').html("");
            $('#pagination').html("");


            // products list on each page
            for (let product in products) {
                let product_card = `<div class="col-md-4">
                                            <div class="card mb-4 product-wap rounded-0">
                                                <div class="card rounded-0">
                                                    <img class="card-img rounded-0 img-fluid" alt="product image" src='` + products[product].image[0]["image"] + `'>
                                                    <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                                        <ul class="list-unstyled">
                                                            <li><a class="btn btn-primary text-white see" href="/products/` + products[product].id + `">
                                                                مشاهده
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16">
                                                                 <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
                                                                 <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z"/>
                                                                </svg>
                                                            </a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="card-body">
                                                    <a href="#" class="h3 text-decoration-none">` + products[product].title + `</a>

                                                    <p class="text-left mb-0">` + products[product].rate + `
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" style="color: orange" class="bi bi-star-fill" viewBox="0 0 16 16">
                                                          <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                                                        </svg>
                                                    </p>

                                                    <p class="text-left mb-0">` + products[product].price + ` تومان</p>
                                                </div>
                                            </div>
                                        </div>`

                $('#product_card').append(product_card);
            }


            // pagination buttons
            if (previous_page == null) {
                let pagination = `<a href="#">❮</a>
                              <a href="#" onclick="pagination_func('` + next_page + `'); return false;">❯</a>`

                $('#pagination').append(pagination);

            } else if (next_page == null) {
                let pagination = `<a href="#" onclick="pagination_func('` + previous_page + `'); return false;">❮</a>
                                  <a href="#">❯</a>`

                $('#pagination').append(pagination);

            } else {
                let pagination = `<a href="#" onclick="pagination_func('` + previous_page + `'); return false;">❮</a>
                                  <a href="#" onclick="pagination_func('` + next_page + `'); return false;">❯</a>`

                $('#pagination').append(pagination);
            }

        },
        error: function (e) {
            console.log("ERROR : ", e);
        }
    });
    // }
}

pagination_func();
