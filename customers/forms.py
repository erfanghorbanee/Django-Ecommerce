from allauth.account.forms import SignupForm
from django import forms
from django.contrib.auth.forms import UserCreationForm
from .models import Customer


class CustomSignupForm(SignupForm):
    first_name = forms.CharField(max_length=20)
    last_name = forms.CharField(max_length=20)
    phone = forms.CharField(max_length=15)

    MALE = False
    FEMALE = True
    gender_type = (
        (MALE, "male"),
        (FEMALE, "female")
    )
    gender = forms.ChoiceField(choices=gender_type)

    def signup(self, request, user):
        user.first_name = self.cleaned_data['first_name']
        user.last_name = self.cleaned_data['last_name']
        user.phone = self.cleaned_data['phone']
        user.gender = self.cleaned_data['gender']
        user.save()
        return user


class RegisterForm(forms.ModelForm):

    class Meta(UserCreationForm.Meta):
        model = Customer
        fields = ('email', 'first_name', 'last_name', 'phone', 'gender')
