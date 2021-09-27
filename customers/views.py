from django.shortcuts import render, redirect
from django.urls import reverse
from .forms import DetailForm


def profile_view(request):
    if request.user.is_authenticated:

        form = DetailForm(instance=request.user)

        context = {
            'form': form,
        }
        return render(request, 'profile.html', context)

    return redirect(reverse("account_login"))


def orders_history_view(request):
    if request.user.is_authenticated:

        form = DetailForm(instance=request.user)

        context = {
            'form': form,
        }
        return render(request, 'orders_history.html', context)

    return redirect(reverse("account_login"))


def recent_orders_view(request):
    if request.user.is_authenticated:

        form = DetailForm(instance=request.user)

        context = {
            'form': form,
        }
        return render(request, 'recent_orders.html', context)

    return redirect(reverse("account_login"))
