from django.shortcuts import render, redirect
from products.models import Product
from django.urls import reverse


def basket_view(request):
    if request.session.get('basket'):

        basket = request.session.get('basket')
        total = 0  # total price
        product_list = dict()

        for item in basket:
            product = Product.objects.filter(id=item).first()
            product_list[product] = basket[item]

            total += product.price * int(basket[item])

        context = {
            'products': product_list,
            'total': total,
        }

        return render(request, 'basket.html', context)

    else:
        # Empty basket
        return render(request, 'basket.html')


def add_to_basket(request):
    product_id = request.POST['product-id']
    product_quantity = request.POST['product-quanity']

    # add first item to the basket
    if not request.session.get('basket'):
        request.session['basket'] = {
            product_id: product_quantity
        }

    else:
        # add new items to the basket
        basket = request.session.get('basket')

        basket[product_id] = product_quantity
        request.session.modified = True

    return redirect("single_product", product_id=product_id)


def delete_from_basket(request, product_id):

    basket = request.session.get('basket')
    basket.pop(str(product_id))
    request.session.modified = True

    return redirect("basket")


def checkout(request):
    if request.user.is_authenticated:

        return render(request, 'checkout.html')

    return redirect(reverse("account_login"))
