from datetime import date, datetime, timedelta

from django.shortcuts import redirect, render
from django.urls import reverse

from orders.models import Order

from .forms import DetailForm


def profile_view(request):
    if request.user.is_authenticated:

        form = DetailForm(instance=request.user)

        context = {
            "form": form,
        }
        return render(request, "profile.html", context)

    return redirect(reverse("account_login"))


def orders_history_view(request):
    if request.user.is_authenticated:

        orders = Order.objects.filter(user__email=request.user).all()

        context = {
            "orders": orders,
        }
        return render(request, "orders_history.html", context)

    return redirect(reverse("account_login"))


def recent_orders_view(request):
    if request.user.is_authenticated:

        # orders in past 10 days
        recent_orders = Order.objects.filter(
            order_date__range=(datetime.now() - timedelta(days=10), datetime.now()),
            user__email=request.user,
        ).all()

        context = {
            "recent_orders": recent_orders,
        }
        return render(request, "recent_orders.html", context)

    return redirect(reverse("account_login"))
