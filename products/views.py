from django.shortcuts import render, redirect, get_object_or_404
from django.urls import reverse
from .models import Product, Category


def home_view(request):
    if request.user.is_authenticated:
        print("user is authenticated as", request.user)
    else:
        print("user is not authenticated")

    return render(request, "products/home.html")


def products_view(request):
    categories = Category.objects.all()

    context = {
        "categories": categories,
    }
    return render(request, "products/products.html", context)


def single_product_view(request, slug):
    # product = Product.objects.get(slug=slug)  # to get a single unique object, we use get.
    product = get_object_or_404(
        Product, slug=slug
    )  # to get a single unique object, we use get.

    context = {
        "product": product,
    }
    return render(request, "products/single_product.html", context)
