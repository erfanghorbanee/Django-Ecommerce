from django.shortcuts import render, redirect
from django.urls import reverse
from .models import Product, Category


def home_view(request):
    categories = Category.objects.all()
    # print(Category.objects.all())
    # print(Category.objects.prefetch_related('products').all())
    print(request.user.is_authenticated)
    print(request.user)

    context = {
        'categories': categories,
    }
    return render(request, 'products/home.html', context)


def products_view(request):
    categories = Category.objects.all()

    context = {
        'categories': categories,
    }
    return render(request, 'products/products.html', context)


def single_product_view(request, product_id):
    categories = Category.objects.all()
    product = Product.objects.filter(id=product_id).first()

    context = {
        'categories': categories,
        'product': product,
    }
    return render(request, 'products/single_product.html', context)
