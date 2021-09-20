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
