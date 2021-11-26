from django.shortcuts import render, redirect
from products.models import Product
from customers.models import Address
from orders.models import Order, OrderItem
from django.urls import reverse
from customers.forms import AddressForm
import random


def basket_view(request):
    if request.session.get("basket"):

        basket = request.session.get("basket")
        total = 0  # total price
        product_list = dict()

        for item in basket:
            product = Product.objects.get(
                pk=item
            )  # to get a single unique object, we use get.
            product_list[product] = basket[item]

            total += product.price * int(basket[item])

        context = {
            "products": product_list,
            "total": total,
        }

        return render(request, "basket.html", context)

    else:
        # Empty basket
        return render(request, "basket.html")


def add_to_basket(request):
    product_id = request.POST["product-id"]
    product_quantity = request.POST["product-quanity"]
    product_slug = request.POST["product-slug"]

    # add first item to the basket
    if not request.session.get("basket"):
        request.session["basket"] = {product_id: product_quantity}

    else:
        # add new items to the basket
        basket = request.session.get("basket")

        basket[product_id] = product_quantity
        request.session.modified = True

    return redirect("single_product", slug=product_slug)


def delete_from_basket(request, product_id):

    basket = request.session.get("basket")
    basket.pop(str(product_id))
    request.session.modified = True

    return redirect("basket")


def checkout(request):
    if request.user.is_authenticated:
        address_list = Address.objects.filter(user__email=request.user).all()

        form = AddressForm(request.POST or None, initial={"user": request.user})

        if form.is_valid():
            # save the form data to model
            form.save()

        context = {
            "address_list": address_list,
            "form": form,
        }

        return render(request, "checkout.html", context)

    return redirect(reverse("account_login"))


def delete_address(request, address_id):
    if request.user.is_authenticated:

        address = Address.objects.filter(pk=address_id)
        address.delete()

        return redirect(reverse("checkout"))

    return redirect(reverse("account_login"))


def create_order(request):
    if request.user.is_authenticated:
        address = Address.objects.get(pk=request.POST["address"])
        order_item_list = list()  # products in user basket
        ref_code = random.randrange(1, 10000000)
        total_price = 0

        basket = request.session.get("basket")

        # data in basket is in this format ==> {product_id: quantity, ...}
        for product_id in basket:
            item = Product.objects.filter(
                pk=product_id
            ).first()  # number of existing product in shop
            quantity = basket[product_id]  # number of product that user wants to buy

            if item.count >= int(quantity):
                Product.objects.filter(pk=product_id).update(
                    count=item.count - int(quantity)
                )  # Reduce inventory

            order_item = OrderItem.objects.create(item=item, quantity=quantity)
            order_item_list.append(order_item)
            total_price += item.price * int(quantity)  # calculate total price

        # if user entered discount code
        if request.session.get("discount"):
            amount = list(request.session.get("discount").values())[0]
            total_price -= int((total_price * amount) / 100)

            del request.session["discount"]  # clear discount code

        # create order
        order = Order.objects.create(
            user=request.user,
            address=address,
            ref_code=ref_code,
            total_price=total_price,
        )
        order.products.add(*order_item_list)

        # clear basket
        del request.session["basket"]

        return redirect(reverse("orders"))

    return redirect(reverse("account_login"))
