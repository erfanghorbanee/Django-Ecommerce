from allauth.account.forms import SignupForm
from django import forms


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
