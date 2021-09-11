from django.shortcuts import render
from .models import Product, Category


def home_view(request):
    categories = Category.objects.all()
    print(Category.objects.all())
    print(Category.objects.prefetch_related('products').all())

    context = {
        'categories': categories,
    }
    return render(request, 'products/home.html', context)

