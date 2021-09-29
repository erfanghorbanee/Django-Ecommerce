from django.shortcuts import render, redirect
from django.urls import reverse


def basket_view(request):
    if request.user.is_authenticated:

        context = {
        }
        return render(request, 'basket.html', context)

    return redirect(reverse("account_login"))
