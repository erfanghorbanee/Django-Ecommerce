from allauth.account.forms import SignupForm, ChangePasswordForm
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

    def __init__(self, *args, **kwargs):
        super(CustomSignupForm, self).__init__(*args, **kwargs)
        self.fields['email'].label = 'ایمیل'
        self.fields['first_name'].label = 'نام'
        self.fields['last_name'].label = 'نام خانوادگی'
        self.fields['phone'].label = 'شماره تماس'
        self.fields['gender'].label = 'جنسیت'
        self.fields['password1'].label = 'رمز عبور'
        self.fields['password2'].label = 'تکرار رمز عبور'

        self.fields['email'].widget.attrs.update({
            'dir': 'ltr'
        })
        self.fields['password1'].widget.attrs.update({
            'placeholder': 'رمز عبور'
        })
        self.fields['password2'].widget.attrs.update({
            'placeholder': 'تکرار رمز عبور'
        })
        self.fields['phone'].widget.attrs.update({
            'placeholder': 'Phone',
            'dir': 'ltr'
        })

    def signup(self, request, user):
        user.first_name = self.cleaned_data['first_name']
        user.last_name = self.cleaned_data['last_name']
        user.phone = self.cleaned_data['phone']
        user.gender = self.cleaned_data['gender']
        user.save()
        return user


class DetailForm(forms.ModelForm):

    class Meta(UserCreationForm.Meta):
        model = Customer
        fields = ('email', 'first_name', 'last_name', 'phone', 'gender')
        labels = {
            'email': 'ایمیل',
            'first_name': 'نام',
            'last_name': 'نام خانوادگی',
            'phone': 'شماره تماس',
            'gender': 'جنسیت',
        }
        widgets = {
            'email': forms.TextInput(attrs={'placeholder': 'Email', 'dir': 'ltr', 'type': 'email'}),
            'phone': forms.TextInput(attrs={'placeholder': 'Phone', 'dir': 'ltr'}),
        }


class CustomChangePasswordForm(ChangePasswordForm):

    def __init__(self, *args, **kwargs):
        super(CustomChangePasswordForm, self).__init__(*args, **kwargs)
        self.fields.pop('oldpassword')
        self.fields['password1'].label = 'گذرواژه جدید'
        self.fields['password2'].label = 'تکرار گذرواژه جدید'

        self.fields['password1'].widget.attrs.update({
            'placeholder': 'گذرواژه جدید'
        })
        self.fields['password2'].widget.attrs.update({
            'placeholder': 'تکرار گذرواژه جدید'
        })

