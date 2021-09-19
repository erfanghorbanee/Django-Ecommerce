from django.shortcuts import render, redirect
from django.urls import reverse
from .forms import RegisterForm


def profile_view(request):
    if request.user.is_authenticated:

        form = RegisterForm(instance=request.user)

        context = {
            'form': form,
        }
        return render(request, 'profile.html', context)

    return redirect(reverse("account_login"))
