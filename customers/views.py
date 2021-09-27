from django.shortcuts import render, redirect
from django.urls import reverse
from .forms import DetailForm
from orders.models import Order, OrderHistory


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

        orders = OrderHistory.objects.all()

        context = {
            'orders': orders,
        }
        return render(request, 'orders_history.html', context)

    return redirect(reverse("account_login"))


def recent_orders_view(request):
    if request.user.is_authenticated:

        # orders in past 10 days
        recent_orders = OrderHistory.objects.all()

        context = {
            'recent_orders': recent_orders,
        }
        return render(request, 'recent_orders.html', context)

    return redirect(reverse("account_login"))
