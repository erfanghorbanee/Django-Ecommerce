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
    products = Product.objects.all()

    context = {
        'categories': categories,
        'products': products,
    }
    return render(request, 'products/products.html', context)
