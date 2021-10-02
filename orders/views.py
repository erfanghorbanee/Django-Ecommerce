from django.shortcuts import render, redirect
from products.models import Product


def basket_view(request):
    basket = request.session['basket']
    print(basket)
    product_list = dict()
    for item in basket:
        product = Product.objects.filter(id=item).first()
        product_list[product] = basket[item]

    print(product_list)

    context = {
        'products': product_list,
    }

    return render(request, 'basket.html', context)


def add_to_basket(request):
    product_id = request.POST['product-id']
    product_quantity = request.POST['product-quanity']

    request.session['basket'][str(product_id)] = product_quantity
    print(request.session['basket'], "dddd")

    return redirect("single_product", product_id=product_id)
