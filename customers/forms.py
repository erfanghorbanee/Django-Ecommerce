from allauth.account.forms import ChangePasswordForm, SignupForm
from django import forms
from django.contrib.auth.forms import UserCreationForm

from .models import Address, Customer


class CustomSignupForm(SignupForm):
    first_name = forms.CharField(max_length=30, label="نام")
    last_name = forms.CharField(max_length=30, label="نام خانوادگی")
    phone = forms.CharField(max_length=15, label=" شماره تماس")
    gender = forms.ChoiceField(choices=Customer.GENDER_CHOICES, label="جنسیت")

    def save(self, request):
        user = super(CustomSignupForm, self).save(request)
        user.first_name = self.cleaned_data["first_name"]
        user.last_name = self.cleaned_data["last_name"]
        user.phone = self.cleaned_data["phone"]
        user.gender = self.cleaned_data["gender"]
        user.save()
        return user


class DetailForm(forms.ModelForm):
    class Meta(UserCreationForm.Meta):
        model = Customer
        fields = ("email", "first_name", "last_name", "phone", "gender")
        labels = {
            "email": "ایمیل",
            "first_name": "نام",
            "last_name": "نام خانوادگی",
            "phone": "شماره تماس",
            "gender": "جنسیت",
        }
        widgets = {
            "email": forms.TextInput(
                attrs={"placeholder": "Email", "dir": "ltr", "type": "email"}
            ),
            "phone": forms.TextInput(attrs={"placeholder": "Phone", "dir": "ltr"}),
        }


class CustomChangePasswordForm(ChangePasswordForm):
    def __init__(self, *args, **kwargs):
        super(CustomChangePasswordForm, self).__init__(*args, **kwargs)
        self.fields.pop("oldpassword")
        self.fields["password1"].label = "گذرواژه جدید"
        self.fields["password2"].label = "تکرار گذرواژه جدید"

        self.fields["password1"].widget.attrs.update({"placeholder": "گذرواژه جدید"})
        self.fields["password2"].widget.attrs.update(
            {"placeholder": "تکرار گذرواژه جدید"}
        )


class AddressForm(forms.ModelForm):
    class Meta:
        model = Address
        fields = "__all__"
        labels = {
            "province": "استان",
            "city": "شهر",
            "postcode": "کد پستی",
            "address": "نشانی   ",
        }
        widgets = {
            "user": forms.HiddenInput(),
        }
