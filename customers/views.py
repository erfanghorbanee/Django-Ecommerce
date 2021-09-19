from django.shortcuts import render
from products.models import Product, Category
from .forms import CustomSignupForm


def profile_view(request, user_id):
    categories = Category.objects.all()
    form = CustomSignupForm()

    # print(Category.objects.all())
    # print(Category.objects.prefetch_related('products').all())

    context = {
        'categories': categories,
        'form': form,
    }
    return render(request, 'profile.html', context)
