from django.shortcuts import render, redirect
from django.contrib.auth import logout
from django.urls import reverse
from products.models import Product, Category


def profile_view(request):
    categories = Category.objects.all()
    # print(Category.objects.all())
    # print(Category.objects.prefetch_related('products').all())

    context = {
        'categories': categories,
    }
    return render(request, 'profile.html', context)