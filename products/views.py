from django.shortcuts import render
from .models import Product, Category


def categories_view(request):
    categories = Category.objects.all()
    print(Category.objects.all())
    print(Category.objects.prefetch_related('products').all())

    context = {
        'categories': categories,
    }
    # return render(request, 'lists/lists.html', context)

